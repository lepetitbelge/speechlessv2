require 'json'
require 'open-uri'

class SpeakersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @speaker = Speaker.find(params[:id])
    speech_suggestions
    get_info_summary
  end

  private

  def speech_suggestions
    speeches = Speech.where(speaker: @speaker)
    # TODO: ake suggestions (order, latest, all time)
    # For now:
    @all_time_speeches = speeches
    @latest_speeches = speeches
    # CHANGE LATER
  end

  def get_info_summary
    url_base = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&titles="
    @info_summary = JSON.parse(open(url_base + @speaker.full_name).read)['query']['pages'].values.first['extract']
    if @info_summary
      @info_summary = @info_summary.match(/^[^\n]*/).to_s
      3.times do
        @info_summary.gsub!(/\s\([^\(\)]*\)/,'')
      end
    end
  end
end
