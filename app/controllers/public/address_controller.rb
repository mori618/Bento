class Public::AddressController < ApplicationController

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to customer_path, notice: "作成を完了しました"
    else
      flash[:notice] = @address.errors.full_messages.join(", ")
      redirect_to customer_path
    end
  end
  

  private

  def address_params
    params.require(:address).permit(:name, :customer_id, :post_code, :address)
  end

end
