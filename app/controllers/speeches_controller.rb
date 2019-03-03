class SpeechesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @speeches = Speech.search(params[:query])
      @speakers = Speaker.search(params[:query])
    else
      @speeches = Speech.all
      @speakers = Speaker.all
    end
  end

  def show
    @speech = Speech.find(params[:id])
  end
end
