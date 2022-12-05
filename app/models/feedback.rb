class Feedback < ApplicationRecord
    belongs_to :user
  
    def user_name
      @name = User.find_by_id(user_id)
      user_name = @name.name
    end
  
    scope :resolved, -> { where(is_resolved: :true)}
    scope :not_resolved, -> { where(is_resolved: :false)}
  end
  