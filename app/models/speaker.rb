class Speaker < ApplicationRecord
  has_many :speeches

  validate :first_or_last_name

  def full_name
    if self.first_name.nil?
      "#{self.last_name}"
    elsif self.last_name.nil?
      "#{self.first_name}"
    else
      "#{self.first_name} #{self.last_name}"
    end
  end

  def speaker_total_contributions
    speaker_contributions = 0
    self.speeches.each do |speech|
       speaker_contributions += speech.contributions.count
    end
    return speaker_contributions
  end

  def speaker_total_comments
    speaker_comments = 0
    self.speeches.each do |speech|
      speech.contributions.each do |contribution|
        speaker_comments += contribution.comments.count
      end
    end
    return speaker_comments
  end

  def speaker_total_votes
    speaker_votes = 0
    self.speeches.each do |speech|
      speech.contributions.each do |contribution|
        speaker_votes += contribution.votes.count
        contribution.comments.each do |comment|
          speaker_votes += comment.votes.count
        end
      end
    end
    return speaker_votes
  end

  private

  def first_or_last_name
    errors.add(:first_name, "or last name must be present") unless first_name.present? || last_name.present?
  end
end
