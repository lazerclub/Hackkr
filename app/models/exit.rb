class Exit
  include Mongoid::Document
  embedded_in :room
  field :direction, :type => String, :unique => true
  belongs_to :destination, :class_name => 'Room', :inverse_of => :entrance
  
  def destination=(obj, _=nil)
    self.destination_id = obj.respond_to?(:id) ? obj.id : obj
  end
  
  def inverse
    Exit.new(:direction => 'anti-' + direction.to_s, :destination => room, :room => destination)
  end
end
