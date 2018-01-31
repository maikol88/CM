class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(users_params)

    if @user.save
      flash[:success] = "Your USER was CREATED successfully!"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(users_params)
      flash[:success] = "Your USER was UPDATED successfully!"
      redirect_to users_path(@user)
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
  def users_params
    params.require(:user).permit(:username, :email, :default_pic, :picture)
  end

end
