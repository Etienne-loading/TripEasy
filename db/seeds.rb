require 'faker'
require "open-uri"
require 'json'


User.destroy_all
Blog.destroy_all
Step.destroy_all

tag_list = [
  "adventure",
  "explore",
  "culture",
  "nature",
  "cityscape",
  "beach",
  "mountains",
  "foodie",
  "road",
  "historic",
  "wildlife",
  "sunset",
  "local",
  "backpack",
  "luxury",
  "photo",
  "solo",
  "family",
  "hiking",
  "surfing"
]

puts "Creating users ..."
nationalities = ['French', 'German', 'Spanish', 'Italian']

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  pseudo = Faker::Internet.username(specifier: "#{first_name} #{last_name}", separators: %w(. _))
  email = Faker::Internet.email(name: "#{first_name} #{last_name}")
  password = 'password'
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%Y-%m-%d')
  nationality = nationalities.sample

  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    pseudo: pseudo,
    email: email,
    password: password,
    birthday: birthday,
    nationality: nationality
  )
  user.save
  puts "Created #{user.pseudo}"
end

etienne = { first_name: "Etienne", last_name: "Pagenaud", pseudo: "Mister Worldwide", email: "mister.worldwide@gmail.com", password:"password", birthday:"10-10-1995", nationality:"french" }
[etienne].each do |hash|
user = User.create!(
  first_name: hash[:first_name],
  last_name: hash[:last_name],
  pseudo: hash[:pseudo],
  email: hash[:email],
  password: hash[:password],
  birthday: hash[:birthday],
  nationality: hash[:nationality]
)
user.save
puts "Created #{user.pseudo}"
end

guatemala = { title: "Exploration in Guatemala", min_price: 1000, max_price: 1500, start_date: "2022-10-12", end_date: "2022-10-22", carbon_friendly:true, user:User.all.sample, intro:"Welcome to Guatemala, a jewel of Central America that combines spectacular nature and cultural heritage. Explore quaint colonial towns, discover fascinating Mayan archaeological sites, and marvel at landscapes of majestic volcanoes and picturesque lakes. Immerse yourself in the richness of Guatemalan traditions, taste delicious local cuisine and let yourself be charmed by the warm welcome of the locals. Get ready for an immersive and enriching experience in Guatemala, where adventure and discovery await you at every turn."}
[guatemala].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user],
    intro: hash[:intro]
  )
  image = URI.open("https://images.unsplash.com/photo-1582300857444-5ddd87c86797?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80")
  blog.photo_banner.attach(io: image, filename: blog.title, content_type: 'png')
  image = URI.open("https://images.unsplash.com/photo-1528543010705-e7e75169b717?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80")
  blog.photo_card.attach(io: image, filename: blog.title, content_type: 'png')
  blog.save
  puts "Created #{blog.title}"
end

