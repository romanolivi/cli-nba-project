class NbaCLI::Team 
    attr_accessor :name, :players 

    @@all = []

    def initialize(name)
        @name = name 
        @players = []
        save
    end
    
    def self.all
        NbaCLI::Scraper.team_scrape if @@all.empty?
        @@all
        binding.pry
    end

    def save 
        @@all << self
    end
    
end