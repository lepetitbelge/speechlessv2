class SpeakersController < ApplicationController
  before_action :find_speaker, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :show

  def show
    @speeches = Speech.where(speaker: self)
  end

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new(speaker_params)

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_speaker
    @speaker = Speaker.find(params[:id])
  end

  def speaker_params
    params.require(:speaker).permit(:first_name, :last_name, :date_of_birth, :date_of_death)
  end
end
