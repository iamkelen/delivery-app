class Package < ApplicationRecord
  belongs_to :courier

  def humanized_delivery_status
    delivery_status ? 'Liuboye slovo' : 'Drugoe slovo'
  end
end
