ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "pokemons"
)

if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
