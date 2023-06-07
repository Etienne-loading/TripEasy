class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :blogs, dependent: :destroy
  # has_one_attached :profile_photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :pseudo, presence: true, uniqueness: true
  # validates :interest, presence: true, , inclusion: { in: INTEREST }
  validates :nationality, presence: true

  INTEREST = [
    "Adventure tourism",
    "Wildlife safaris",
    "Cultural immersion",
    "Backpacking",
    "Food and culinary exploration",
    "Beach relaxation",
    "Hiking and trekking",
    "Photography",
    "Historical sightseeing",
    "Ecotourism",
    "Scuba diving",
    "Camping",
    "Road trips",
    "Mountain climbing",
    "Volunteering abroad",
    "Wellness retreats",
    "Skiing and snowboarding",
    "Archaeological expeditions",
    "River cruising",
    "Wine tasting tours",
    "Surfing",
    "Yoga retreats",
    "Motorcycle touring",
    "Sailing and yachting",
    "Birdwatching",
    "Hot air ballooning",
    "Cycling tours",
    "Cultural festivals",
    "Desert exploration",
    "Train journeys"
  ]

  NATIONALITIES = [
    "Afghan",
    "Albanian",
    "Algerian",
    "American Samoan",
    "Andorran",
    "Angolan",
    "Anguillan",
    "Antarctic",
    "Antiguan or Barbudan",
    "Argentine",
    "Armenian",
    "Aruban",
    "Australian",
    "Austrian",
    "Azerbaijani, Azeri",
    "Bahamian",
    "Bahraini",
    "Bangladeshi",
    "Barbadian",
    "Belarusian",
    "Belgian",
    "Belizean",
    "Beninese, Beninois",
    "Bermudian, Bermudan",
    "Bhutanese",
    "Bolivian",
    "Bonaire",
    "Bosnian or Herzegovinian",
    "Motswana, Botswanan",
    "Bouvet Island",
    "Brazilian",
    "BIOT",
    "Bruneian",
    "Bulgarian",
    "Burkinab\u00e9",
    "Burundian",
    "Cabo Verdean",
    "Cambodian",
    "Cameroonian",
    "Canadian",
    "Caymanian",
    "Central African",
    "Chadian",
    "Chilean",
    "Chinese",
    "Christmas Island",
    "Cocos Island",
    "Colombian",
    "Comoran, Comorian",
    "Congolese",
    "Congolese",
    "Cook Island",
    "Costa Rican",
    "Ivorian",
    "Croatian",
    "Cuban",
    "Cura\u00e7aoan",
    "Cypriot",
    "Czech",
    "Danish",
    "Djiboutian",
    "Dominican",
    "Dominican",
    "Ecuadorian",
    "Egyptian",
    "Salvadoran",
    "Equatorial Guinean, Equatoguinean",
    "Eritrean",
    "Estonian",
    "Ethiopian",
    "Falkland Island",
    "Faroese",
    "Fijian",
    "Finnish",
    "French",
    "French Guianese",
    "French Polynesian",
    "French Southern Territories",
    "Gabonese",
    "Gambian",
    "Georgian",
    "German",
    "Ghanaian",
    "Gibraltar",
    "Greek, Hellenic",
    "Greenlandic",
    "Grenadian",
    "Guadeloupe",
    "Guamanian, Guambat",
    "Guatemalan",
    "Channel Island",
    "Guinean",
    "Bissau-Guinean",
    "Guyanese",
    "Haitian",
    "Heard Island or McDonald Islands",
    "Vatican",
    "Honduran",
    "Hong Kong, Hong Kongese",
    "Hungarian, Magyar",
    "Icelandic",
    "Indian",
    "Indonesian",
    "Iranian, Persian",
    "Iraqi",
    "Irish",
    "Manx",
    "Israeli",
    "Italian",
    "Jamaican",
    "Japanese",
    "Channel Island",
    "Jordanian",
    "Kazakhstani, Kazakh",
    "Kenyan",
    "I-Kiribati",
    "North Korean",
    "South Korean",
    "Kuwaiti",
    "Kyrgyzstani, Kyrgyz, Kirgiz, Kirghiz",
    "Lao, Laotian",
    "Latvian",
    "Lebanese",
    "Basotho",
    "Liberian",
    "Libyan",
    "Liechtenstein",
    "Lithuanian",
    "Luxembourg, Luxembourgish",
    "Macanese, Chinese",
    "Macedonian",
    "Malagasy",
    "Malawian",
    "Malaysian",
    "Maldivian",
    "Malian, Malinese",
    "Maltese",
    "Marshallese",
    "Martiniquais, Martinican",
    "Mauritanian",
    "Mauritian",
    "Mahoran",
    "Mexican",
    "Micronesian",
    "Moldovan",
    "Monacan",
    "Mongolian",
    "Montenegrin",
    "Montserratian",
    "Moroccan",
    "Mozambican",
    "Burmese",
    "Namibian",
    "Nauruan",
    "Nepali, Nepalese",
    "Dutch, Netherlandic",
    "New Caledonian",
    "New Zealand, NZ",
    "Nicaraguan",
    "Nigerien",
    "Nigerian",
    "Niuean",
    "Norfolk Island",
    "Northern Marianan",
    "Norwegian",
    "Omani",
    "Pakistani",
    "Palauan",
    "Palestinian",
    "Panamanian",
    "Papua New Guinean, Papuan",
    "Paraguayan",
    "Peruvian",
    "Philippine, Filipino",
    "Pitcairn Island",
    "Polish",
    "Portuguese",
    "Puerto Rican",
    "Qatari",
    "Reunionese",
    "Romanian",
    "Russian",
    "Rwandan",
    "Barth\u00e9lemois",
    "Saint Helenian",
    "Kittitian or Nevisian",
    "Saint Lucian",
    "Saint-Martinoise",
    "Saint-Pierrais or Miquelonnais",
    "Saint Vincentian, Vincentian",
    "Samoan",
    "Sammarinese",
    "Saudi, Saudi Arabian",
    "Senegalese",
    "Serbian",
    "Seychellois",
    "Sierra Leonean",
    "Singaporean",
    "Sint Maarten",
    "Slovak",
    "Slovenian, Slovene",
    "Solomon Island",
    "Somali, Somalian",
    "South African",
    "South Georgia or South Sandwich Islands",
    "South Sudanese",
    "Spanish",
    "Sri Lankan",
    "Sudanese",
    "Surinamese",
    "Svalbard",
    "Swazi",
    "Swedish",
    "Swiss",
    "Syrian",
    "Chinese, Taiwanese",
    "Tajikistani",
    "Tanzanian",
    "Thai",
    "Timorese",
    "Togolese",
    "Tokelauan",
    "Tongan",
    "Trinidadian or Tobagonian",
    "Tunisian",
    "Turkish",
    "Turkmen",
    "Turks and Caicos Island",
    "Tuvaluan",
    "Ugandan",
    "Ukrainian",
    "Emirati, Emirian, Emiri",
    "British, UK",
    "American",
    "American",
    "Uruguayan",
    "Uzbekistani, Uzbek",
    "Ni-Vanuatu, Vanuatuan",
    "Venezuelan",
    "Vietnamese",
    "British Virgin Island",
    "U.S. Virgin Island",
    "Wallis and Futuna, Wallisian or Futunan",
    "Sahrawi, Sahrawian, Sahraouian",
    "Yemeni",
    "Zambian",
    "Zimbabwean"
  ]
end
