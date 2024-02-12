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

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to customer_path
    else
      render edit_address_path(@address)
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to customer_path
  end


  private

  def address_params
    params.require(:address).permit(:name, :customer_id, :post_code, :address)
  end

end
