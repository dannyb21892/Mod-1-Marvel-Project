class EventCreators < ActiveRecord::Base
  belongs_to :event
  belongs_to :creator
end
