class CommentsController < ApplicationController


  def create
    @comment = current_user.comments.build(comment_param)
  end



private

def comment_param
  params.require(:comments).permit(:content)


end
