require 'faker'

User.destroy_all
Blog.destroy_all
Step.destroy_all

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

guatemala = { title: "Explorations au Guatemala : Un voyage riche en couleurs et en culture", min_price: 1000, max_price: 1500, start_date: "2022-10-12", end_date: "2022-10-22", carbon_friendly:true, user:User.all.sample }
[guatemala].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user]
  )
  puts "Created #{blog.title}"
  blog.save
end

guatemala1 = { title: "Bienvenue dans la charmante Antigua : Une introduction au Guatemala", address: "Antigua", content: "Votre aventure commence dans la ville coloniale d'Antigua, avec ses rues pavées pittoresques et ses églises baroques. Dans cet article, découvrez les meilleurs sites à visiter, tels que la Plaza Mayor, la cathédrale et les ruines de l'église de La Merced. Imprégnez-vous de l'atmosphère historique de la ville, goûtez aux délicieux plats locaux et explorez les marchés animés.", duration: 1, latitude: 14.5586, longitude: -90.7295, country: "Guatemala", blog:Blog.last, url:"https://images.unsplash.com/photo-1582300857444-5ddd87c86797?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"}
guatemala2 = {title: "Émerveillez-vous devant la beauté sereine du Lac Atitlán", address: "Lac Atitlán", content: "Le lac Atitlán est une merveille naturelle entourée de volcans et de villages indigènes. Dans cet article, découvrez les différentes communautés autour du lac, telles que Panajachel, San Marcos et Santiago Atitlán. Partez en bateau pour explorer les villages, admirez les tissages traditionnels des femmes mayas et profitez des vues à couper le souffle sur le lac et ses environs.", duration: 2, latitude: 14.6829, longitude: -91.2736, country: "Guatemala", blog:Blog.last, url:"https://images.unsplash.com/photo-1637181416128-7a32516e0ad0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2832&q=80"}
guatemala3 = { title: "Un voyage dans l'ancienne civilisation maya : Découvrez le parc national de Tikal", address: "Parc national de Tikal", content: "Plongez dans l'histoire fascinante des Mayas en visitant le parc national de Tikal. Dans cet article, explorez les majestueuses pyramides, les temples sacrés et la jungle dense de ce site archéologique emblématique. Partez à l'aube pour admirer le lever du soleil sur les ruines et écoutez les chants des singes hurleurs. Le parc national de Tikal est une expérience inoubliable pour les passionnés d'histoire et de nature.", duration: 2, latitude: 17.2220, longitude: -89.6237, country: "Guatemala", blog:Blog.last}
guatemala4 = { title: "Détente et exploration à Flores : Porte d'entrée vers les ruines de Yaxha", address: "Flores", content: "Flores, une petite île pittoresque sur le lac Petén Itzá, est votre point de départ pour explorer les ruines de Yaxha. Dans cet article, découvrez la beauté tranquille de Flores avec ses maisons colorées et ses rues pavées. Ensuite, partez à la découverte des ruines de Yaxha, un site moins connu mais tout aussi impressionnant que Tikal. Grimpez au sommet des pyramides pour profiter de vues panoramiques sur la jungle environnante.", duration: 2, latitude: 16.9337, longitude: -89.8923, country: "Guatemala", blog:Blog.last}

[guatemala1, guatemala2, guatemala3, guatemala4].each do |hash|
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
  step.save
  puts "Created #{step.title}"
end

spain = { title: "Le Grand Pays de Raphaël Nadal", min_price: 800, max_price: 1000, start_date: "2023-01-02", end_date: "2023-01-17", carbon_friendly:true, user:User.all.sample }
[spain].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user]
  )
  puts "Created #{blog.title}"
  blog.save
end

