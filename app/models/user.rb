# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  image           :string(255)
#  password_digest :string(255)
#  is_admin        :boolean
#  user_ids        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :username, :email, :image, :password, :password_confirmation, :is_admin#, :user_ids

#  mount_uploader :picture, PictureUploader

  has_many :pictures
  has_many :favourites
  has_and_belongs_to_many :categories

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :image, :presence => true
  validates :username, :presence => true, :length => { :minimum => 3 }
  validates :password, :length => { :minimum => 6 }

  def owned_categories
    Category.where :owner_id => self.id
  end

end
