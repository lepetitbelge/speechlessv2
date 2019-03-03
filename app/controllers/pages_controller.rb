class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    speech_suggestions
  end

  private

  def speech_suggestions
    # TODO: Algorithm to make suggestions
    # For now:
    @all_time_speeches = Speech.all.sample(3)
    @trending_speeches = Speech.all.sample(3)
    # CHANGE LATER
  end

end
