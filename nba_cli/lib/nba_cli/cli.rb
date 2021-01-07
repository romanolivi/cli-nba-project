class NbaCLI::CLI

    @@team_url_hash_counter = 0 
    
    def start
        puts "Loading Application. Please wait...."

        @@team_url_hash_counter == 0 ? NbaCLI::Scraper.new.team_url_hash : nil 
        @@team_url_hash_counter += 1
        puts "Welcome to the NBA App! What would you like to do?"
        puts ""
        puts "1) See full list of teams"
        puts "2) Search for a team"
        input = gets.chomp
        if input == "1"
            puts ""
            team_list
        elsif input == "2"
            team_search
        else
            puts "Invalid response. Try again"
            start
        end

    end

    def display_teams
        NbaCLI::Scraper.new.team_scrape.each_with_index do |team, i|
        puts "#{i+1}. #{team}"
        end
    end
    
    def team_list 
        space
        puts "Would you like to select a team, or go back to the main menu?"
        space
        puts "1) Select team"
        puts "2) Go back"
        input_2 = gets.chomp
        if input_2 == "1"
            display_teams
            puts ""
            team_search
        elsif input_2 == "2"
            puts ""
            start
        else 
            puts "Invalid input. Try again"
            team_list
        end
    end

    def team_search
        puts ""
        puts "Type in team name: "
        team_input = gets.chomp()
        url = ""
        NbaCLI::Scraper.new.team_hash.find do |k, v|
            url = NbaCLI::Scraper.new.team_hash[team_input]
        end

        if url 
            NbaCLI::Scraper.new.scrape_players(url) 
            player_q(team_input)
        else 
            puts "Invalid. Try again"
            team_search
        end
    end

    def player_q(team_name)
        puts ""
        puts "1) Choose a player from #{team_name} you want to learn more about"
        puts "2) Play a game"
        player_input = gets.chomp()

        if player_input == "1"

            puts "Input player name to learn more: "

            player_name = gets.chomp()

            NbaCLI::Player.find_player(player_name, team_name)
            
            puts "1) Select another player/Play Game"
            puts "2) Choose another team"
            puts "3) Go back to Main Menu"
            puts "4) Exit the program"

            q_input = gets.chomp()

            case q_input
                when "1"
                    player_q(team_name)
                when "2"
                    NbaCLI::Player.all.clear
                    team_search
                when "3"
                    NbaCLI::Player.all.clear
                    start
                when "4"
                    puts "Thank you, Goodbye!"
                    NbaCLI::Player.new.greeting
            end
    
        
        elsif player_input == "2"
            NbaCLI::Player.play_game
        else 
            puts "Invalid input. Try again"
            player_q(team_name)
        end
    end

    def space 
        puts ""
        puts "==============="
        puts ""
    end
end  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    



