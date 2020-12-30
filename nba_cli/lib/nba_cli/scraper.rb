class NbaCLI::Scraper
    # Player link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[1].text.gsub!(/\d+/,"")
    # Position link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[2].text
    # Age link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[3].text
    # Height link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[4].text
    # Weight link = # Player link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[5].text
    # college link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[6].text
    # salary link = link.css("table.Table").css("tbody.Table__TBODY")[0].children[0].children[7].text

    # link = doc.css("div.TeamLinks__Links")[0].children[2].children[0].attributes["href"].value
    
    @@team_hash = {}

    def get_page
        Nokogiri::HTML(open("https://www.espn.com/nba/teams"))
    end

    def team_scrape
        team_array = [] 
        get_page.css("div.pl3 h2").each do |team|
            team_array << team.text
        end
        team_array
    end

    def display_teams
        team_scrape.each_with_index do |team, i|
        puts "#{i+1}. #{team}"
        end
    end

    def team_url_hash
        get_page.css("div.pl3 h2").each_with_index do |team, i|
            @@team_hash[team.text] = get_page.css("div.TeamLinks__Links")[i].children[2].children[0].attributes["href"].value
        end
        @@team_hash
    end

    def team_hash
        @@team_hash
    end

    def scrape_players(url)
        roster_url = Nokogiri::HTML(open("https://www.espn.com" + url))
        p = roster_url.css("table.Table").css("tbody.Table__TBODY")[0]
        length = roster_url.css("table.Table").css("tbody.Table__TBODY")[0].children.length
        i = 0
        while(length > 0)
            NbaCLI::Players.new(
                p.children[i].children[1].text.gsub!(/\d+/,""), 
                p.children[i].children[2].text, 
                p.children[i].children[3].text, 
                p.children[i].children[4].text, 
                p.children[i].children[5].text, 
                p.children[i].children[6].text, 
                p.children[i].children[7].text)
            length -= 1
            i += 1
        end
        NbaCLI::Players.display_players
    end


    # def display_team_hash 
    #     team_url_hash.each do |team, url|
    #        puts "#{team}: #{url}"
    #     end
    # end
end























# def scrape_team_info
#     url = "https://www.landofbasketball.com/teams/miami_heat.htm"
#     doc = Nokogiri::HTML(open(url))

#     retired_jersey = []
    
# end


# def scrape_roster
#     url = "https://www.landofbasketball.com/teams/miami_heat.htm"
#     doc = Nokogiri::HTML(open(url))

#     roster = []
#     i = 0
#     until roster.length == 14
#         roster << doc.css("td a").children[i].text
#         i += 1
#     end
#     roster
# end

# def player_info
#     student_links = []
#     NbaCLI::Scraper.new.scrape_roster.each do |player|
#         name = player.gsub(" ", "_").downcase
#         url = "https://www.landofbasketball.com/nba_players/#{name}.htm"
#         student_links << url 
#     end
#         url
#         binding.pry
# end
#   doc.css("td a").children[0].text    
