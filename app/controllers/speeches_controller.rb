class SpeechesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @speeches = Speech.all
    @speakers = Speaker.all
  end

  def show
    @speech = Speech.find(params[:id])
  end
end
