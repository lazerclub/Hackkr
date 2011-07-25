class Action
  include Mongoid::Document
  
  belongs_to :player
end