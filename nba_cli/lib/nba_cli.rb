require "nba_cli/version"
require "nba_cli/cli"
require "nba_cli/scraper"
require "nba_cli/players"


module NbaCLI
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "../config/environment"