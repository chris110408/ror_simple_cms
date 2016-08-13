class Section < ActiveRecord::Base
  
    belongs_to :page
    has_many :section_edits
    has_many :editors, :through => :section_edits, :class_name => "AdminUser"
    
    CONTENT_TYPES = ['text', 'HTML']
    
    validates_presence_of :name
    validates_length_of :name, :maximum => 25
    validates_inclusion_of :content_type, :in => ['text', 'HTML'],
        :message => "must be one of #{CONTENT_TYPES.join(', ')}"
    validates_presence_of :content
    
    scope :visible, -> { where(:visible => true) }
    scope :invisible, -> { where(:visible => false) }
    scope :sorted, -> {order("sections.position ASC")}
    scope :newest_first, ->{order("sections.create_at DESC")}
    scope :search, lambda { |query|
        where(["name like?", "%#{query}%"])
    }
end

