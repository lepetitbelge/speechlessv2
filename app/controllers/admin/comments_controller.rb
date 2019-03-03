class Admin::CommentsController < ApplicationController
  def destroy
    if Comment.find(params[:id]).destroy
      redirect_to admin_comments_path
      flash[:notice] = 'Nice! Comment successfully deleted!'
    else
      flash[:alert] = 'Oops! Something went wrong, comment could not be deleted!'
      render :show
    end
  end
end
