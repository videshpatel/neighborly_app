class Api::ChannelsController < ApplicationController
  
  def index
    @channels = Channel.all
    render 'index.json.jbuilder'
  end 

  def create
    @channel = Channel.new(
      channel: params[:channel]
      )
    @channel.save!
    render 'show.json.jbuilder'
  end

  def update
    #find the discussion.
    the_id = params[:id]
    @channel = Channel.find_by(id: the_id)
    #modify the channel.
    @channel.channel = params[:channel] || @channel.channel
    if 
      @channel.save
      render 'show.json.jbuilder'
    else
      @channel.save
      render 'errors.json.jbuilder'
    end
  end    

  def destroy
    #find the discussion
    the_id = params[:id]
    @channel = Channel.find_by(id: the_id)
    #destroy the channel
    @channel.destroy

    render 'destroy.json.jbuilder'
  end


end
