class Api::RepliesController < ApplicationController
  
  def index
    @replies = Reply.all
    render 'index.json.jbuilder'
  end 
  
  def show
    the_id = params[:id]
    @reply = Reply.find_by(id: the_id)
    # @reply.created_at = time_ago_in_words(created_at)
    render 'show.json.jbuilder'
  end

  def create
    @reply = Reply.new(
      reply: params[:reply],
      discussion_id: params[:discussion_id],
      image: params[:image],
      user_id: current_user.id
      
      )
    @reply.save!
    render 'show.json.jbuilder'
  end

  def update
    #find the discussion.
    the_id = params[:id]
    @reply = Reply.find_by(id: the_id)
    #modify the reply.
    @reply.reply = params[:reply] || @reply.reply
    if 
      @reply.save
      render 'show.json.jbuilder'
    else
      @reply.save
      render 'errors.json.jbuilder'
    end
  end    

  def destroy
    #find the discussion
    the_id = params[:id]
    @reply = Reply.find_by(id: the_id)
    #destroy the reply
    @reply.destroy

    render 'destroy.json.jbuilder'
  end


end
