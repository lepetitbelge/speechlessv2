class Admin::SpeakersController < ApplicationController
  before_action :find_speaker, only: %i[show edit update destroy]

  def index
    @speakers = Speaker.all
  end

  def show
  end

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new(speaker_params)
    if @speaker.save
      redirect_to admin_speaker_path(@speaker)
      flash[:notice] = 'Nice! Speaker successfully created!'
    else
      flash[:alert] = 'Oops! Something went wrong, speaker could not be created!'
      render :new
    end
  end

  def edit
  end

  def update
    if @speaker.update(speaker_params)
      redirect_to admin_speaker_path(@speaker)
      flash[:notice] = 'Nice! Speaker successfully updated!'
    else
      flash[:alert] = 'Oops! Something went wrong, speaker could not be updated!'
      render :edit
    end
  end

  def destroy
    if @speaker.destroy
      redirect_to admin_speakers_path
      flash[:notice] = 'Nice! Speaker successfully deleted!'
    else
      flash[:alert] = 'Oops! Something went wrong, speaker could not be deleted!'
      render :show
    end
  end

  private

  def find_speaker
    @speaker = Speaker.find(params[:id])
  end

  def speaker_params
    params.require(:speaker).permit(:first_name, :last_name, :date_of_birth, :date_of_death, :bio, :photo)
  end
end
