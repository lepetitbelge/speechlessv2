class Admin::ContributionsController < ApplicationController
  def destroy
  	speech = Contribution.find(params[:id]).speech
    if Contribution.find(params[:id]).destroy
      redirect_to admin_speech_path(speech)
      flash[:notice] = 'Nice! Contribution successfully deleted!'
    else
      flash[:alert] = 'Oops! Something went wrong, contribution could not be deleted!'
      render :show
    end
  end
end
