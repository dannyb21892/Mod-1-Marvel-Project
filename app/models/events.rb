class Events < ActiveRecord::Base
  #has_many :comics
  has_many :creators, through: :eventcreators
  has_many :characters, through: :eventcharacters
  ##has_many :series maybe has only one??
end