spain1 = {title: "Découvrez l'effervescence de Madrid : Capitale vibrante de l'Spain", address: "Madrid", content: "Votre voyage débute dans la magnifique ville de Madrid, où l'histoire et la modernité se mêlent harmonieusement. Dans cet article, explorez les joyaux de Madrid, tels que le Palais Royal, la Plaza Mayor et le musée du Prado. Plongez dans la vie nocturne animée de la ville, dégustez des tapas délicieuses et profitez de l'atmosphère chaleureuse des rues madrilènes.", duration: 2, latitude: 40.4168, longitude: -3.7038, country: "Spain", blog:Blog.last}
spain2 = {title: "Laissez-vous charmer par Barcelone : Perle de la Méditerranée", address: "Barcelone", content: "Barcelone vous accueille avec son architecture emblématique, ses plages ensoleillées et sa riche culture catalane. Dans cet article, découvrez les merveilles de la ville, telles que la Sagrada Familia, le parc Güell et la promenade animée de Las Ramblas. Imprégnez-vous de l'atmosphère bohème du quartier gothique, goûtez à la délicieuse cuisine catalane et profitez des vues imprenables depuis le mont Tibidabo.", duration: 3, latitude: 41.3851, longitude: 2.1734, country: "Spain", blog:Blog.last}
spain3 = {title: "Explorez la beauté mauresque de Grenade : Un trésor de l'Andalousie", address: "Grenade", content: "Grenade vous transporte dans l'époque mauresque avec son emblématique Alhambra et ses ruelles étroites remplies de charme. Dans cet article, découvrez l'Alhambra, un complexe palatial incroyablement détaillé, et promenez-vous dans les quartiers de l'Albaicín et du Sacromonte. Imprégnez-vous de l'ambiance andalouse, assistez à un spectacle de flamenco et dégustez des tapas authentiques accompagnées de vins locaux.", duration: 3, latitude: 37.1773, longitude: -3.5986, country: "Spain", blog:Blog.last}
spain4 = {title: "Vibrez au rythme de Séville : Capitale culturelle de l'Andalousie", address: "Séville", content: "Séville vous enchantera avec son architecture mauresque, ses jardins luxuriants et son ambiance festive. Dans cet article, découvrez la majestueuse cathédrale de Séville, l'imposante Plaza de España et le palais royal de l'Alcazar.", duration: 3, latitude: 7.3891, longitude: -5.9845, country:"Spain", blog:Blog.last}
spain5 = {title: "Détente et modernité à Valence : La ville des arts et des sciences", address: "Valence", content: "Valence offre un mélange unique de plages magnifiques, d'architecture moderne et d'une riche histoire. Dans cet article, découvrez la Cité des Arts et des Sciences, un complexe architectural futuriste, visitez la vieille ville avec sa cathédrale et dégustez la célèbre paella valencienne. Profitez également des plages de sable fin et explorez le charmant quartier de pêcheurs d'El Cabanyal", duration: 2, latitude: 39.46, longitude: -0.37 , country: "Spain", blog:Blog.last}
spain6 = {title: "Cordoue, un voyage dans le temps : Entre histoire et culture andalouse", address: "Cordoue", content: "Cordoue vous transporte dans l'époque glorieuse du califat omeyyade avec sa célèbre mosquée-cathédrale, la Mezquita. Dans cet article, explorez les ruelles étroites de la Judería, le quartier juif, visitez l'Alcázar des rois chrétiens et promenez-vous dans les jardins de l'Alcázar de los Reyes Cristianos. Plongez dans l'atmosphère intemporelle de cette ville chargée d'histoire et d'influences culturelles", duration: 2, latitude: 37.88, longitude: -4.77, country: "Spain", blog:Blog.last}

[spain1, spain2, spain3, spain4, spain5, spain6].each do |hash|
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
  step.save
  puts "Created #{step.title}"
end

myanmar = { title: "Exploration enchantée : À la découverte de la richesse du Myanmar", min_price: 1500, max_price: 2000, start_date: "2023-03-02", end_date: "2023-03-13", carbon_friendly:false, user:User.all.sample }
[myanmar].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user]
  )
  puts "Created #{blog.title}"
  blog.save
end

myanmar1 = { title: "Découvrez la magie de Yangon : Porte d'entrée du Myanmar", address: "Yangon", content: "Votre voyage commence dans la fascinante ville de Yangon, où se mêlent tradition et modernité. Explorez les merveilles de Yangon, telles que la pagode Shwedagon, l'architecture coloniale britannique et les marchés animés. Imprégnez-vous de la spiritualité bouddhiste et goûtez aux délices culinaires locaux.", duration: 2, latitude: 16.8409, longitude: 96.1735, country: "Myanmar", blog:Blog.last }
myanmar2 = { title: "Émerveillez-vous devant les temples de Bagan : Un trésor architectural", address: "Bagan", content: "Bagan vous transporte dans un paysage de temples et de pagodes majestueux. Explorez les temples millénaires, assistez à un lever de soleil magique depuis une montgolfière, et plongez-vous dans l'histoire et la spiritualité de ce lieu unique.", duration: 2, latitude: 21.1722, longitude: 94.8606, country: "Myanmar", blog:Blog.last }
myanmar3 = { title: "Explorez la beauté sereine du lac Inle : Un paradis naturel", address: "Lac Inle", content: "Le lac Inle est un endroit enchanteur où vous découvrirez un mode de vie traditionnel unique. Partez en excursion en bateau pour explorer les villages flottants, admirez les pêcheurs avec leur technique de rame unique et découvrez l'artisanat local. Profitez également des magnifiques paysages et de la tranquillité du lac.", duration: 2, latitude: 20.5863, longitude: 96.9102, country: "Myanmar", blog:Blog.last }
myanmar4 = { title: "Découvrez la grandeur de Mandalay : Ancienne capitale royale", address: "Mandalay", content: "Mandalay vous offre un voyage dans l'histoire royale du Myanmar. Visitez le palais royal, les temples sacrés et le célèbre pont U Bein. Explorez les collines environnantes pour admirer le coucher de soleil depuis le monastère de Mandalay et plongez-vous dans l'atmosphère animée des marchés locaux.", duration: 3, latitude: 21.9588, longitude: 96.0891, country: "Myanmar", blog:Blog.last }
myanmar5 = { title: "Détente sur les plages de Ngapali : Un paradis tropical", address: "Ngapali", content: "Ngapali est une destination balnéaire idyllique pour se détendre et profiter des plages de sable fin. Passez vos journées à vous prélasser au soleil, à nager dans les eaux turquoise et à déguster des fruits de mer frais. Offrez-vous des massages relaxants et admirez les magnifiques couchers de soleil.", duration: 2, latitude: 18.4537, longitude: 94.3895, country: "Myanmar", blog:Blog.last }

