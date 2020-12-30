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

    def self.all 
        @@all
    end

    def self.display_players
        @@all.each_with_index do |player, i|
            puts "#{i+1}. #{player.name}"
        end
    end

    def self.find_player(input)
        player = @@all.find {|p| p.name.downcase == input.downcase}
        if player 
            puts "Name: #{player.name}"
            puts "Position: #{player.position}" 
            puts "Age: #{player.age}"
            puts "Height: #{player.height}"
            puts "Weight: #{player.weight}"
            puts "College: #{player.college}"
            puts "Salary: #{player.salary}"
        else 
            puts "Player not found. Try again"
            NbaCLI::CLI.new.player_q
        end
    end


end