class ChangeDeliveryStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :packages, :delivery_status, :boolean, using: 'delivery_status::boolean'
  end
end
