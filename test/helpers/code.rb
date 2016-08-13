


class Animal
    attr_accessor :name
    
    @@species = ['cat','dog']
    
    
    def species
        @@species
    end
    
    def species=(array=[])
        @@species = array
    end
    
    def initialize(noise)
        @noise = noise
    end
    
    def noise
        @noise
    end
end
#Animal.species = ["pig"]

a1 = Animal.new("Moo")
a1.name = "chris"
#a1.species = ["pig"]

a2 = Animal.new("Moo")
a2.name = "chris"
a2.species = ["pig"]
p a2.species
    
    
    