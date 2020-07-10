class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :dogs
  has_many :journal_entries
  
  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize 
  end

end
