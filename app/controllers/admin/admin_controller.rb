class Admin::AdminController < ApplicationController
  def index
    @admins = Admin.page(params[:page])
  end

  def show
  end

  def edit
  end

  def new
  end
end
