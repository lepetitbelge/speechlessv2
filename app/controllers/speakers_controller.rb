require 'json'
require 'open-uri'

class SpeakersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @speaker = Speaker.find(params[:id])
    @speeches = Speech.where(speaker: @speaker)
    get_info_summary
  end

  private

  def get_info_summary
    url_base = "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&titles="
    @info_summary = JSON.parse(open(url_base + @speaker.full_name).read)['query']['pages'].values.first['extract']
  end
end
