class NbaCLI::Players
    attr_accessor :name, :position, :age, :height, :weight, :college, :salary  
    @@all = [] 
    
    def initialize(name, position, age, height, weight, college, salary)
        @name = name 
        @position = position
        @age = age
        @height = height
        @weight = weight 
        @college = college
        @salary = salary
        @@all << self
    end

    def self.display_players
        @@all.each_with_index do |player, i|
            puts "#{i+1}. #{player.name}"
        end
    end


end