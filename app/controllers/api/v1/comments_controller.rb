# frozen_string_literal: true

module Api
  module V1
    # Purpose: Comment controller for API v1
    class CommentsController < BaseController
      before_action :authenticate_user!
      before_action :set_comment, only: %i[show update destroy]

      # GET /api/v1/comments
      def index
        @comments = Comment.all
        render json: @comments
      end

      # GET /api/v1/comments/:id
      def show
        render json: @comment
      end

      # POST /api/v1/comments
      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/comments/:id
      def update
        if @comment.update(comment_params)
          render json: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/comments/:id
      def destroy
        @comment.destroy
        render json: { message: 'Comment deleted' }
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:text, :user_id, :video_id)
      end
    end
  end
end