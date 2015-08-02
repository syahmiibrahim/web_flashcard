enable "sessions"

get '/' do
  #Login page
  puts "[LOG] Getting - '/' "

  if logged_in?
    redirect to "/deck"
  else
    redirect to "/login"
  end

end


get '/login' do


  erb :login
end

post '/login' do
  #receiving login data and validate
  puts "[LOG] Posting - '/login/ "

  user = User.authenticate(params[:user][:username], params[:user][:password])

  if user.nil?
    redirect to "/login?error=InvalidLogin"
  else
    session[:user_id] = user.id
    redirect to "/deck"
  end

end

post '/logout' do
  puts "[LOG] Posting - '/logout/ "

  session.clear

  redirect to "/"

end


get '/deck' do
  puts "[LOG] Getting - '/deck' "
  #session verification
  if !logged_in? then redirect to '/'  end


  @deck = Deck.all

  #Showing list of decks after signed in"
  erb :deck
end

post '/deck' do
  puts "[LOG] Posting - '/deck' "
  if !logged_in? then redirect to '/'  end


  deck = Deck.find(params[:deck_id])
  @round = Round.create(user: @current_user , deck: deck)
  @round.deck.cards.each do |card|
    Guess.create(round: @round, card: card)
  end

  session[:round_id] = @round.id

  redirect to "/round"
end


get '/round' do
  puts "[LOG] Getting - '/round' "
  if !logged_in? then redirect to '/'  end




  @guess = Guess.where(round: session[:round_id]).where(attempted: false).first


  if @guess.nil?
    redirect to "/result"
  end

  session[:guess_id] = @guess.id

  @options = [@guess.card.answer, @guess.card.wrong_answer1, @guess.card.wrong_answer2].shuffle!




    erb :round
end


post '/round' do
  puts "[LOG] Posting - '/round' "

  guess = Guess.find(session[:guess_id])

  if guess.card.answer == params[:answers]
    guess.correctness = true
  end


  guess.attempted = true

  guess.save

  redirect to "/round"

end

get "/result" do

  round = Round.find(session[:round_id])

  @total = round.guesses.length

  @correct = round.guesses.where(correctness: true).count


  erb :result
end