[myanmar1, myanmar2, myanmar3, myanmar4, myanmar5].each do |hash|
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
  step.save
  puts "Created #{step.title}"
end

lithuania = { title: "Unveiling Lithuania: A Journey through History, Culture, and Natural Beauty", min_price: 500, max_price: 1000, start_date: "2019-08-20", end_date: "2019-08-13", carbon_friendly:true, user:User.all.sample }
[lithuania].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user]
  )
  puts "Created #{blog.title}"
  blog.save
end

lithuania1 = { title: "Discover the Charm of Vilnius: The Capital of Lithuania", address: "Vilnius", content: "Your journey begins in the enchanting city of Vilnius, where history and culture come alive. Explore the charming Old Town, visit the iconic Gediminas' Tower, and immerse yourself in the vibrant atmosphere of Užupis, the artistic district. Indulge in traditional Lithuanian cuisine and discover the rich heritage of this UNESCO World Heritage Site.", duration: 2, latitude: 54.6872, longitude: 25.2797, country: "Lithuania", blog:Blog.last }
lithuania2 = { title: "Experience the Vibrant Spirit of Kaunas: Lithuania's Cultural Hub", address: "Kaunas", content: "Kaunas, the second-largest city in Lithuania, offers a blend of history and modernity. Explore the beautiful Old Town, visit the impressive Kaunas Castle, and discover the vibrant street art scene. Immerse yourself in the city's cultural heritage at the M.K. Čiurlionis National Museum of Art and enjoy the lively atmosphere of Laisvės alėja, the main pedestrian street.", duration: 2, latitude: 54.8985, longitude: 23.9036, country: "Lithuania", blog:Blog.last }
lithuania3 = { title: "Relax and Rejuvenate in Palanga: Lithuania's Seaside Gem", address: "Palanga", content: "Palanga is a charming seaside town known for its sandy beaches and beautiful dunes. Enjoy leisurely strolls along the Palanga Pier, explore the enchanting Botanical Gardens, and visit the historic Palanga Amber Museum. Indulge in fresh seafood, unwind at the spa, and embrace the peaceful ambiance of this coastal retreat.", duration: 3, latitude: 55.9209, longitude: 21.0713, country: "Lithuania", blog:Blog.last }
lithuania4 = { title: "Immerse Yourself in Nature: Trakai and the Curonian Spit", address: "Trakai and Curonian Spit", content: "Experience the natural beauty of Lithuania with visits to Trakai and the Curonian Spit. Explore the picturesque Trakai Island Castle and learn about the country's medieval history. Then, venture to the Curonian Spit, a UNESCO World Heritage Site, where you can enjoy stunning sand dunes, scenic bike rides, and birdwatching in the Curonian Lagoon. Experience the unique culture and traditions of the Kursenieki people, the ethnic group living in the area.", duration: 4, latitude: 54.6408, longitude: 24.9335, country: "Lithuania", blog:Blog.last }

[lithuania1, lithuania2, lithuania3, lithuania4].each do |hash|
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
  step.save
  puts "Created #{step.title}"
end

japan = { title: "Wanderlust Japan: A Journey through Ancient Traditions and Modern Wonders", min_price: 500, max_price: 1000, start_date: "2019-08-20", end_date: "2019-08-13", carbon_friendly:true, user:User.all.sample }
[japan].each do |hash|
  blog = Blog.create!(
    title: hash[:title],
    min_price: hash[:min_price],
    max_price: hash[:min_price],
    start_date: hash[:start_date],
    end_date: hash[:end_date],
    carbon_friendly: hash[:carbon_friendly],
    user: hash[:user]
  )
  puts "Created #{blog.title}"
  blog.save
