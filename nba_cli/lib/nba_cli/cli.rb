class NbaCLI::CLI

    @@team_url_hash_counter = 0 
    
    def start
        puts "Loading Application. Please wait...."
        @@team_url_hash_counter == 0 ? NbaCLI::Scraper.new.team_url_hash : nil 
        @@team_url_hash_counter += 1
        puts "Welcome to the NBA App! What would you like to do"
        puts "1) See full list of teams"
        puts "2) Search for a team"
        puts "3) Search for a player"
        input = gets.chomp()
        if input == "1"
            team_list
        elsif input == "2"
            team_search
        elsif input == "3"
            player_search
        else
            puts "Invalid response. Try again"
            start
        end

    end
    
    def team_list 
        NbaCLI::Scraper.new.display_teams
    end

    def team_search
        puts "Type in team name: "
        input = gets.chomp()
        url = ""
        NbaCLI::Scraper.new.team_hash.find do |k, v|
            url = NbaCLI::Scraper.new.team_hash[input]
        end

        if url 
            NbaCLI::CLI.Scraper.new.scrape_players(url) 
        else 
            puts "Invalid. Try again"
            team_search
        end
    end


end  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        #     puts "Welcome to the NBA App Miami Heat Edition! What would you like to do?\n1) Learn more about the team\n2) Learn more about the players" 
    #     input = gets.chomp()
    #     if input == "1"
    #         team_info
    #     elsif input == "2"
    #         puts "You will be taken to the roster page. Do you want to continue?"
    #         input_2 = gets.chomp()
    #         if input_2 == "yes" 
    #             roster
    #         elsif input_2 == "no"
    #             start
    #         end 
    #     else 
    #         puts "Invalid input! Try again!"
    #         start
    #     end
    # end

    # def team_info
        
    # end

    # def roster 
    #     puts "Loading Miami Heat roster..."
    #     sleep 3
    #     NbaCLI::Scraper.new.scrape_roster.each_with_index do |player, i|
    #         puts "#{i+1}. #{player}"
    #     end 
    # end

    



