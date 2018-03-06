class Creators < ActiveRecord::Base
  #has_many :comics
  #has_many :series
  has_many :characters, through: :creatorcharacters
  has_many :events, through: :eventcreators
end
