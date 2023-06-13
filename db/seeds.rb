require 'faker'
require "open-uri"
require 'json'

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

guatemala = { title: "Explorations au Guatemala", min_price: 1000, max_price: 1500, start_date: "2022-10-12", end_date: "2022-10-22", carbon_friendly:true, user:User.all.sample, intro:"Bienvenue au Guatemala, un joyau d'Amérique centrale qui allie nature spectaculaire et héritage culturel. Explorez les villes coloniales pittoresques, découvrez des sites archéologiques mayas fascinants, et émerveillez-vous devant des paysages de volcans majestueux et de lacs pittoresques. Imprégnez-vous de la richesse des traditions guatémaltèques, goûtez à une délicieuse cuisine locale et laissez-vous charmer par l'accueil chaleureux des habitants. Préparez-vous à vivre une expérience immersive et enrichissante au Guatemala, où l'aventure et la découverte vous attendent à chaque tournant."}
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

step1 = { title: "Bienvenue dans la charmante Antigua : Une introduction au Guatemala", address: "Antigua", content: "Votre aventure commence dans la ville coloniale d'Antigua, avec ses rues pavées pittoresques et ses églises baroques. Dans cet article, découvrez les meilleurs sites à visiter, tels que la Plaza Mayor, la cathédrale et les ruines de l'église de La Merced. Imprégnez-vous de l'atmosphère historique de la ville, goûtez aux délicieux plats locaux et explorez les marchés animés.", duration: 1, latitude: 14.5586, longitude: -90.7295, country: "Guatemala", blog:Blog.last, url:"https://images.unsplash.com/photo-1563442744-3e17a3bf4932?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2340&q=80", layout: 4 }
step2 = { title: "Émerveillez-vous devant la beauté sereine du Lac Atitlán", address: "Lac Atitlán", content: "Le lac Atitlán est une merveille naturelle entourée de volcans et de villages indigènes. Dans cet article, découvrez les différentes communautés autour du lac, telles que Panajachel, San Marcos et Santiago Atitlán. Partez en bateau pour explorer les villages, admirez les tissages traditionnels des femmes mayas et profitez des vues à couper le souffle sur le lac et ses environs.", duration: 2, latitude: 14.6829, longitude: -91.2736, country: "Guatemala", blog:Blog.last, url:"https://images.unsplash.com/photo-1637181416128-7a32516e0ad0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2832&q=80", layout: 4 }
step3 = { title: "Un voyage dans l'ancienne civilisation maya : Découvrez le parc national de Tikal", address: "Parc national de Tikal", content: "Plongez dans l'histoire fascinante des Mayas en visitant le parc national de Tikal. Dans cet article, explorez les majestueuses pyramides, les temples sacrés et la jungle dense de ce site archéologique emblématique. Partez à l'aube pour admirer le lever du soleil sur les ruines et écoutez les chants des singes hurleurs. Le parc national de Tikal est une expérience inoubliable pour les passionnés d'histoire et de nature.", duration: 2, latitude: 17.2220, longitude: -89.6237, country: "Guatemala", blog:Blog.last, url: "https://images.unsplash.com/photo-1508035460735-91088c495500?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80" ,layout: 4}
step4 = { title: "Détente et exploration à Flores : Porte d'entrée vers les ruines de Yaxha", address: "Flores", content: "Flores, une petite île pittoresque sur le lac Petén Itzá, est votre point de départ pour explorer les ruines de Yaxha. Dans cet article, découvrez la beauté tranquille de Flores avec ses maisons colorées et ses rues pavées. Ensuite, partez à la découverte des ruines de Yaxha, un site moins connu mais tout aussi impressionnant que Tikal. Grimpez au sommet des pyramides pour profiter de vues panoramiques sur la jungle environnante.", duration: 2, latitude: 16.9337, longitude: -89.8923, country: "Guatemala", blog:Blog.last, url:"https://images.unsplash.com/photo-1508035460735-91088c495500?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80", layout: 4 }

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
    step.photo.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end

spain = { title: "Le Grand Pays de Rafael", min_price: 800, max_price: 1000, start_date: "2023-01-02", end_date: "2023-01-17", carbon_friendly:true, user:User.all.sample, intro:"Bienvenue en Espagne, un pays riche en histoire, en culture et en beauté naturelle. De villes animées à des plages paradisiaques, ce voyage de 20 jours vous permettra de découvrir toute la diversité de l'Espagne. Explorez les sites emblématiques tels que la Sagrada Familia à Barcelone, promenez-vous dans les ruelles étroites de l'Albaicín à Grenade, goûtez aux délices de la cuisine espagnole à Madrid et détendez-vous sur les plages ensoleillées de la Costa del Sol. Préparez-vous à être charmé par la passion, l'art et l'hospitalité espagnole tout au long de votre voyage inoubliable en Espagne." }
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

