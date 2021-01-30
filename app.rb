# frozen_string_literal: true

require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

# The BookmarkManager class is the main class.
class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/added_bookmark' do
    Bookmark.add(params[:url], params[:title])
    redirect '/'
  end

  delete '/delete_bookmark/:id' do
    Bookmark.delete(params[:id])
    redirect to '/'
  end

  get '/edit_bookmark/:id' do
    @bookmark = params[:id]
    erb :edit_bookmark
  end

  patch '/edited_bookmark/:id' do
    Bookmark.update(params[:id])
    redirect '/'
  end
end
