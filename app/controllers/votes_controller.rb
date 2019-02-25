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
    vote = Vote.where(user_id: current_user.id)
    if vote.empty?
      
    else
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
