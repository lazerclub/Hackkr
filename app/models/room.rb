class Room
  include Mongoid::Document
  field :title, :type => String
  field :description, :type => String
  has_many :players, :inverse_of => :current_room
  embeds_many :exits do
    def [](direction)
      where(direction: direction).first
    end
  end
  
  def has_exit?(direction)
    !exits[direction].nil?
  end
  
  def destination_of(direction)
    exits[direction].destination if has_exit?(direction)
  end
  
  def full_description
    <<-EOS
    #{title}
    ------------------------
    
    #{description}
    
    Obvious exits are
    #{exits.map(&:direction).join(', ')}
    EOS
  end
end
