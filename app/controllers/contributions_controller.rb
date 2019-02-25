class ContributionsController < ApplicationController
  before_action :find_contribution, only: %i[update destroy]

  def create
    # maybe need to make a speech here, can't test this fully until we have a speech view
    contribution = Contribution.new(contribution_params)
    contribution.user = current_user
    contribution.speech = find_speech
    if contribution.save
      puts "Save went well, we might render with AJAX"
    else
      puts "Save went awfully wrong"
    end
  end

  def update
    if contribution.update(contribution_update_params)
      puts "Update went well, we might render with AJAX"
    else
      puts "Update went awfully wrong"
    end
  end

  def destroy
    puts "redirect to same speech page" if @contribution.destroy
  end

  private

  def contribution_params
    params.require(:contribution).permit(:content, :start_position, :end_position)
  end

  def contribution_update_params
    params.require(:contribution).permit(:content)
  end

  def find_contribution
    contribution = Contribution.find(params[:contribution_id])
  end

  def find_speech
    speech = Speech.find(params[:speech_id])
  end
end
