class Admin::SpeechesController < ApplicationController
  before_action :find_speech, only: %i[show edit update destroy]

  def index
    @speeches = Speech.all
  end

  def show
  end

  def new
    @speech = Speech.new
  end

  def create
    @speech = Speech.new(speech_params)
    @speech.duration = nil if @speech.duration == 0
    if @speech.save
      redirect_to admin_speech_path(@speech)
      flash[:notice] = 'Nice! speech successfully created!'
    else
      flash[:alert] = 'oops! something went wrong, speech could not be created!'
      render :new
    end
  end

  def edit
  end

  def update
    if @speech.update(speech_params)
      redirect_to admin_speech_path(@speech)
      flash[:notice] = 'Nice! speech successfully updated!'
    else
      flash[:alert] = 'oops! something went wrong, speech could not be updated!'
      render :edit
    end
  end

  def destroy
    if @speech.destroy
      redirect_to admin_speeches_path
      flash[:notice] = 'Nice! speech successfully deleted!'
    else
      flash[:alert] = 'oops! something went wrong, speech could not be deleted!'
      render :show
    end
  end

  private

  def find_speech
    @speech = Speech.find(params[:id])
  end

  def speech_params
    params.require(:speech).permit(:title, :date, :country, :city, :content, :duration, :speaker_id, :category_id)
  end
end
