class CommentsController < ApplicationController
  before_action :find_comment, only: %i[update destroy]

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.contribution = find_contribution
    if comment.save
      puts "Save went well, we might render with AJAX"
    else
      puts "Save went awfully wrong"
    end
  end

  def update
    if comment.update(comment_params)
      puts "Update comment went well, we might render with AJAX"
    else
      puts "Update comment went awfully wrong"
    end
  end

  def destroy
    puts "redirect to same speech page" if @contribution.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    Comment.find(params[:comment_id])
  end

  def find_contribution
    Contribution.find(params[:contribution_id])
  end
end
