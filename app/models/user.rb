class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [ :facebook]

  has_many :dogs
  has_many :journal_entries
  


  def dog_attributes=(dog_attributes)
    self.dog = Dog.where(name: dog_attributes[:name], user_id: dog_attributes[:user_id]).first_or_create do |dog|
      dog.name= dog_attributes[:name]
      dog.breed= dog_attributes[:breed]
      dog.age= dog_attributes[:age]
      dog.gender= dog_attributes[:gender]
      dog.weight= dog_attributes[:weight]
      dog.intact= dog_attributes[:intact]
      dog.birthday= dog_attributes[:birthday]
    end
  end

  
  def full_name
    self.first_name.capitalize + " " + self.last_name.capitalize 
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      full_name = auth.info.name
      name = full_name.split(" ")
      user.first_name = name.first
      user.last_name = name.last
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
