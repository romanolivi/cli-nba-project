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

    def self.play_game
        num = rand(0..@@all.length - 1)
        player = @@all[num]
        puts "Is #{player.name}'s salary greater than $5,000,000?"
        answer = gets.chomp()
        salary = player.salary.delete("$,").to_i
            if salary > 5000000 && answer == "yes"
                puts "Correct!"
            elsif salary > 5000000 && answer == "no"
                puts "Incorrect!"
            elsif salary < 5000000 && answer == "yes"
                puts "Incorrect!"
            elsif salary < 5000000 && answer == "no"
                puts "Correct!"
            end

        puts "Want to go again?"
        puts "1) Yes"
        puts "2) No"
        answer_2 = gets.chomp()
            if answer_2 == "1"
                self.play_game
            elsif answer_2 == "2"
                puts "1) Main Menu"
                puts "2) Exit"
                answer_3 = gets.chomp()
                if answer_3 == "1"
                    start
                elsif answer_3 == "2"
                    puts "Thank you, Goodbye!"
                else 
                    puts "Invalid response. Closing program."
                end
            else 
                puts "Invalid response. Closing program."
            end

    end


end