class CommentsController < ApplicationController
  before_action :find_comment, only: %i[update destroy]

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.contribution = Contribution.find(params[:contribution_id])
    @contribution = comment.contribution
    if comment.save
      @speech = comment.speech
      respond_to do |format|
        format.html { redirect_to speech_path(@speech) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'speeches/show' }
        format.js
      end
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
