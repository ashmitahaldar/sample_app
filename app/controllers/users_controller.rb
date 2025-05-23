class UsersController < ApplicationController
  before_action :logged_in_user, only: [ :index, :edit, :update, :destroy ]
  before_action :correct_user, only: [ :edit, :update ]
  before_action :admin_user, only: [ :destroy ]

  def index
    @users = User.activated_users.paginate(page: params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:danger] = "User not found."
      redirect_to root_path
    end
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:success] = t("edit_user.flash_updated")
      redirect_to(user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:success] = t("edit_user.flash_deleted")
    redirect_to users_url, status: :see_other
  end

  def following
    @title = "Following"
    @user = User.find_by(id: params[:id])
    @users = @user.following.paginate(page: params[:page])
    render :show_follow, status: :unprocessable_entity
  end

  def followers
    @title = "Followers"
    @user = User.find_by(id: params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render :show_follow, status: :unprocessable_entity
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

  # Before filters

  # Confirms the correct user
  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to(root_url, status: :see_other) unless current_user?(@user)
  end

  # Confirms an admin user
  def admin_user
    redirect_to(root_url, status: :see_other) unless current_user.admin?
  end
end
