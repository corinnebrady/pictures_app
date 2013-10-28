# == Schema Information
#
# Table name: favourites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favourite < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :pictures


end