step1 = { title: "Welcome to Charming Antigua: An Introduction to Guatemala", address: "Antigua", content: "Your adventure begins in the colonial city of Antigua, with its quaint cobblestone streets and baroque churches. In this article, discover the best sites to visit, such as the Plaza Mayor, the Cathedral and the ruins of the Church of La Merced. Soak up the city's historic atmosphere, sample delicious local dishes and explore bustling markets.", duration: 1, latitude: 14.5586, longitude: -90.7295, country: "Guatemala", blog:Blog.last, url:"https://images.unsplash.com/photo-1563442744-3e17a3bf4932?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80", layout: 4 }
step2 = { title: "Marvel at the serene beauty of Lake Atitlán", address: "Lac Atitlán", content: "Lake Atitlán is a natural wonder surrounded by volcanoes and indigenous villages. In this article, learn about the different communities around the lake, such as Panajachel, San Marcos and Santiago Atitlán. Go by boat to explore the villages, admire the traditional weavings of Mayan women and enjoy the breathtaking views of the lake and its surroundings.", duration: 2, latitude: 14.6829, longitude: -91.2736, country: "Guatemala", blog:Blog.last, url:"https://images.unsplash.com/photo-1637181416128-7a32516e0ad0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2832&q=80", layout: 4 }
step3 = { title: "A Journey to the Ancient Mayan Civilization: Discover Tikal National Park", address: "Parc national de Tikal", content: "Immerse yourself in the fascinating history of the Maya by visiting Tikal National Park. In this article, explore the majestic pyramids, sacred temples and dense jungle of this iconic archaeological site. Set off at dawn to admire the sunrise over the ruins and listen to the songs of the howler monkeys. Tikal National Park is an unforgettable experience for history and nature lovers.", duration: 2, latitude: 17.2220, longitude: -89.6237, country: "Guatemala", blog:Blog.last, url: "https://images.unsplash.com/photo-1508035460735-91088c495500?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80" ,layout: 4}
step4 = { title: "Relax and Explore in Flores: Gateway to Yaxha Ruins", address: "Flores", content: "Flores, a picturesque little island on Lake Petén Itzá, is your starting point for exploring the ruins of Yaxha. In this article, discover the tranquil beauty of Flores with its colorful houses and cobbled streets. Next, explore the ruins of Yaxha, a lesser-known but equally impressive site as Tikal. Climb to the top of the pyramids to enjoy panoramic views of the surrounding jungle.", duration: 2, latitude: 16.9337, longitude: -89.8923, country: "Guatemala", blog:Blog.last, url:"https://images.unsplash.com/photo-1508035460735-91088c495500?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80", layout: 4 }

[step1, step2, step3, step4].each do |hash|
  step = Step.create!(
    title: hash[:title],
    address: hash[:address],
    content: hash[:content],
    duration: hash[:duration],
    latitude: hash[:latitude],
    longitude: hash[:longitude],
    country: hash[:country],
    blog: hash[:blog]
  )
  if hash[:url] == nil
    puts "NO PICTURE URL"
  else
    image = URI.open(hash[:url])
    step.photo_text.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end

spain = { title: "The Great Country of Rafael Nadal", min_price: 800, max_price: 1000, start_date: "2023-01-02", end_date: "2023-01-17", carbon_friendly:true, user:User.all.sample, intro:"Welcome to Spain, a country rich in history, culture and natural beauty. From bustling cities to heavenly beaches, this 20-day trip will allow you to discover all the diversity of Spain. Explore iconic sites such as the Sagrada Familia in Barcelona, wander the narrow streets of the Albaicín in Granada, sample the delights of Spanish cuisine in Madrid and relax on the sunny beaches of the Costa del Sol. Prepare to be charmed by passion, art and Spanish hospitality throughout your unforgettable trip to Spain." }
[spain].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user],
    intro: hash[:intro]
  )
  image = URI.open("https://images.unsplash.com/photo-1543783207-ec64e4d95325?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80")
  blog.photo_banner.attach(io: image, filename: blog.title, content_type: 'png')
  image = URI.open("https://images.unsplash.com/photo-1558642084-fd07fae5282e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1036&q=80")
  blog.photo_card.attach(io: image, filename: blog.title, content_type: 'png')
  puts "Created #{blog.title}"
  blog.save
end

