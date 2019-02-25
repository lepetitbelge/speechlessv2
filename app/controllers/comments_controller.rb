class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.contribution = find_speech
    if comment.save
      puts "Save went well, we might render with AJAX"
    else
      puts "Save went awfully wrong"
    end
  end

  def update
    if comment.update(comment_params)
      puts "Update went well, we might render with AJAX"
    else
      puts "Update went awfully wrong"
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    Comment.find(params[:comment_id])
  end
end
