class Speaker < ApplicationRecord
  has_many :speeches, dependent: :nullify

  validate :first_or_last_name

  include PgSearch
  multisearchable :against => [:first_name, :last_name]

  def full_name
    if self.first_name.nil?
      "#{self.last_name}"
    elsif self.last_name.nil?
      "#{self.first_name}"
    else
      "#{self.first_name} #{self.last_name}"
    end
  end

  def total_stats
    stats = {speeches: 0, contributions: 0, comments: 0, comments_votes: 0, contributions_votes: 0}
    stats[:speeches] = self.speeches.count
    self.speeches.each do |speech|
      stats[:contributions] += speech.contributions.count
      speech.contributions.each do |contribution|
        stats[:contributions_votes] += contribution.vote_sum
        stats[:comments] += contribution.comments.count
        contribution.comments.each do |comment|
          stats[:comments_votes] += comment.vote_sum
        end
      end
    end
    return stats
  end

  def total_votes
    self.total_stats[:comments_votes] + self.total_stats[:contributions_votes]
  end

  private

  def first_or_last_name
    errors.add(:first_name, "or last name must be present") unless first_name.present? || last_name.present?
  end
end
