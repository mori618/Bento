class Public::AddressController < ApplicationController

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to customer_path, notice: "作成を完了しました"
    else
      redirect_to customer_path, notice: "作成できませんでした"
    end
  end

  private

  def address_params
    params.permit(:name, :customer_id, :post_code, :address)
  end

end
