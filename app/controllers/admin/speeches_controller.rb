class Admin::SpeechesController < ApplicationController
  before_action :find_speech, only: %i[show_speech edit_speech update_speech destroy_speech]

  def index_speeches
    @speeches = Speech.all
  end

  def show_speech
  end

  def new_speech
    @speech = Speech.new
  end

  def create_speech
    @speech = Speech.new(speech_params)
    if @speech.save
      redirect_to admin_speech(@admin)
      flash[:notice] = 'Nice! speech successfully created!'
    else
      flash[:notice] = 'oops! something went wrong, speech could not be created!'
      render :new
    end
  end

  def edit_speech
  end

  def update_speech
    if @speech.update(speech_params)
      redirect_to admin_speech(@speech)
      flash[:notice] = 'Nice! speech successfully updated!'
    else
      flash[:notice] = 'oops! something went wrong, speech could not be updated!'
      render :edit
    end
  end

  def destroy_speech
    if @speech.destroy
      redirect_to admin_speeches
      flash[:notice] = 'Nice! speech successfully deleted!'
    else
      flash[:notice] = 'oops! something went wrong, speech could not be deleted!'
      render :show
    end
  end

  private

  def find_speech
    @speech = Speech.find(params[:speech_id])
  end

  def speech_params
    params.require(:speech).permit(:title, :date, :country, :city, :content, :duration)
  end
end
