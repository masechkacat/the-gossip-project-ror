class CommentsController < ApplicationController
    def create
        @gossip = Gossip.find(params[:gossip_id])
        @comment = @gossip.comments.build(comment_params)

        @comment.gossip = @gossip
        @comment.user = current_user


        if @comment.save
            redirect_to @gossip, notice: "Comment created successfully."
        else
            puts @comment.errors.full_messages
            redirect_to root_path, alert: "Failed to create comment."
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :gossip_id)
    end
end
  