class Api::DiscussionsController < ApplicationController
  # before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  # before_action :find_channels, only: [:index, :show, :new, :edit]
  before_action :authenticate_user, only: [:index, :show, :create, :update, :destroy]
 #everyone
  def index

    @discussions = Discussion.all

    
    render 'index.json.jbuilder'
  end 
  #everyone
  def show
    p 'current_user'
    p current_user
    the_id = params[:id]
    @discussion = Discussion.find_by(id: the_id)
    render 'show.json.jbuilder'

  end
  #admin
  def create
    @discussion = Discussion.new(
      title: params[:title],
      content: params[:content],
      user_id: current_user.id,
      channel_id: params[:channel_id],
      image: params[:image]
     )
    
    if 
      @discussion.save
      render 'show.json.jbuilder'
    else
      @discussion.save
      render 'errors.json.jbuilder'
    end
   
    
  end
  #admin
  def update
    #find the discussion.
    the_id = params[:id]
    @discussion = Discussion.find_by(id: the_id)
    #modify the discussion.
    @discussion.title = params[:title] || @discussion.title
    @discussion.content = params[:content] || @discussion.content
    @discussion.image = params[:image] || @discussion.image
    
    if 
      @discussion.save
      render 'show.json.jbuilder'
    else
      @discussion.save
      render 'errors.json.jbuilder'
    end
  end    
  #admin
  def destroy
    #find the discussion
    the_id = params[:id]
    @discussion = Discussion.find_by(id: the_id)
    #destroy the discussion
    @discussion.destroy

    render 'destroy.json.jbuilder'
  end

end