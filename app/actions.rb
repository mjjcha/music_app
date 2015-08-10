# Homepage (Root path)
get '/' do
  erb :index
end

get '/music' do
  @music = Music.all
  erb :'music/index'
end

get '/music/new' do
  erb :'music/new'
end

post '/music' do
  @music = Music.new(
      author: params[:author],
      song_title: params[:song_title],
      url: params[:url]
  )
  if @music.save
    redirect '/music'
  else
    erb :'music/new'
  end
end

get '/music/:id' do
  @music = Music.find params[:id]
  erb :'music/show'
end
