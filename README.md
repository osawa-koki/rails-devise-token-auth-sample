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

認証に関するリクエストの詳細は、`sample.http`を参照してください。  
`VS Code`の`REST Client`拡張機能を使用しています。  

### 
