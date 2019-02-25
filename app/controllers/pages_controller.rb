class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home

  end

  private

  def speech_suggestions
  	# TODO: Algorithm to make suggestions
  	# For now:
  	@speeches = Speech.sample(5)
  	# CHANGE LATER
  end

end
