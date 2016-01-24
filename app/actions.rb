# Homepage (Root path)
helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

before do
  redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'
end

get '/' do
  @music = Music.all.order("created_at DESC")
  erb :'/music/index'
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/profile' do
  current_user
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/delete' do
  Music.find params[:id]
  redirect to '/music'
end

post '/' do
  @music = Music.new(
      artist: params[:artist],
      title: params[:title],
      album: params[:album]
  )
  if @music.save
    redirect '/'
  else
    erb :'/music/new'
  end
end

post '/login' do
  password = params[:password]
  user = User.find_by(email: params[:email])
  if user.password == password
    session[:user_id] = user.id
    session[:notice] = "You are now logged in"
    redirect '/profile'
  end
end

post '/signup' do
  email = params[:email]
  password = params[:password]

  user = User.find_by(email: email)

  if user
    redirect '/login'
  else
    user = User.create(email: email, password: password)
    session[:user_id] = user.id
    session[:notice] = "Account successfully created"
    redirect '/profile'
  end
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
      artist: params[:artist],
      title: params[:title],
      album: params[:album],
      user_id: params[:user_id]
  )

  if @music.save
    @music.user_id = @current_user.id
    @music.save
    redirect '/music'
  else
    erb :'music/new'
  end
end

get '/music/:id' do
  @music = Music.find(params[:id])
  @music_by_author = Music.where("user_id=?",@music.user_id)
  @user = User.find_by(id: @music.user_id)
  erb :'music/show'
end

delete '/music/:id' do
  music = Music.find params[:id]
  music.destroy
  redirect to '/music'
end

# looking for vote where user_id == w/e user.id we pass in, and where musics.id === w/e musics.id we pass in
