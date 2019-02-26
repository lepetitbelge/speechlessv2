class CommentsController < ApplicationController
  before_action :find_comment, only: %i[update destroy]

  def create
    byebug
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.contribution = Contribution.find(params[:contribution_id])
    if comment.save
      puts "Save went well, we might render with AJAX"
    else
      puts "Save went awfully wrong"
    end
    redirect_to speech_path(comment.contribution.speech)
  end

  def update
    if comment.update(comment_params)
      puts "Update comment went well, we might render with AJAX"
    else
      puts "Update comment went awfully wrong"
    end
  end

  def destroy
    if @comment.destroy
      puts "redirect to same speech page"
    else
      puts "Delete went awfully wrong"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    byebug
    @comment = Comment.find(params[:comment_id])
  end
end
