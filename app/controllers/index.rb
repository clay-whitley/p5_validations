get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_event
end

post '/events/create' do
  event = Event.create(params[:event])
  p event.date.class
  if event.errors.messages.any?
    p event.errors.messages
    @errors = event.errors.messages
    @fields = params[:event]
    p @fields
    erb :new_event
  else
    redirect '/'
  end
end