step1 = { title: "Découvrez l'effervescence de Madrid : Capitale vibrante de l'Espagne", address: "Madrid", content: "Votre voyage débute dans la magnifique ville de Madrid, où l'histoire et la modernité se mêlent harmonieusement. Dans cet article, explorez les joyaux de Madrid, tels que le Palais Royal, la Plaza Mayor et le musée du Prado. Plongez dans la vie nocturne animée de la ville, dégustez des tapas délicieuses et profitez de l'atmosphère chaleureuse des rues madrilènes.", duration: 2, latitude: 40.4168, longitude: -3.7038, country: "Spain", blog:Blog.last, url:"https://images.unsplash.com/photo-1558370781-d6196949e317?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2358&q=80",layout: 4 }
step2 = { title: "Laissez-vous charmer par Barcelone : Perle de la Méditerranée", address: "Barcelone", content: "Barcelone vous accueille avec son architecture emblématique, ses plages ensoleillées et sa riche culture catalane. Dans cet article, découvrez les merveilles de la ville, telles que la Sagrada Familia, le parc Güell et la promenade animée de Las Ramblas. Imprégnez-vous de l'atmosphère bohème du quartier gothique, goûtez à la délicieuse cuisine catalane et profitez des vues imprenables depuis le mont Tibidabo.", duration: 3, latitude: 41.3851, longitude: 2.1734, country: "Spain", blog:Blog.last ,layout: 4}
step3 = { title: "Explorez la beauté mauresque de Grenade : Un trésor de l'Andalousie", address: "Grenade", content: "Grenade vous transporte dans l'époque mauresque avec son emblématique Alhambra et ses ruelles étroites remplies de charme. Dans cet article, découvrez l'Alhambra, un complexe palatial incroyablement détaillé, et promenez-vous dans les quartiers de l'Albaicín et du Sacromonte. Imprégnez-vous de l'ambiance andalouse, assistez à un spectacle de flamenco et dégustez des tapas authentiques accompagnées de vins locaux.", duration: 3, latitude: 37.1773, longitude: -3.5986, country: "Spain", blog:Blog.last, url:"https://images.unsplash.com/photo-1647797833375-63d6ecc36d62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2429&q=80",layout: 4}
step4 = { title: "Vibrez au rythme de Séville : Capitale culturelle de l'Andalousie", address: "Séville", content: "Séville vous enchantera avec son architecture mauresque, ses jardins luxuriants et son ambiance festive. Dans cet article, découvrez la majestueuse cathédrale de Séville, l'imposante Plaza de España et le palais royal de l'Alcazar.", duration: 3, latitude: 7.3891, longitude: -5.9845, country:"Spain", blog:Blog.last, url: "https://images.unsplash.com/photo-1634893448760-0cb6e1af22f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2342&q=80", layout: 4 }
step5 = { title: "Détente et modernité à Valence : La ville des arts et des sciences", address: "Valence", content: "Valence offre un mélange unique de plages magnifiques, d'architecture moderne et d'une riche histoire. Dans cet article, découvrez la Cité des Arts et des Sciences, un complexe architectural futuriste, visitez la vieille ville avec sa cathédrale et dégustez la célèbre paella valencienne. Profitez également des plages de sable fin et explorez le charmant quartier de pêcheurs d'El Cabanyal", duration: 2, latitude: 39.46, longitude: -0.37 , country: "Spain", blog:Blog.last, layout: 4 }
step6 = { title: "Cordoue, un voyage dans le temps : Entre histoire et culture andalouse", address: "Cordoue", content: "Cordoue vous transporte dans l'époque glorieuse du califat omeyyade avec sa célèbre mosquée-cathédrale, la Mezquita. Dans cet article, explorez les ruelles étroites de la Judería, le quartier juif, visitez l'Alcázar des rois chrétiens et promenez-vous dans les jardins de l'Alcázar de los Reyes Cristianos. Plongez dans l'atmosphère intemporelle de cette ville chargée d'histoire et d'influences culturelles", duration: 2, latitude: 37.88, longitude: -4.77, country: "Spain", blog:Blog.last, layout: 4}

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
    step.photo.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end

myanmar = { title: "Exploration enchantée", min_price: 1500, max_price: 2000, start_date: "2023-03-02", end_date: "2023-03-13", carbon_friendly:false, user:User.all.sample, intro:"Bienvenue au Myanmar, un pays mystérieux et enchanteur d'Asie du Sud-Est. Préparez-vous à plonger dans une culture riche et préservée, à découvrir des temples majestueux, des paysages époustouflants et une hospitalité chaleureuse. Explorez les splendeurs de Yangon avec la célèbre pagode Shwedagon, laissez-vous émerveiller par les temples de Bagan, embarquez pour une croisière sur le majestueux fleuve Irrawaddy et imprégnez-vous de l'atmosphère unique du lac Inle. Le Myanmar vous promet une aventure immersive à travers son histoire, ses traditions et sa nature préservée. Préparez-vous à être transporté dans un monde de beauté et de spiritualité lors de ce voyage inoubliable au Myanmar." }
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

