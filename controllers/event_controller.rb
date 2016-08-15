get "/event" do
  @events = Event.all
  erb(:'event/index')
end

get "/event/new" do
  @athletes = Athlete.all
  erb(:'event/new')
end

post "/event" do
  @event = Event.new(params)
  @event.save
  event_id = @event.id
  participants = params.reject{|key, value|
    key == "name" || key == "add_event"}
  participants.each_value do |athlete_id|
    participant = Participant.new({
      'event_id' => event_id,
      'athlete_id' => athlete_id
      })
    participant.save
  end
  erb(:'event/create')
  redirect(to("/event"))
end


post "/event/:id/delete" do
  @event = Event.find(params[:id])
  @event.delete
  redirect(to('/event'))
end


get "/event/:id" do
  @event = Event.find(params[:id])
  #Need to have a event.medals_awarded? helper function for the output
  erb(:'event/show')
end


get "/event/:id/edit" do
  @event = Event.find(params[:id])
  erb( :'event/edit' )
end

post "/event/:id" do
  event = Event.new(params)
  binding.pry
  event.update

end


# get "/event/:id/edit/ammend" do

# end
# get "/event/:id/edit/edit" do

# end
# get "/event/:id/edit/change_participants" do

# end
