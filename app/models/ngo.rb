class Ngo < ApplicationRecord
    has_many :primary_polls, class_name: "Poll", foreign_key: "ngo_id_1"
    has_many :secondary_polls, class_name: "Poll", foreign_key: "ngo_id_2"
    has_many :secondary_polls, class_name: "Poll", foreign_key: "ngo_id_3"
    has_many :secondary_polls, class_name: "Poll", foreign_key: "ngo_id_4"
  end
  