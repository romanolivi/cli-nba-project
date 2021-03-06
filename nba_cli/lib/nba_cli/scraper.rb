require 'pry'
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
        team_array.sort
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
            NbaCLI::Player.new(
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
        NbaCLI::Player.display_players
    end

end

