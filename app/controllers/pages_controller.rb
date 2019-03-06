class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    speech_suggestions
  end

  private

  def speech_suggestions
    speeches = Speech.all
    @all_time_speeches = speeches.sort_by(&:vote_sum).first(3)
    @trending_speeches = speeches.sample(3)
  end

end
