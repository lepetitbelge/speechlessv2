class SpeechesController < ApplicationController
  before_action :find_speech, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

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
    @speech.user = current_user
    if @speech.save
      redirect_to speech_path(@speech)
      flash[:notice] = 'Nice! speech successfully created!'
    else
      flash[:notice] = 'oops! something went wrong, could not create the speech.'
      render :new
    end
  end

  def edit
  end

  def update
    if @speech.update(speech_params)
      redirect_to speech_path(@speech)
      flash[:notice] = 'Nice! speech successfully updated!'
    else
      flash[:notice] = 'oops! something went wrong, could not update the speech.'
      render :edit
    end
  end

  def destroy
    if @speech.destroy
      redirect_to speeches_path
      flash[:notice] = 'Ok.. speech successfully deleted.'
    else
      flash[:notice] = 'oops! something went wrong, could not delete the speech.'
      render :show
    end
  end

  private

  def find_speech
    @speech = Speech.find(params[:id])
  end

  def speech_params
    params.require(:speech).permit(:title, :date, :country, :city, :category, :content, :duration)
  end
end
