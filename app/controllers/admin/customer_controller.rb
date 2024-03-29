class Admin::CustomerController < ApplicationController
  before_action :authenticate_admin!
#顧客情報管理
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]="変更内容を保存しました。"
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  def orders
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page]).order(id: "DESC")
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :telephone_number, :email, :is_active)
  end

end
