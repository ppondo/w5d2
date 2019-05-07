class CommentsController < ApplicationController
    def new
    end

    def create
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end