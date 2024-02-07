module Api
  module V1
    # Purpose: LikeDislike controller for API v1
    class LikeDislikesController < BaseController
      # before_action :authenticate_user!
      include JwtAuthenticatable
      before_action :set_like_dislike, only: [:destroy]

      # GET /api/v1/like_dislikes
      def index
        @like_dislikes = LikeDislike.all
        render json: @like_dislikes
      end

      # POST /api/v1/like_dislikes
      def create
        @like_dislike = LikeDislike.new(like_dislike_params)

        if @like_dislike.save
          render json: @like_dislike, status: :created
        else
          render json: @like_dislike.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/like_dislikes/:id
      def destroy
        @like_dislike.destroy
        render json: { message: 'Like/Dislike deleted' }
      end

      private

      def set_like_dislike
        @like_dislike = LikeDislike.find(params[:id])
      end

      def like_dislike_params
        params.require(:like_dislike).permit(:like, :user_id, :like_dislike_model_type, :like_dislike_model_id)
      end
    end
  end
end