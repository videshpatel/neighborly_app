class Api::DiscussionsController < ApplicationController
  # before_action :authenticate_admin, except: [:index, :show]
  #before_action :authenticate_admin, only: [:create, :update, :destroy]

 #everyone
  def index

    @discussions = Discussion.all

    
    render 'index.json.jbuilder'
  end 
  #everyone
  def show
    # p 'current_user'
    # p current_user
    the_id = params[:id]
    @discussion = Discussion.find_by(id: the_id)
    render 'show.json.jbuilder'
  end
  #admin
  def create
    @discussion = Discussion.new(
      title: params[:title],
      content: params[:content]
     )
    
    @discussion.save
    render 'show.json.jbuilder'
    
  end
  #admin
  def update
    #find the discussion.
    the_id = params[:id]
    @discussion = Discussion.find_by(id: the_id)
    #modify the discussion.
    @discussion.title = params[:title] || @discussion.title
    @discussion.content = params[:content] || @discussion.content
    
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