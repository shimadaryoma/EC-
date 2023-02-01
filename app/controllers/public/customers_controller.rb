class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end

  def update
    @customer=current_customer
    if @customer.update(customers_params)
      redirect_to customers_path
    end
  end

  def unsubscribe
  end

  def destroy
    @customer=current_customer
    if @customer.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
  end

      private
  def customers_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
