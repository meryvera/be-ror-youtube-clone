# frozen_string_literal: true

module Api
  module V1
    # Purpose: Base controller for API v1
    class BaseController < ActionController::Base
      protect_from_forgery with: :null_session
    end
  end
end