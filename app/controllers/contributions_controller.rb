class ContributionsController < ApplicationController
  def create
    # maybe need to make a speech here, can't test this fully until we have a speech view
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      puts "We might do this with AJAX"
    else
      puts "This went awfully wrong"
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
