class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit]

  def new
    @user = User.new
    render inline: "Something" if true
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, flash: { my_custom_key: "This is a flash message" }
    else
      flash.now[:notice] = "Save failed. Try again!"
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  private

    def user_params
      params.require(:user).permit(:name, :age)
    end

    def find_user
      @user = User.find(params.require(:id))
    end
end
