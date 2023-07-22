# frozen_string_literal: true

module Api
  class PrefecturesController < ApplicationController
    before_action :authenticate_api_user!

    def index
      prefectures = Prefecture.all
      render json: prefectures
    end
  end
end
