class ContributionsController < ApplicationController
  before_action :find_contribution, only: %i[update destroy]

  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.user = current_user
    @contribution.speech = Speech.find(params[:speech_id])
    @speech = @contribution.speech
    if @contribution.save
      @speech.update(content: params[:speech_html])
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
    if @contribution.update(contribution_update_params)
      puts "Update went well, we might render with AJAX"
    else
      puts "Update went awfully wrong"
    end
  end

  def destroy
    if @contribution.destroy
      puts "redirect to same speech page"
    else
      puts "Delete went awfully wrong"
    end
  end

  private

  def contribution_params
    params.require(:contribution).permit(:content, :selection_uui, :paragraph)
  end

  def contribution_update_params
    params.require(:contribution).permit(:content)
  end

  def find_contribution
    @contribution = Contribution.find(params[:contribution_id])
  end
end
