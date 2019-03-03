class SpeechesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      PgSearch::Multisearch.rebuild(Speech)
      PgSearch::Multisearch.rebuild(Speaker)
      @results = PgSearch.multisearch(params[:query])
    else
      @speeches = Speech.all
      @speakers = Speaker.all
    end
  end

  def show
    @speech = Speech.find(params[:id])
    @contribution = Contribution.new
  end
end
