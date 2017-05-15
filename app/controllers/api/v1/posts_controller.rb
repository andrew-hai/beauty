module Api::V1
  class PostsController < Api::ApplicationController
    def index
      render json: Post.all.as_json(only: [:title, :text])
    end
  end
end
