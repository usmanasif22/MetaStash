class Drop < ApplicationRecord
    
    has_one_attached :csv_file
   
    
    def country_name
      
        if(country.length < 3)
            country_name = ISO3166::Country[country]
        else
            country_name = country
        end
    end

     def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Drop.create! row.to_hash
        end
    end
    
#     private

#   def correct_file_type
#     if csv_file.attached? && !csv_file.content_type.in?(%w(application/csv))
#       errors.add(:csv_file, 'Must be a CSV file!')
#     end
#   end
end