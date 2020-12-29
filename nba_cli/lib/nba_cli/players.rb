class NbaCLI::Players
    attr_accessor :name, :team, :position, :age, :height, :weight, :college, :salary  

    @@all = []

    def initialize(name = nil, team = nil)
        @name = name 
        @team = team
        save
    end

    def self.all
        @@all
    end

    def save 
        @@all << self
    end
    
end