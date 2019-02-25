class ContributionsController < ApplicationController
  def create
    @speech = params[:speech_id]
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      redirect_to speech_path(@speech)
    else
      c
  end

  def update

  end

  def destroy

  end

  private

  def contribution_params
    params.require(:contribution).permit(:content, :start_position, :end_position)
  end
end
