class SpeakersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @speaker = Speaker.find(params[:id])
    @speeches = Speech.where(speaker: @speaker)
  end
end
