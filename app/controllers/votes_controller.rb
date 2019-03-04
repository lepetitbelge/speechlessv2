class VotesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def upvote
    @new_value = 1
    save_vote
    if @vote.save
      @speech.vote_sum += @new_value
      puts "````````Vote sum of speech didn't get updated" unless @speech.save
      respond_to do |format|
        format.html { redirect_to speech_path(@speech) }
        format.js
      end
    else
      puts "Save went wrong, maybe bacause the user alreade upvoted or downvoted and thus cannot upvote or downvote again (updating is possible though)"
    end
  end

  def downvote
    @new_value = -1
    save_vote
    if @vote.save
      @speech.vote_sum += @vote.value
      puts "````````Vote sum of speech didn't get updated" unless @speech.save
      respond_to do |format|
        format.html { redirect_to speech_path(@speech) }
        format.js
      end
    else
      puts "Save went wrong, maybe bacause the user alreade upvoted or downvoted and thus cannot upvote or downvote again (updating is possible though)"
    end
  end

  private

  def save_vote
    votable = params[:contribution_id] ? Contribution.find(params[:contribution_id]) : Comment.find(params[:comment_id])
    @vote = Vote.where(user_id: current_user.id, votable_id: votable.id, votable_type: votable.class.to_s).first_or_initialize
    @vote.value += @new_value
    @speech = @vote.votable.speech
  end
end
