class CreatorCharacters < ActiveRecord::Base
  belongs_to :creator
  belongs_to :character
end
