class SpeechesController < ApplicationController
  before_action :find_speech, only: %i[show edit destroy]
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
    else
      flash[:notice] = 'oops! something went wrong, could not create speech.'
      render :new
    end
  end

  def edit
  end

  def update
    if @speech.update(speech_params)
      redirect_to speech_path(@speech)
    else
      flash[:notice] = 'oops! something went wrong, could not update speech.'
      render :edit
    end
  end

  def destroy
    if @speech.destroy
      redirect_to speeches_path
    else
      render :show
    end
  end

  private

  def find_speech
    @speech = Speech.find(params[:id])
  end
end