step1 = { title: "Discover the effervescence of Madrid: Vibrant capital of Spain", address: "Madrid", content: "Your journey begins in the beautiful city of Madrid, where history and modernity blend harmoniously. In this article, explore the jewels of Madrid, such as the Royal Palace, Plaza Mayor and the Prado Museum. Immerse yourself in the city's vibrant nightlife, taste delicious tapas and enjoy the cozy atmosphere of Madrid's streets.", duration: 2, latitude: 40.4168, longitude: -3.7038, country: "Spain", blog:Blog.last, url:"https://images.unsplash.com/photo-1558370781-d6196949e317?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2358&q=80",layout: 4 }
step2 = { title: "Let yourself be charmed by Barcelona: Pearl of the Mediterranean", address: "Barcelone", content: "Barcelona welcomes you with its iconic architecture, sunny beaches and rich Catalan culture. In this article, discover the wonders of the city, such as the Sagrada Familia, Park Güell and the lively promenade of Las Ramblas. Soak up the bohemian atmosphere of the Gothic Quarter, sample delicious Catalan cuisine and take in the stunning views from Mount Tibidabo.", duration: 3, latitude: 41.3851, longitude: 2.1734, country: "Spain", blog:Blog.last ,layout: 4}
step3 = { title: "Explore the Moorish Beauty of Granada: A Treasure of Andalusia", address: "Grenade", content: "Granada transports you back to Moorish times with its iconic Alhambra and narrow streets full of charm. In this article, learn about the Alhambra, an incredibly detailed palace complex, and stroll through the Albaicín and Sacromonte neighborhoods. Soak up the Andalusian atmosphere, watch a flamenco show and sample authentic tapas paired with local wines.", duration: 3, latitude: 37.1773, longitude: -3.5986, country: "Spain", blog:Blog.last, url:"https://images.unsplash.com/photo-1647797833375-63d6ecc36d62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2429&q=80",layout: 4}
step4 = { title: "Vibrate to the rhythm of Seville: Cultural capital of Andalusia", address: "Séville", content: "Seville will enchant you with its Moorish architecture, lush gardens and festive atmosphere. In this article, discover the majestic Seville Cathedral, the imposing Plaza de España and the royal Alcazar Palace.", duration: 3, latitude: 7.3891, longitude: -5.9845, country:"Spain", blog:Blog.last, url: "https://images.unsplash.com/photo-1634893448760-0cb6e1af22f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2342&q=80", layout: 4 }
step5 = { title: "Relaxation and modernity in Valence: The city of arts and sciences", address: "Valence", content: "Valencia offers a unique blend of stunning beaches, modern architecture and rich history. In this article, discover the City of Arts and Sciences, a futuristic architectural complex, visit the old town with its cathedral and taste the famous Valencian paella. Also enjoy the sandy beaches and explore the charming fishing district of El Cabanyal", duration: 2, latitude: 39.46, longitude: -0.37 , country: "Spain", blog:Blog.last, layout: 4 }
step6 = { title: "Cordoba, a journey through time: Between Andalusian history and culture", address: "Cordoue", content: "Cordoba transports you to the glorious era of the Umayyad Caliphate with its famous mosque-cathedral, the Mezquita. In this article, explore the narrow streets of Judería, the Jewish Quarter, visit the Alcázar of the Christian Kings, and stroll through the gardens of the Alcázar de los Reyes Cristianos. Immerse yourself in the timeless atmosphere of this city steeped in history and cultural influences", duration: 2, latitude: 37.88, longitude: -4.77, country: "Spain", blog:Blog.last, layout: 4}

[step1, step2, step3, step4, step5, step6].each do |hash|
  step = Step.create!(
    title: hash[:title],
    address: hash[:address],
    content: hash[:content],
    duration: hash[:duration],
    latitude: hash[:latitude],
    longitude: hash[:longitude],
    country: hash[:country],
    blog: hash[:blog]
  )
  if hash[:url] == nil
    puts "NO PICTURE URL"
  else
    image = URI.open(hash[:url])
    step.photo_text.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end

