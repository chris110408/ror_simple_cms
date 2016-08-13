class Page < ActiveRecord::Base
   
    belongs_to :subject
    has_many :sections 
    has_and_belongs_to_many :editors, :class_name =>'AdminUser'
    
    
    validates_presence_of :name
    validates_length_of :name, :maximum => 25
    validates_presence_of :permalink
    validates_length_of :permalink, :within => 3..255
    validates_uniqueness_of :permalink
    
    
    scope :visible, -> { where(:visible => true) }
    scope :invisible, -> { where(:visible => false) }
    scope :sorted, -> {order("pages.position ASC")}
    scope :newest_first, ->{order("pages.create_at DESC")}
    scope :search, lambda { |query|
        where(["name like?", "%#{query}%"])
    }
    
end
