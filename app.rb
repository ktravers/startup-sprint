require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    @error = params['error']
    erb :home
  end

  get '/facepage' do
    erb :facepage
  end

  post '/subscribe' do
    @full_name = params[:full_name]
    @email = params[:email]
    @city = params[:city]

    if !@email.match(/.+@.+/)
      redirect to('/?error=email')
    end

    erb :subscribe
  end

  get '/reddit' do
    # TODO: we can probably get the listings with something like:
    # JSON.parse(RestClient.get('http://reddit.com/.json'))

    @listings = []

    erb :reddit
  end

  get '/schedule' do
    @today = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Product Meeting'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Call it a day'],
    ]

    @tomorrow = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Inbox Zero'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Meetup Presentation'],
    ]

    @day_after = [
      ['2:00am', 'Wake up early, as is the Benjamin Franklin way.'],
      ['2:00am-2:15am', 'Invent shower.'],
      ['2:15am-2:30am', 'Shower'],
      ['2:30am-3:00am', 'Wake up the fair city of Philadelphia by wheeling a cannon out into the street and firing it loudly over and over again so that all the good citizens of this glorious city may get an early start on their morning’s work.'],
      ['3:00am-3:15am', 'Invent breakfast'],
      ['3:15am-3:30am', 'Eat a hearty breakfast consisting of a herring skeleton and a wooden engraving of a bee.'],
      ['3:30am-4:00am', 'Go to work at the printing press.'],
      ['4:00am-5:00am', 'Print thousands of large pieces of paper with the word “INDUSTRIOUS!” written upon them and distribute them all about the streets of Philadelphia, so as to inspire the good citizens of this glorious city to always be industrious and efficient.'],
      ['5:00am-5:30am', 'Travel from Philadelphia to Paris.'],
      ['5:30am-6:00am', 'Rally French support for our American Revolution by writing “England” on a snake and releasing it into the streets of Paris, thus demonstrating through metaphor the perfidious nature of King George.'],
      ['6:00am-6:15am', 'Return to Philadelphia.'],
      ['6:15am-6:30am', 'Take two naps at the same time in order to maximize efficiency.'],
      ['6:30am-7:00am', 'Invent bifocals.'],
      ['7:00am-7:30am', 'Invent bifocals once again, for as I often say, “Anything worth inventing once is worth inventing twice.”'],
      ['7:00am-7:30am', 'Invent a very small glove.'],
      ['7:45am-8:00am', 'Go to my job at the post office as Postmaster General. Begin the Postmaster General’s sacred duty of writing a letter to every single American citizen informing them that I am proud of them.'],
      ['8:00am-8:30am', 'Be generally efficient.'],
      ['8:30am-9:30am', 'Affix a brass key to a kite string and send it aloft in a thunderstorm as part of my frantic quest to pump my body so full of electricity that I erupt into a glorious ball of fire.'],
      ['9:30am-10:30am', 'Repeat kite experiment, replacing the key with a shrieking boy from the neighborhood. It is my hope that the boy, when affixed to my kite string and sent into the sky during a lightning storm, will prove a more efficacious conductor of electricity than the key and thus aid me in my quest to cram my body so full of electricity that I burst into flames.'],
      ['10:30am-11:00am', 'Invent a tea kettle with a specialized spout that emits smoke in the shape of Christ and Lucifer shaking hands. The invention shall henceforth be known as “Franklin’s Kettle.”'],
      ['11:00am-11:30am', 'Walk into John Hancock’s house uninvited and shout “efficiency!” repeatedly and continuously until the honorable Mr. Hancock forcibly removes me from the premises.'],
      ['11:30am-11:45am', 'Whisper “Time is money” to a bird.'],
      ['11:45am', 'Go to sleep early, as is the Benjamin Franklin way. No dreams.'],
    ]

    erb :schedule
  end

  get '/youtube' do
    erb :youtube
  end

end
