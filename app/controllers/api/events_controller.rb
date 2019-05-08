class Api::EventsController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :create, :update, :destroy]

  def index
    @events = Event.all
    render 'index.json.jbuilder'
  end 
  
  def show
    the_id = params[:id]
    @event = Event.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    @event = Event.new(
      date: params[:date],
      title: params[:title],
      desc: params[:desc],
      
      )
    @event.save!
    render 'show.json.jbuilder'
  end

  def update
    #find the event.
    the_id = params[:id]
    @event = Event.find_by(id: the_id)
    #modify the event.
    @event.date = params[:date] || @event.event
    @event.title = params[:title] || @event.event
    @event.desc = params[:desc] || @event.event

    if 
      @event.save
      render 'show.json.jbuilder'
    else
      @event.save
      render 'errors.json.jbuilder'
    end
  end    

  def destroy
    #find the event
    the_id = params[:id]
    @event = Event.find_by(id: the_id)
    #destroy the event
    @event.destroy

    render 'destroy.json.jbuilder'
  end
end
