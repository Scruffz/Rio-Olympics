require ('pry-byebug')
require ('sinatra')
require ('sinatra/contrib/all')
require ('json')

require_relative('controllers/athlete_controller')
require_relative('controllers/event_controller')
require_relative('controllers/nation_controller')
require_relative('controllers/participant_controller')

require_relative('db/sqlrunner')
require_relative('models/nation')
require_relative('models/event')
require_relative('models/athlete')
require_relative('models/standings')
require_relative('models/participant')

get "/" do
  erb(:index)
end

get "/json" do
  calc = Standings.new()
  calc.update_standings_nations
  @current_standings = calc.standings_nations
  json (@current_standings)
end
