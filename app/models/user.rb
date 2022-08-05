class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Validates
  validates :first_name, presence: true, length: { minimum:2 }, on: :update
  
  # Virtual attributes
  def full_name
    self.last_name.present? ? [self.first_name, self.last_name].join(' ') : self.first_name
  end
end
