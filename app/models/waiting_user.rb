class WaitingUser < ApplicationRecord
  belongs_to :category

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  belongs_to :category, optional: true

  def accepted
    WaitingUser.transaction do
      User.create(
        first_name: first_name,
        last_name: last_name,
        email: email,
        phone: phone,
        fellowship: fellowship,
        city: city
      )
      destroy
    end
  end

end
