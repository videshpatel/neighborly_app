class Api::UsersController < ApplicationController
  
  def index
    @users = User.all
    render 'index.json.jbuilder'
  end 
  #everyone

  def show
    the_id = params[:id]
    @user = User.find_by(id: the_id)
    render 'show.json.jbuilder'
  end
  def create
    user = User.new(
      street_1: params[:street_1],
      street_2: params[:street_2],
      city: params[:city],
      state: params[:state],
      postal_code: params[:postal_code],
      country: params[:country],
      username: params[:username],
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]

    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
