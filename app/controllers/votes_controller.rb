class VotesController < ApplicationController
  before_action :set_vote, only: :save_or_update_vote
  after_action :save_or_update_vote, only: %i[upvote downvote]
  def upvote
    new_value = 1
  end

  def downvote
    new_value = -1
  end

  private

  def save_or_update_vote
    @vote.id ? update_vote : save_vote
  end

  def save_vote
    if vote.save
      puts "Save went well, we might render with AJAX"
    else
      puts "Save went awfully wrong"
    end
  end

  def update_vote
    if @vote.update
      "Update went well, we might render with AJAX"
    else
      "Update did not go awfully wrong, but value can't be greater than 1 or smaller than -1"
    end
  end

  def set_vote
    byebug
    if params[:contribution_id].exist?
      votable = Contribution.find(params[:contribution_id])
    else
      votable = Comment.find(params[:comment_id])
    end
    @vote = Vote.where(user_id: current_user.id, votable_id: votable.id, votable_type: votable.class.to_s).first_or_initialize
    @vote.value += new_value
  end
end