step1 = { title: "Découvrez la magie de Yangon : Porte d'entrée du Myanmar", address: "Yangon", content: "Votre voyage commence dans la fascinante ville de Yangon, où se mêlent tradition et modernité. Explorez les merveilles de Yangon, telles que la pagode Shwedagon, l'architecture coloniale britannique et les marchés animés. Imprégnez-vous de la spiritualité bouddhiste et goûtez aux délices culinaires locaux.", duration: 2, latitude: 16.8409, longitude: 96.1735, country: "Myanmar", blog:Blog.last, url:"https://images.unsplash.com/photo-1612257999781-1a997105f94b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2344&q=80", layout: 4 }
step2 = { title: "Émerveillez-vous devant les temples de Bagan : Un trésor architectural", address: "Bagan", content: "Bagan vous transporte dans un paysage de temples et de pagodes majestueux. Explorez les temples millénaires, assistez à un lever de soleil magique depuis une montgolfière, et plongez-vous dans l'histoire et la spiritualité de ce lieu unique.", duration: 2, latitude: 21.1722, longitude: 94.8606, country: "Myanmar", blog:Blog.last, layout: 4 }
step3 = { title: "Explorez la beauté sereine du lac Inle : Un paradis naturel", address: "Lac Inle", content: "Le lac Inle est un endroit enchanteur où vous découvrirez un mode de vie traditionnel unique. Partez en excursion en bateau pour explorer les villages flottants, admirez les pêcheurs avec leur technique de rame unique et découvrez l'artisanat local. Profitez également des magnifiques paysages et de la tranquillité du lac.", duration: 2, latitude: 20.5863, longitude: 96.9102, country: "Myanmar", blog:Blog.last, url:"https://images.unsplash.com/photo-1674468926641-11ad5a62eb9f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2839&q=80", layout: 4 }
step4 = { title: "Découvrez la grandeur de Mandalay : Ancienne capitale royale", address: "Mandalay", content: "Mandalay vous offre un voyage dans l'histoire royale du Myanmar. Visitez le palais royal, les temples sacrés et le célèbre pont U Bein. Explorez les collines environnantes pour admirer le coucher de soleil depuis le monastère de Mandalay et plongez-vous dans l'atmosphère animée des marchés locaux.", duration: 3, latitude: 21.9588, longitude: 96.0891, country: "Myanmar", blog:Blog.last, layout: 4 }
step5 = { title: "Détente sur les plages de Ngapali : Un paradis tropical", address: "Ngapali", content: "Ngapali est une destination balnéaire idyllique pour se détendre et profiter des plages de sable fin. Passez vos journées à vous prélasser au soleil, à nager dans les eaux turquoise et à déguster des fruits de mer frais. Offrez-vous des massages relaxants et admirez les magnifiques couchers de soleil.", duration: 2, latitude: 18.4537, longitude: 94.3895, country: "Myanmar", blog:Blog.last, url:"https://images.unsplash.com/photo-1506399005762-2088660f5c38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80" , layout: 4}

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
    step.photo.attach(io: image, filename: step.title, content_type: 'png')
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
    step.photo.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end

japan = { title: "Wanderlust Japan", min_price: 500, max_price: 1000, start_date: "2019-08-01", end_date: "2019-12-13", carbon_friendly:true, user:User.all.sample, intro:"Welcome to Japan, a land of captivating contrasts where ancient traditions blend seamlessly with modern innovation. Embark on a month-long adventure through this enchanting country and prepare to be captivated by its rich culture, stunning landscapes, and warm hospitality. Start your journey in Tokyo, a bustling metropolis where traditional temples stand side by side with towering skyscrapers. Immerse yourself in the vibrant street life of Shibuya and explore the serene gardens of the Imperial Palace. Head to Kyoto, a city of timeless beauty, where you can discover the iconic golden pavilion of Kinkaku-ji and wander through the enchanting Arashiyama Bamboo Grove. Experience a traditional tea ceremony and witness the grace and elegance of geisha performances." }
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
    step.photo.attach(io: image, filename: step.title, content_type: 'png')
  end
  step.save
  puts "Created #{step.title}"
end
  puts "DONNNNNNNNNNNNNNE"


def generate_random_landscape_image_url
  Faker::LoremFlickr.image(size: "800x600", search_terms: ['landscape'])
end

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
  step.save
  puts "Created #{step.title}"
end
