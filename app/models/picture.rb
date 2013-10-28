# == Schema Information
#
# Table name: pictures
#
#  id          :integer          not null, primary key
#  picture     :text
#  description :string(255)
#  user_id     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Picture < ActiveRecord::Base
  attr_accessible :picture, :description, :user_id

  belongs_to :user
  has_and_belongs_to_many :favourites

end
