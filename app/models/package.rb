class Package < ApplicationRecord
  belongs_to :courier
  validates :tracking_number, presence: true

  def humanized_delivery_status
    delivery_status ? 'Liuboye slovo' : 'Drugoe slovo'
  end
end
