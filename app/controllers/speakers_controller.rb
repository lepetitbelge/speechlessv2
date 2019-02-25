class SpeakersController < ApplicationController
  before_action :find_speaker, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: :show

  def show
    @speeches = Speech.where(speaker: @speaker)
  end

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new(speaker_params)
    if @speaker.save
      flash[:notice] = "Speaker successfully created!"
      redirect_to speaker_path(@speaker)
    else
      flash[:alert] = "Oops! Something went wrong. Speaker couldn't be created."
      render :new
    end
  end

  def edit
  end

  def update
    if @speaker.update(speaker_params)
      flash[:notice] = "Speaker successfully updated!"
      redirect_to speaker_path(@speaker)
    else
      flash[:alert] = "Oops! Something went wrong. Speaker couldn't be updated."
      render :edit
    end
  end

  def destroy
    if @speaker.destroy
      flash[:notice] = "Speech successfully deleted!"
      redirect_to speeches_path
    else
      flash[:alert] = "Oops! Something went wrong. Speaker couldn't be deleted."
      render :show
    end
  end

  private

  def find_speaker
    @speaker = Speaker.find(params[:id])
  end

  def speaker_params
    params.require(:speaker).permit(:first_name, :last_name, :date_of_birth, :date_of_death)
  end
end
