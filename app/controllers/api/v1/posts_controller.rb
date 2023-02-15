module Api
  module V1
    class PostsController < ApplicationController
      before_action :load_post
      def index
        posts = Post.all
        
        return render json: { posts: [] }, status: :ok if posts.empty?

        render json: { posts: posts}, status: :ok
      end

      def show
        render json: { post: @post }, status: :ok
      end

      private
        def load_post
          @post = Post.find params[:id]
        end
    end
  end
end