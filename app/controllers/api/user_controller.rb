# frozen_string_literal: true

module Api
  class UserController < ApplicationController
    before_action :authenticate_api_user!

    def index
      render json: current_api_user
    end
  end
end
