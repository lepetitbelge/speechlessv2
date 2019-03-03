class Admin::ContributionsController < ApplicationController
  def destroy
    if Contribution.find(params[:id]).destroy
      redirect_to admin_contributions_path
      flash[:notice] = 'Nice! Contribution successfully deleted!'
    else
      flash[:alert] = 'Oops! Something went wrong, contribution could not be deleted!'
      render :show
    end
  end
end
