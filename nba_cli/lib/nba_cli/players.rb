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

    def self.find_player(input, team_name)
        player = @@all.find {|p| p.name.downcase == input.downcase}
        if player 
            puts "Name: #{player.name}"
            puts ""
            puts "Position: #{player.position}" 
            puts "Age: #{player.age}"
            puts "Height: #{player.height}"
            puts "Weight: #{player.weight}"
            puts "College: #{player.college}"
            puts "Salary: #{player.salary}"
            puts ""
        else 
            puts "Player not found. Try again"
            NbaCLI::CLI.new.player_q(team_name)
        end
    end

    def self.play_game
        game_num = rand(1..2)
        if game_num == 1 
            self.salary_game
        elsif game_num == 2
            self.college_game
        end

        puts "Want to go again?"
        answer_2 = gets.chomp()
            if answer_2.downcase == "yes".downcase
                self.play_game
            elsif answer_2.downcase == "no".downcase
                puts "1) Main Menu"
                puts "2) Exit"
                answer_3 = gets.chomp()
                if answer_3 == "1"
                    @@all.clear
                    NbaCLI::CLI.new.start
                elsif answer_3 == "2"
                    puts "Thank you, Goodbye!"
                else 
                    puts "Invalid response. Closing program."
                end
            else 
                puts "Invalid response. Closing program."
            end

    end

    def self.salary_game 
        num = rand(0..@@all.length - 1)
        player = @@all[num]
        puts "Is #{player.name}'s salary greater than $5,000,000?"
        answer = gets.chomp()
        salary = player.salary.delete("$,").to_i
            if salary > 5000000 && answer.downcase == "yes".downcase
                puts "Correct!"
            elsif salary > 5000000 && answer.downcase == "no".downcase
                puts "Incorrect!"
            elsif salary < 5000000 && answer.downcase == "yes".downcase
                puts "Incorrect!"
            elsif salary < 5000000 && answer.downcase == "no".downcase
                puts "Correct!"
            end
    end

    def self.college_game
        num = rand(0..@@all.length - 1)
        player = @@all[num]
        puts "What college did #{player.name} go to?"
        answer = gets.chomp()
        college = player.college
            if answer.downcase == college.downcase
                puts "Correct!"
                puts "#{player.name} attended #{college}!"
            else
                puts "Incorrect!"
                puts "#{player.name} attended #{college}!"
            end
    end


end