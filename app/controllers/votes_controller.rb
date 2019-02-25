class VotesController < ApplicationController
  after_action :vote, only: %i[upvote downvote]
  def upvote
    new_value = 1
  end

  def downvote
    new_value = -1
  end

  private

  def vote
    set_votable
    vote = Vote.where(user_id: current_user.id, votable_id: votable.id, votable_type: votable.class)
    if vote.empty?
      vote = Vote.new(value: new_value)
      vote.votable = votable
      vote.user = current_user
      if vote.save
        puts "Save went well, we might render with AJAX"
      else
        puts "Save went awfully wrong"
      end
    else
      vote.first.value += new_value
      if vote.update
        "Update went well, we might render with AJAX"
      else
        "Update did not go awfully wrong, but value can't be greater than 1 or smaller than -1"
      end
    end
  end

  def set_votable
    if params[:contribution_id].exist?
      votable = Contribution.find(params[:contribution_id])
    else
      votable = Comment.find(params[:comment_id])
    end
  end
end
