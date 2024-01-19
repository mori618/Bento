class AddPhoneNumberToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :phone_number, :string
  end
end