myanmar = { title: "Echanting exploration", min_price: 1500, max_price: 2000, start_date: "2023-03-02", end_date: "2023-03-13", carbon_friendly:false, user:User.all.sample, intro:"Welcome to Myanmar, a mysterious and enchanting country in Southeast Asia. Get ready to immerse yourself in a rich and unspoiled culture, discover majestic temples, breathtaking landscapes and warm hospitality. Explore the splendors of Yangon with the famous Shwedagon Pagoda, marvel at the temples of Bagan, embark on a cruise on the majestic Irrawaddy River and soak up the unique atmosphere of Inle Lake. Myanmar promises you an immersive adventure through its history, traditions and unspoiled nature. Prepare to be transported to a world of beauty and spirituality on this unforgettable trip to Myanmar."}
[myanmar].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user],
    intro: hash[:intro]
  )
  image = URI.open("https://images.unsplash.com/photo-1584897356466-858d9b6c53d1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80")
  blog.photo_banner.attach(io: image, filename: blog.title, content_type: 'png')
  image = URI.open("https://plus.unsplash.com/premium_photo-1664303315354-348fb90f633f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2350&q=80")
  blog.photo_card.attach(io: image, filename: blog.title, content_type: 'png')
  puts "Created #{blog.title}"
  blog.save
end

step1 = { title: "Discover the Magic of Yangon: Gateway to Myanmar", address: "Yangon", content: "Your journey begins in the fascinating city of Yangon, where tradition and modernity blend. Explore the wonders of Yangon, such as the Shwedagon Pagoda, British colonial architecture, and vibrant markets. Immerse yourself in Buddhist spirituality and savor local culinary delights.", duration: 2, latitude: 16.8409, longitude: 96.1735, country: "Myanmar", blog: Blog.last, url: "https://images.unsplash.com/photo-1612257999781-1a997105f94b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2344&q=80", layout: 4 }

step2 = { title: "Marvel at the Temples of Bagan: An Architectural Treasure", address: "Bagan", content: "Bagan transports you to a landscape of majestic temples and pagodas. Explore millennium-old temples, witness a magical sunrise from a hot air balloon, and immerse yourself in the history and spirituality of this unique place.", duration: 2, latitude: 21.1722, longitude: 94.8606, country: "Myanmar", blog: Blog.last, layout: 4 }

step3 = { title: "Explore the Serene Beauty of Inle Lake: A Natural Paradise", address: "Inle Lake", content: "Inle Lake is an enchanting destination where you'll discover a unique traditional way of life. Take a boat excursion to explore floating villages, admire fishermen with their unique rowing technique, and discover local craftsmanship. Enjoy the stunning landscapes and tranquility of the lake.", duration: 2, latitude: 20.5863, longitude: 96.9102, country: "Myanmar", blog: Blog.last, url: "https://images.unsplash.com/photo-1674468926641-11ad5a62eb9f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2839&q=80", layout: 4 }

step4 = { title: "Discover the Grandeur of Mandalay: Former Royal Capital", address: "Mandalay", content: "Mandalay offers a journey into the royal history of Myanmar. Visit the royal palace, sacred temples, and the famous U Bein Bridge. Explore the surrounding hills to admire the sunset from Mandalay Monastery and immerse yourself in the vibrant atmosphere of local markets.", duration: 3, latitude: 21.9588, longitude: 96.0891, country: "Myanmar", blog: Blog.last, layout: 4 }

step5 = { title: "Relax on the Beaches of Ngapali: A Tropical Paradise", address: "Ngapali", content: "Ngapali is an idyllic beach destination for relaxation and enjoying sandy beaches. Spend your days sunbathing, swimming in turquoise waters, and savoring fresh seafood. Treat yourself to relaxing massages and admire the breathtaking sunsets.", duration: 2, latitude: 18.4537, longitude: 94.3895, country: "Myanmar", blog: Blog.last, url: "https://images.unsplash.com/photo-1506399005762-2088660f5c38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80", layout: 4 }





[step1, step2, step3, step4, step5].each do |hash|
  step = Step.create!(
    title: hash[:title],
    address: hash[:address],
    content: hash[:content],
    duration: hash[:duration],
    latitude: hash[:latitude],
    longitude: hash[:longitude],
    country: hash[:country],
    blog: hash[:blog]
  )
  if hash[:url] == nil
    puts "NO PICTURE URL"
  else
    image = URI.open(hash[:url])
    step.photo_text.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end

