# == Schema Information
#
# Table name: favourites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  picture_id :integer
#

class Favourite < ActiveRecord::Base
  attr_accessible :user_id, :picture_id

  belongs_to :user
  belongs_to :picture


end
