class NbaCLI::Scraper
    # Player link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[1].text
    # Position link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[2].text
    # Age link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[3].text
    # Height link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[4].text
    # Weight link = # Player link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[5].text
    # college link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[6].text
    # salary link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[7].text

    # link = doc.css("div.TeamLinks__Links")[0].children[2].children[0].attributes["href"].value
    
    @@teams = []

    def teams 
        @@teams
    end

    def get_page
        doc = Nokogiri::HTML(open("https://www.espn.com/nba/teams"))
    end

    def self.team_scrape
        page = Nokogiri::HTML(open("https://www.espn.com/nba/teams"))
        team_list = page.css("h2")
            team_list.each do |t|
                name = t.text
                ref = t.text.gsub(" ", "-").downcase
                @@teams << name 
            end
        @@teams 
    end

    def self.roster_link
        puts "Select a team you're interested in learning about!"
        input = gets.chomp()
        if !NbaCLI::Scraper.team_scrape.include?(input)
            puts "Invalid input, Try again!"
            self.roster_link
        else
            puts "You selected the #{input}!"
            sleep 2
            puts "Loading team data...."
            sleep 2
            puts "Loading #{input} roster..."
        end
        
        doc = Nokogiri::HTML(open(https://www.espn.com/nba/team/roster/_/name))
    end

    #     link = Nokogiri::HTML(open("https://www.espn.com" + doc.css("div.TeamLinks__Links")[0].children[2].children[0].attributes["href"].value))


end