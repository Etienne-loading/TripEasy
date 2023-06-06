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

guatemala1 = { title: "Bienvenue dans la charmante Antigua : Une introduction au Guatemala", city: "Antigua", content: "Votre aventure commence dans la ville coloniale d'Antigua, avec ses rues pavées pittoresques et ses églises baroques. Dans cet article, découvrez les meilleurs sites à visiter, tels que la Plaza Mayor, la cathédrale et les ruines de l'église de La Merced. Imprégnez-vous de l'atmosphère historique de la ville, goûtez aux délicieux plats locaux et explorez les marchés animés.", duration: 1, latitude: 14.5586, longitude: -90.7295, country: "Guatemala", blog:Blog.first}
guatemala2 = { title: "Émerveillez-vous devant la beauté sereine du Lac Atitlán", city: "Lac Atitlán", content: "Le lac Atitlán est une merveille naturelle entourée de volcans et de villages indigènes. Dans cet article, découvrez les différentes communautés autour du lac, telles que Panajachel, San Marcos et Santiago Atitlán. Partez en bateau pour explorer les villages, admirez les tissages traditionnels des femmes mayas et profitez des vues à couper le souffle sur le lac et ses environs.", duration: 2, latitude: 14.6829, longitude: -91.2736, country: "Guatemala", blog:Blog.first}
guatemala3 = { title: "Un voyage dans l'ancienne civilisation maya : Découvrez le parc national de Tikal", city: "Parc national de Tikal", content: "Plongez dans l'histoire fascinante des Mayas en visitant le parc national de Tikal. Dans cet article, explorez les majestueuses pyramides, les temples sacrés et la jungle dense de ce site archéologique emblématique. Partez à l'aube pour admirer le lever du soleil sur les ruines et écoutez les chants des singes hurleurs. Le parc national de Tikal est une expérience inoubliable pour les passionnés d'histoire et de nature.", duration: 2, latitude: 17.2220, longitude: -89.6237, country: "Guatemala", blog:Blog.first}
guatemala4 = { title: "Détente et exploration à Flores : Porte d'entrée vers les ruines de Yaxha", city: "Flores", content: "Flores, une petite île pittoresque sur le lac Petén Itzá, est votre point de départ pour explorer les ruines de Yaxha. Dans cet article, découvrez la beauté tranquille de Flores avec ses maisons colorées et ses rues pavées. Ensuite, partez à la découverte des ruines de Yaxha, un site moins connu mais tout aussi impressionnant que Tikal. Grimpez au sommet des pyramides pour profiter de vues panoramiques sur la jungle environnante.", duration: 2, latitude: 16.9337, longitude: -89.8923, country: "Guatemala", blog:Blog.first}

[guatemala1, guatemala2, guatemala3, guatemala4].each do |hash|
  step = Step.create!(
    title: hash[:title],
    city: hash[:city],
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
