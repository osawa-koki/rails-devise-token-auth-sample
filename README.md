# rails-devise-token-auth-sample

🫦🫦🫦 APIモードのRailsで認証機能(devise_token_auth)を使用してみる！  

## 準備方法

### Deviseの準備

```shell
bundle add devise_token_auth
rails g devise:install
rails g devise_token_auth:install User auth
```

`./config/routes.rb`に以下の行を追加します。  

```rb
mount_devise_token_auth_for 'User', at: 'auth'
```

`./config/application.rb`に以下の行を追加します。  

```rb
config.session_store :cookie_store, key: '_interslice_session'
config.middleware.use ActionDispatch::Cookies
config.middleware.use config.session_store, config.session_options
```

また、変更できるプロパティを増やすためには、`ApplicationController`に以下の行を追加します。  
※ 以下の例では、`name`と`nickname`を変更できるようにしています。  

```shell
before_action :configure_permitted_parameters, if: :devise_controller?

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:account_update, keys: %i[name nickname])
end
```

認証に関するリクエストの詳細は、`sample.http`を参照してください。  
`VS Code`の`REST Client`拡張機能を使用しています。  

### CORSの設定

`bundle add rack-cors`で`rack-cors`をインストールします。  

`./config/initializers/cors.rb`の以下の行のコメントアウトを外します。  

```rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:3000'
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
```

## 使い方

`authenticate_api_user!`メソッドで認証を行います。  
※ メソッド名はルーティングによって異なります。  
一般的には、`before_action :authenticate_user!`メソッドで自動的に認証を行うように登録します。  

また、ユーザ情報は`current_api_user`メソッドで取得できます。  
こちらもメソッド名はルーティングによって異なります。  
