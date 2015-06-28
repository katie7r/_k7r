class Admin < ActiveRecord::Base
  devise :database_authenticatable, :lockable, :rememberable, :trackable, :validatable
end
