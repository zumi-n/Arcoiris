class UsersController < ApplicationController

  def index
    @propositions = Proposition.where(user_id: current_user.id).order("created_at DESC")
    @projects = Project.where(user_id: current_user.id).order("created_at DESC")
  end

  def list
    @users = User.where.not(id: current_user.id)
  end

  def followlist
    @users = User.where.not(id: current_user.id)
  end


  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def follow
    @user = User.find(params[:id])
    #ログイン中のユーザーで対象のユーザー(@user)をフォローする
    current_user.follow(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    #ログイン中のユーザーで対象のユーザー(@user)をフォロー解除する
    current_user.stop_following(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
