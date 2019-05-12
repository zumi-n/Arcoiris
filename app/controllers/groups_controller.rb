class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
    @users = User.where.not(id: current_user.id ).where( 'name LIKE(?)', "%#{params[:keyword]}%" )
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  def destroy
    group = Group.find(params[:id])
      group.destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, :content, { :user_ids => []} )
  end

end
