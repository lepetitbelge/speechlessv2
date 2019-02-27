class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    speech_suggestions
    speaker_suggestions
  end

  private

  def speech_suggestions
  	# TODO: Algorithm to make suggestions
  	# For now:
  	@speeches = Speech.all.sample(5)
  	# CHANGE LATER
  end

  def speaker_suggestions
    @speakers = Speaker.all.sample(5)
  end

end
