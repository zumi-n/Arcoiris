class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
  end

  def new
    @propositions = Proposition.order("created_at DESC")
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_ path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to root_path(@group), notice: 'グループを編集しました'
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, { :user_ids => []} )
  end

end
