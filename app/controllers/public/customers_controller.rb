class Public::CustomersController < ApplicationController
  def edit
    @customer = current_customer
  end

  def show
    @customer = current_customer
  end
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path, notice: "変更内容を保存しました。"
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :telephone_number, :email, :is_active)
  end
end
