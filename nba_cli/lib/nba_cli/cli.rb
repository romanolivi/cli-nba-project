class NbaCLI::CLI

    def start
        puts "Welcome to the NBA App! We will load up the list of teams."
        NbaCLI::Scraper.team_scrape.each_with_index do |team, i|
            puts "#{i+1}. #{team}"
        end
        choose_team
    end

    def choose_team(input)
        puts "Select a team you're interested in learning about!"
        input = gets.chomp()
        if !NbaCLI::Scraper.team_scrape.include?(input)
            puts "Invalid input, Try again!"
            choose_team
        end
        puts "You selected the #{input}!"
        sleep 2
        puts "Loading team data...."
        sleep 2
        puts "Loading #{input} roster..."
        
    end 


end

