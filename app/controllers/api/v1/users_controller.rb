class Api::V1::UsersController < ApplicationController
  before_action(:set_user, only: [ :update ] )

  def show
    render(json: User.find(params[:id]))
  end

  def create
    user = User.new(user_params)
    if user.save
      render(json: user, status: :created)
    else
      render(json: user.errors, status: :unprocessable_entity)
    end
  end

  def update
    puts "Update called"
  end

  def user_params
    puts "User parameter #{params}"
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
