class Admin::AdminController < ApplicationController
  def index
    @admins = Admin.page(params[:page])
  end

  def show
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      flash[:notice]="変更内容を保存しました。"
      redirect_to admin_admin_index_path
    else
      render :edit
    end
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice]="保存しました。"
      redirect_to admin_admin_index_path
    else
      render :new
    end
  end


  private

  def admin_params
    params.require(:admin).permit(:name, :phone_number, :email, :is_active, :password)
  end

end
