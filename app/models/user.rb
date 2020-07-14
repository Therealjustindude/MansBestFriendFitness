class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 

  has_many :dogs
  has_many :journal_entries
  
  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize 
  end

end