lithuania = { title: "Unveiling Lithuania", min_price: 500, max_price: 1000, start_date: "2019-08-13", end_date: "2019-08-20", carbon_friendly:true, user:User.all.sample, intro:"Welcome to Lithuania, a captivating Baltic gem that blends rich history with breathtaking natural beauty. Explore the charming streets of Vilnius, the capital city, and be mesmerized by its well-preserved medieval old town. Discover the medieval castles and picturesque landscapes of Trakai, immerse yourself in the unique culture of the Hill of Crosses, and unwind on the pristine shores of the Curonian Spit. Lithuania offers a perfect blend of history, art, and natural wonders. Get ready to be enchanted by its charming cities, lush forests, and warm hospitality. Embark on a remarkable journey through Lithuania and create memories that will last a lifetime.", layout: 4}
[lithuania].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user],
    intro: hash[:intro]
  )
  image = URI.open("https://images.unsplash.com/photo-1567023249914-7c83f04de30c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80")
  blog.photo_banner.attach(io: image, filename: blog.title, content_type: 'png')
  image = URI.open("https://plus.unsplash.com/premium_photo-1667129939756-5fcd0633b343?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80")
  blog.photo_card.attach(io: image, filename: blog.title, content_type: 'png')
  puts "Created #{blog.title}"
  blog.save
end

step1 = { title: "Discover the Charm of Vilnius: The Capital of Lithuania", address: "Vilnius", content: "Your journey begins in the enchanting city of Vilnius, where history and culture come alive. Explore the charming Old Town, visit the iconic Gediminas' Tower, and immerse yourself in the vibrant atmosphere of Užupis, the artistic district. Indulge in traditional Lithuanian cuisine and discover the rich heritage of this UNESCO World Heritage Site.", duration: 2, latitude: 54.6872, longitude: 25.2797, country: "Lithuania", blog:Blog.last, url:"https://images.unsplash.com/photo-1549891472-991e6bc75d1e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2346&q=80", layout: 4 }
step2 = { title: "Experience the Vibrant Spirit of Kaunas: Lithuania's Cultural Hub", address: "Kaunas", content: "Kaunas, the second-largest city in Lithuania, offers a blend of history and modernity. Explore the beautiful Old Town, visit the impressive Kaunas Castle, and discover the vibrant street art scene. Immerse yourself in the city's cultural heritage at the M.K. Čiurlionis National Museum of Art and enjoy the lively atmosphere of Laisvės alėja, the main pedestrian street.", duration: 2, latitude: 54.8985, longitude: 23.9036, country: "Lithuania", blog:Blog.last , layout: 4}
step3 = { title: "Relax and Rejuvenate in Palanga: Lithuania's Seaside Gem", address: "Palanga", content: "Palanga is a charming seaside town known for its sandy beaches and beautiful dunes. Enjoy leisurely strolls along the Palanga Pier, explore the enchanting Botanical Gardens, and visit the historic Palanga Amber Museum. Indulge in fresh seafood, unwind at the spa, and embrace the peaceful ambiance of this coastal retreat.", duration: 3, latitude: 55.9209, longitude: 21.0713, country: "Lithuania", blog:Blog.last, url: "https://images.unsplash.com/photo-1647106271964-d20b9fdcc760?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2832&q=80" , layout: 4}
step4 = { title: "Immerse Yourself in Nature: Trakai and the Curonian Spit", address: "Trakai and Curonian Spit", content: "Experience the natural beauty of Lithuania with visits to Trakai and the Curonian Spit. Explore the picturesque Trakai Island Castle and learn about the country's medieval history. Then, venture to the Curonian Spit, a UNESCO World Heritage Site, where you can enjoy stunning sand dunes, scenic bike rides, and birdwatching in the Curonian Lagoon. Experience the unique culture and traditions of the Kursenieki people, the ethnic group living in the area.", duration: 4, latitude: 54.6408, longitude: 24.9335, country: "Lithuania", blog:Blog.last, layout: 4}

