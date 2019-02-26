class VotesController < ApplicationController
  before_action :set_vote, only: :save_or_update_vote
  
  def upvote
    @new_value = 1
    save_vote
    if @vote.votable_type = "Contribution"
      redirect_to speech_path(@vote.votable.speech)
    else
      redirect_to speech_path(@vote.votable.contribution.speech)
    end
  end

  def downvote
    @new_value = -1
    save_vote
    if @vote.votable_type = "Contribution"
      redirect_to speech_path(@vote.votable.speech)
    else
      redirect_to speech_path(@vote.votable.contribution.speech)
    end
  end

  private

  def save_vote
    votable = params[:contribution_id] ? Contribution.find(params[:contribution_id]) : Comment.find(params[:comment_id])
    @vote = Vote.where(user_id: current_user.id, votable_id: votable.id, votable_type: votable.class.to_s).first_or_initialize
    @vote.value += @new_value
    if @vote.save
      puts "Save went well, we might render with AJAX"
    else
      puts "Save went wrong, maybe bacause the user alreade upvoted or downvoted and thus cannot upvote or downvote again (updating is possible though)"
    end
  end
end
