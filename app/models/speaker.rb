class Speaker < ApplicationRecord
  has_many :speeches, dependent: :nullify

  validate :first_or_last_name

  mount_uploader :photo, PhotoUploader

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
    stats = { speeches: 0, contributions: 0, comments: 0, votes: 0}
    stats[:speeches] = self.speeches.count
    self.speeches.each do |speech|
      stats[:votes] += speech.votes
      stats[:contributions] += speech.contributions.count
      speech.contributions.each do |contribution|
        stats[:comments] += contribution.comments.count
      end
    end
    return stats
  end

  private

  def first_or_last_name
    errors.add(:first_name, "or last name must be present") unless first_name.present? || last_name.present?
  end
end
