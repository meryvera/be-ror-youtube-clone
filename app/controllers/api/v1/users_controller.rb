# frozen_string_literal: true

module Api
  module V1
    # Purpose: User controller for API v1
    class UsersController < BaseController
      before_action :authenticate_user!, except: [:create]
      # GET /api/v1/users
      def index
        @users = User.all
        render json: @users
      end

      # GET /api/v1/users/:id
      def show
        @user = User.find(params[:id])
        render json: @user
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/:id
      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/:id
      def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: { message: 'User deleted' }
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :profile_info, :avatar)
      end
    end
  end
end