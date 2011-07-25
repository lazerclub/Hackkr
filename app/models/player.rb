class Player
  include Mongoid::Document
  field :name, :type => String
  belongs_to :current_room, :inverse_of => :players, :class_name => 'Room'
  
  def move(direction)
    if current_room.has_exit?(direction)
      self.current_room = current_room.destination_of(direction)
    else
      false
    end
  end
  
  def move!(direction)
    move(direction) && update_attribute(:current_room_id, current_room.id) && current_room
  end
  
  def look(item=nil)
    current_room.full_description
  end
  
  def perform(action_string)
    command, modifiers = action_string.split(' ', 2)
    case command
    when /^(go|move|g)$/
      move!(modifiers)
    when 'look'
      look(modifiers)
    end
  end
end
