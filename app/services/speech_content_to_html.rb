class SpeechContentToHtml
  def initialize(text)
    @text = text
  end

  def perform
    clean_text
    text_to_html
  end

  private

  def clean_text
    @text.gsub!(/\r/,'')
  end

  def text_to_html
    @text.split(/\n/).each_with_index.map do |paragraph, index|
      "<p data-index=#{index}>#{paragraph}</p>"
    end.join
  end
end