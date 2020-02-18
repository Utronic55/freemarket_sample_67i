class Address < ApplicationRecord
  belongs_to :user, optional: true

  # ビジネスルール
  validates :number,presence: true
  validates :prefecture,presence: true
  validates :city,presence: true
  validates :town,presence: true
  validates :phone_number,presence: true
end

# class Address < ApplicationRecord
#   belongs_to :user, optional: true
#   validates :number,:prefecture,:city,:town,:building,:phone_number,presence: true
# end


