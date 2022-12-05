class Poll < ApplicationRecord
    belongs_to :ngo_id_1, class_name: "Ngo" 
    belongs_to :ngo_id_2, class_name: "Ngo" 
    belongs_to :ngo_id_3, class_name: "Ngo" 
    belongs_to :ngo_id_4, class_name: "Ngo" 

    def user_name
        @name = User.find_by_id(user_id)
        user_name = @name.name
      end
end
