class Repository < ActiveRecord::Base
  belongs_to :user
  IS_TARGET_MAPPING = ['OFF', 'ON']

  def is_target_to_s
  	IS_TARGET_MAPPING[is_target]
  end
end