[step1, step2, step3, step4].each do |hash|
  step = Step.create!(
    title: hash[:title],
    address: hash[:address],
    content: hash[:content],
    duration: hash[:duration],
    latitude: hash[:latitude],
    longitude: hash[:longitude],
    country: hash[:country],
    blog: hash[:blog]
  )
  if hash[:url] == nil
    puts "NO PICTURE URL"
  else
    image = URI.open(hash[:url])
    step.photo_text.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end

japan = { title: "Wanderlust Japan", min_price: 5000, max_price: 8000, start_date: "2019-08-01", end_date: "2019-12-13", carbon_friendly:true, user:User.all.sample, intro:"Welcome to Japan, a land of captivating contrasts where ancient traditions blend seamlessly with modern innovation. Embark on a month-long adventure through this enchanting country and prepare to be captivated by its rich culture, stunning landscapes, and warm hospitality. Start your journey in Tokyo, a bustling metropolis where traditional temples stand side by side with towering skyscrapers. Immerse yourself in the vibrant street life of Shibuya and explore the serene gardens of the Imperial Palace. Head to Kyoto, a city of timeless beauty, where you can discover the iconic golden pavilion of Kinkaku-ji and wander through the enchanting Arashiyama Bamboo Grove. Experience a traditional tea ceremony and witness the grace and elegance of geisha performances." }
[japan].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user],
    intro: hash[:intro]
  )
  image = URI.open("https://images.unsplash.com/photo-1545569341-9eb8b30979d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80")
  blog.photo_banner.attach(io: image, filename: blog.title, content_type: 'png')
  image = URI.open("https://images.unsplash.com/photo-1492571350019-22de08371fd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2853&q=80")
  blog.photo_card.attach(io: image, filename: blog.title, content_type: 'png')
  puts "Created #{blog.title}"
  blog.save
end

