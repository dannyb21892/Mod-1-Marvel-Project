class Characters < ActiveRecord::Base
  #has_many :comics
  has_many :creators, through: :creatorcharacters
  #has_many :series
  has_many :events, through: :eventcharacters
end