end

japan1 = { title: "Exploring the Vibrant Metropolis: Tokyo, Japan", address: "Tokyo", content: "Begin your Japanese adventure in the bustling metropolis of Tokyo. Immerse yourself in the vibrant city life as you explore iconic landmarks such as the Tokyo Skytree, the historic Asakusa district, and the trendy neighborhoods of Shibuya and Harajuku. Indulge in delicious cuisine, visit traditional temples, and experience the unique blend of ancient traditions and modern innovation.", duration: 5, latitude: 35.6895, longitude: 139.6917, country: "Japan", blog:Blog.last }
japan2 = { title: "Discovering the Cultural Capital: Kyoto, Japan", address: "Kyoto", content: "Experience the rich cultural heritage of Japan in the historic city of Kyoto. Visit magnificent temples such as Kinkaku-ji (Golden Pavilion) and Kiyomizu-dera, stroll through the enchanting Arashiyama Bamboo Grove, and explore the traditional geisha district of Gion. Immerse yourself in the serene beauty of Japanese gardens and indulge in authentic tea ceremonies.", duration: 4, latitude: 35.0116, longitude: 135.7681, country: "Japan", blog:Blog.last }
japan3 = { title: "Feasting and Fun in Osaka: Japan's Culinary Capital", address: "Osaka", content: "Treat your taste buds in the gastronomic paradise of Osaka. Sample delicious street food at Dotonbori, explore the vibrant Kuromon Ichiba Market, and visit the historic Osaka Castle. Experience the lively atmosphere of Universal Studios Japan and unwind in the serene Osaka Castle Park. Enjoy the city's vibrant nightlife and embrace the friendly and welcoming spirit of Osaka.", duration: 3, latitude: 34.6937, longitude: 135.5023, country: "Japan", blog:Blog.last }
japan4 = { title: "Reflection and Resilience in Hiroshima: City of Peace", address: "Hiroshima", content: "Journey to Hiroshima, a city with a profound history. Pay your respects at the Hiroshima Peace Memorial Park and Museum, learn about the tragic events of the atomic bombing, and appreciate the city's commitment to peace and reconciliation. Explore the picturesque Miyajima Island with its iconic floating torii gate and serene temples. Witness the vibrant cherry blossoms in spring or the fiery hues of autumn in Hiroshima's beautiful gardens.", duration: 3, latitude: 34.3853, longitude: 132.4553, country: "Japan", blog:Blog.last }
japan5 = { title: "Nature's Wonderland: Exploring Hokkaido's Beauty", address: "Hokkaido", content: "Venture to the northernmost island of Japan, Hokkaido, known for its stunning natural landscapes. Discover the breathtaking beauty of national parks like Shiretoko and Daisetsuzan, soak in natural hot springs, and experience the unique wildlife, including the iconic red-crowned cranes. Enjoy outdoor activities such as hiking, skiing, and exploring the charming cities of Sapporo and Otaru.", duration: "6", latitude: 43.2203, longitude: 142.8635, country: "Japan", blog:Blog.last }
japan6 = { title: "Encounters with History and Deer: Nara, Japan", address: "Nara", content: "Step back in time in Nara, the ancient capital of Japan. Explore the UNESCO World Heritage Sites of Nara Park, including Todai-ji Temple with its massive bronze Buddha statue. Wander through the picturesque Isuien Garden and encounter the friendly deer that roam freely in the city. Visit the serene Kasuga Taisha Shrine and immerse yourself in the traditional atmosphere of this historic city.", duration: "3", latitude: 34.6851, longitude: 135.8048, country: "Japan", blog:Blog.last }
japan7 = { title: "Tropical Paradise: Relaxation in Okinawa's Islands", address: "Okinawa", content: "Conclude your journey in the idyllic islands of Okinawa, where pristine beaches, turquoise waters, and a unique culture await. Relax on the beautiful white sands of Ishigaki or Miyako Islands, go snorkeling or diving in the vibrant coral reefs, and explore the rich history and traditions of Okinawa at Shuri Castle and traditional Ryukyu villages. Indulge in delicious local cuisine and soak up the warm hospitality of the Okinawan people.", duration: "4", latitude: 26.2124, longitude: 127.6809, country: "Japan", blog:Blog.last }

[japan1, japan2, japan3, japan4, japan5, japan6, japan7].each do |hash|
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
  step.save
  puts "Created #{step.title}"
  puts "DONNNNNNNNNNNNNNE"
end