step1 = { title: "Exploring the Vibrant Metropolis: Tokyo, Japan", address: "Tokyo", content: "Begin your Japanese adventure in the bustling metropolis of Tokyo. Immerse yourself in the vibrant city life as you explore iconic landmarks such as the Tokyo Skytree, the historic Asakusa district, and the trendy neighborhoods of Shibuya and Harajuku. Indulge in delicious cuisine, visit traditional temples, and experience the unique blend of ancient traditions and modern innovation.", duration: 5, latitude: 35.6895, longitude: 139.6917, country: "Japan", blog:Blog.last, url:"https://images.unsplash.com/photo-1551641506-ee5bf4cb45f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHRva3lvfGVufDB8fDB8fHww&auto=format&fit=crop&w=800&q=60", layout: 2 }
step2 = { title: "Discovering the Cultural Capital: Kyoto, Japan", address: "Kyoto", content: "Experience the rich cultural heritage of Japan in the historic city of Kyoto. Visit magnificent temples such as Kinkaku-ji (Golden Pavilion) and Kiyomizu-dera, stroll through the enchanting Arashiyama Bamboo Grove, and explore the traditional geisha district of Gion. Immerse yourself in the serene beauty of Japanese gardens and indulge in authentic tea ceremonies.", duration: 4, latitude: 35.0116, longitude: 135.7681, country: "Japan", blog:Blog.last, url:"https://images.unsplash.com/photo-1545569341-9eb8b30979d9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80", layout: 2 }
step3 = { title: "Feasting and Fun in Osaka: Japan's Culinary Capital", address: "Osaka", content: "Treat your taste buds in the gastronomic paradise of Osaka. Sample delicious street food at Dotonbori, explore the vibrant Kuromon Ichiba Market, and visit the historic Osaka Castle. Experience the lively atmosphere of Universal Studios Japan and unwind in the serene Osaka Castle Park. Enjoy the city's vibrant nightlife and embrace the friendly and welcoming spirit of Osaka.", duration: 3, latitude: 34.6937, longitude: 135.5023, country: "Japan", blog:Blog.last, url:"https://images.unsplash.com/photo-1589452271712-64b8a66c7b71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2342&q=80", layout: 4 }
step4 = { title: "Overview of japan food", address: "Hiroshima", duration: 3, latitude: 34.3853, longitude: 132.4553, country: "Japan", blog:Blog.last, url:"https://images.unsplash.com/photo-1560078444-7fbc3a39bc6d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80", layout: 3 }
step4 = { title: "Reflection and Resilience in Hiroshima: City of Peace", address: "Hiroshima", content: "Journey to Hiroshima, a city with a profound history. Pay your respects at the Hiroshima Peace Memorial Park and Museum, learn about the tragic events of the atomic bombing, and appreciate the city's commitment to peace and reconciliation. Explore the picturesque Miyajima Island with its iconic floating torii gate and serene temples. Witness the vibrant cherry blossoms in spring or the fiery hues of autumn in Hiroshima's beautiful gardens.", duration: 3, latitude: 34.3853, longitude: 132.4553, country: "Japan", blog:Blog.last, url:"https://images.unsplash.com/photo-1560078444-7fbc3a39bc6d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80", layout: 2 }
step5 = { title: "Nature's Wonderland: Exploring Hokkaido's Beauty", address: "Hokkaido", content: "Venture to the northernmost island of Japan, Hokkaido, known for its stunning natural landscapes. Discover the breathtaking beauty of national parks like Shiretoko and Daisetsuzan, soak in natural hot springs, and experience the unique wildlife, including the iconic red-crowned cranes. Enjoy outdoor activities such as hiking, skiing, and exploring the charming cities of Sapporo and Otaru.", duration: "6", latitude: 43.2203, longitude: 142.8635, country: "Japan", blog:Blog.last, layout: 4 }
step6 = { title: "Encounters with History and Deer: Nara, Japan", address: "Nara", content: "Step back in time in Nara, the ancient capital of Japan. Explore the UNESCO World Heritage Sites of Nara Park, including Todai-ji Temple with its massive bronze Buddha statue. Wander through the picturesque Isuien Garden and encounter the friendly deer that roam freely in the city. Visit the serene Kasuga Taisha Shrine and immerse yourself in the traditional atmosphere of this historic city.", duration: "3", latitude: 34.6851, longitude: 135.8048, country: "Japan", blog:Blog.last, url:"https://images.unsplash.com/photo-1610026386855-e01404c45a63?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80", layout: 2 }
step7 = { title: "Tropical Paradise: Relaxation in Okinawa's Islands", address: "Okinawa", content: "Conclude your journey in the idyllic islands of Okinawa, where pristine beaches, turquoise waters, and a unique culture await. Relax on the beautiful white sands of Ishigaki or Miyako Islands, go snorkeling or diving in the vibrant coral reefs, and explore the rich history and traditions of Okinawa at Shuri Castle and traditional Ryukyu villages. Indulge in delicious local cuisine and soak up the warm hospitality of the Okinawan people.", duration: "4", latitude: 26.2124, longitude: 127.6809, country: "Japan", blog:Blog.last, url:"https://images.unsplash.com/photo-1676955201699-26e659a36f7a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2829&q=80", layout: 4 }

[step1, step2, step3, step4, step5, step6, step7].each do |hash|
  step = Step.create!(
    title: hash[:title],
    address: hash[:address],
    content: hash[:content],
    duration: hash[:duration],
    latitude: hash[:latitude],
    longitude: hash[:longitude],
    country: hash[:country],
    blog: hash[:blog]
  )
  if hash[:url] == nil
    puts "NO PICTURE URL"
  else
    image = URI.open(hash[:url])
    step.photo_text.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end

