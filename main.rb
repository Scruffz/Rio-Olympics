require ('pry-byebug')
require ('sinatra')
require ('sinatra/contrib/all')

require_relative('controllers/athlete_controller')
require_relative('controllers/event_controller')
require_relative('controllers/nation_controller')

require_relative('db/sqlrunner')
require_relative('models/nation')
require_relative('models/event')
require_relative('models/athlete')

get "/" do
  
  erb(:index)
end