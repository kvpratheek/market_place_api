class Api::V1::UsersController < ApplicationController
  before_action(:set_user, only: [ :update, :destroy ])

  before_action :check_owner, only: %i[update destroy]

  def show
    # render(json: User.find(params[:id]).to_json(except: [:password_digest]))
    options = { include: [:products] }
    render(json: UserSerializer.new(User.find(params[:id]), options).serializable_hash.to_json)
  end

  def index
    render(json: User.all)
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

  def destroy
    puts "Destroy called"
  end

  private
  def user_params
    puts "User parameter #{params}"
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_owner
    head :forbidden unless @user.id == get_current_user&.id
  end
end
