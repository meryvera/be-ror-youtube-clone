# frozen_string_literal: true

module Api
  module V1
    # Purpose: Video controller for API v1
    class VideosController < BaseController
      before_action :authenticate_user!
      before_action :set_video, only: %i[show update destroy]

      # GET /api/v1/videos
      def index
        @videos = Video.all
        render json: @videos
      end

      # GET /api/v1/videos/:id
      def show
        render json: @video
      end

      # POST /api/v1/videos
      def create
        @video = Video.new(video_params)
        if @video.save
          render json: @video, status: :created
        else
          render json: @video.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/videos/:id
      def update
        if @video.update(video_params)
          render json: @video
        else
          render json: @video.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/videos/:id
      def destroy
        @video.destroy
        render json: { message: 'Video deleted' }
      end

      private

      def set_video
        @video = Video.find(params[:id])
      end

      def video_params
        params.require(:video).permit(:title, :url, :user_id)
      end
    end
  end
end