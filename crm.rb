require_relative 'contact'
require 'sinatra'

get '/' do
  redirect to '/home'
end

get '/home' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/contacts/:id' do
  #params[:id] has the id from the URL
  # instructions for how to handle requests to this route will go here
  @contact = Contact.find_by({id: params[:id].to_i})
  if @contact
    erb:show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/about' do
  erb :about
end

get '/new' do
  erb :new
end

after do
  ActiveRecord::Base.connection.close
end