def generate_random_landscape_image_url
  Faker::LoremFlickr.image(size: "800x600", search_terms: ['landscape'])
end

japan1 = {
  title: "Japan Journey Gems",
  min_price: rand(1000..3000),
  max_price: rand(3000..4000),
  start_date: "2019-06-01",
  end_date: "2019-07-01",
  carbon_friendly: true,
  user: User.all.sample,
  intro: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  url: "https://images.unsplash.com/photo-1542640244-7e672d6cef4e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80"
}

japan2 = {
  title: "Tokyo Tales and Beyond",
  min_price: rand(500..800),
  max_price: rand(800..1000),
  start_date: "2020-03-01",
  end_date: "2020-03-10",
  carbon_friendly: true,
  user: User.all.sample,
  intro: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  url: "https://images.unsplash.com/photo-1509023464722-18d996393ca8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80"
}

japan3 = {
  title: "Zen Explorations in Japan",
  min_price: rand(8000..10000),
  max_price: rand(10000..12000),
  start_date: "2017-06-01",
  end_date: "2017-12-01",
  carbon_friendly: true,
  user: User.all.sample,
  intro: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  url: "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2388&q=80"
}

japan4 = {
  title: "Adventures in Japan",
  min_price: rand(800..1200),
  max_price: rand(1200..2000),
  start_date: "2022-08-01",
  end_date: "2022-08-15",
  carbon_friendly: true,
  user: User.all.sample,
  intro: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  url: "https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2344&q=80"
}

japan5 = {
  title: "Kyoto Chronicles in Japan",
  min_price: rand(4000..6000),
  max_price: rand(6000..7000),
  start_date: "2023-01-01",
  end_date: "2023-01-30",
  carbon_friendly: true,
  user: User.all.sample,
  intro: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  url: "https://images.unsplash.com/photo-1578469645742-46cae010e5d4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80"
}

  [japan1, japan2, japan3, japan4, japan5].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user],
    intro: hash[:intro]
  )
  image = URI.open(hash[:url])
  blog.photo_banner.attach(io: image, filename: blog.title, content_type: 'png')

  step1 = { title: "Step 1", country: "Japan", blog: Blog.last }

  [step1].each do |step_hash|
    step = Step.create!(
      title: step_hash[:title],
      country: step_hash[:country],
      blog: step_hash[:blog]
    )
    tag_list.sample(3).each do |tag|
      step.tag_list.add tag
    end
    step.save
  end
end


# like = {user: User.random blog: Blog.}
# rand(40..200).times do
# like = Like.create!(
# user: User.random

# end

30.times do
  title = "#{Faker::Lorem.word.capitalize} #{Faker::Lorem.word.capitalize}"
  min_price = rand(500..1000)
  max_price = rand(500..1000)
  start_date = Faker::Date.between(from: '1995-08-13', to: '2020-08-20').to_s
  end_date = Faker::Date.between(from: '2020-10-20', to: '2023-06-09').to_s
  carbon_friendly = true
  user = User.all.sample

  blog = Blog.create!(
    title: title,
    min_price: min_price,
    max_price: max_price,
    start_date: start_date,
    end_date: end_date,
    carbon_friendly: carbon_friendly,
    user: user,
  )
  image = URI.open(generate_random_landscape_image_url)
  blog.photo_banner.attach(io: image, filename: "#{blog.title}.png", content_type: 'image/png')
  blog.save
  puts "Created #{blog.title}"

  title = "#{Faker::Lorem.word.capitalize} #{Faker::Lorem.word.capitalize}"
  country = Faker::Address.unique.country
  blog = Blog.last
  step = Step.create!(
    title: title,
    country: country,
    blog: blog
  )
  tag_list.sample(3).each do |tag|
    step.tag_list.add tag
  end
  step.save
  puts "Created #{step.title}"
end
