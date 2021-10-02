# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Researcher.create(
    name: "Merlin Tuttle", 
    email: "merlintuttle@gmail.com",
    address: "5000 Mission Oaks, #41, Austin, Texas 78735",
    phone_number: "(512) 358-0014", 
    organization_id: 1,
    organization_name: "Merlin Tuttle's Bat Conservation", 
    password: "ilovebats",
    access: "admin"
)

Researcher.create(
    name: "Bat Conservation International", 
    email: "batcon@batcon.com", 
    address: "500 N Capital of TX Hwy. Bldg. 1Austin, TX 78746",
    phone_number: "1.800.538.BATS",
    organization_id: 2,
    organization_name: "Bat Conservation International",
    password: "ilovebats",
    access: "admin"
)

Researcher.create(
    name: "Alyson Brokaw", 
    email: "abrokaw@batcon.com", 
    address: "500 N Capital of TX Hwy. Bldg. 1Austin, TX 78746",
    phone_number: "1.800.538.BATS",
    organization_id: 2,
    organization_name: "Bat Conservation International",
    password: "ilovebats",
    access: "member"
)

Bat.create(
    tag_number: "PL24568",
    nickname: "Fox",
    species: "Pteropus Livingstonii",
    date_found: "2020-07-23",
    location: "Taolagnaro, Madagascar",
    date_last_seen: "2020-10-31",
    weight: 850,
    age: 10,
    sex: "F",
    wing_span: 101,
    colony_size: 98,
    conservation_status: "Endangered",
    white_nose_syndrome: false,
    discoverer_id: 1
)

Bat.create(
    tag_number: "EA78990",
    nickname: "Ghost",
    species: "Ectophylla Alba",
    date_found: "2020-09-02",
    location: "Choloma, Honduras",
    date_last_seen: "2021-03-14",
    weight: 5,
    age: 7,
    sex: "M",
    wing_span: 7,
    colony_size: 8,
    conservation_status: "Near Threatened",
    white_nose_syndrome: true,
    discoverer_id: 3
)

Note.create(
    content: "Middle aged female found with two pups. No signs of disease. Rearing a pup.",
    researcher_id: 1,
    bat_id: 1
)

Note.create(
    content: "Male found roosting under a leaf with minor tear in wing membrane.",
    researcher_id: 3,
    bat_id: 2
)


