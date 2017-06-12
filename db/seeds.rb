# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



role = Role.create(:role => "Developer")
role = Role.create(:role => "Host")

jobtitle = Jobtitle.create(:name => "Front-End Developer")
jobtitle = Jobtitle.create(:name => "Full-Stack Developer")

# Creation of Host sample Profile

user = User.new(:email => "ezio@email.com", :firstname => "Ezio", :lastname => "Bertoglio", :country => "IT", :location => "Turin", :roles_id => 2, :password => "fabrizio")


# To be edited when database is resetted, you should fix the Host object
#user = User.find(user.id)
user.skip_confirmation!	

#user = User.find(17)
host = Host.new(:description => "Hello, my name is Fabrizio and I have a couple of nice Web Development projects that i would like to realize with the help from other developers.", :interest_list => "snowboarding, surfing", :skill_list => "project management,")
user.host = host
user.save

#user = User.find(17)
location = Location.create(:description => "Nice Room near to Awesome Ski Resort", :location => "Prali", :singleroom => 1, :skiresort => 1, :country => "IT", :state => "Piedmont")
user.host.locations << location

project = Project.create(:name => "WifiSharing", :description => "Earning Money from Wifi Sharing", :percentage_completion => 0, :budget => 0, :nemployees => 0, :hiring => 1, :ninvestors => 0)
user.host.projects << project

task = Task.create(:name => "Front end WebSite", :description => "creation of the Front End responsive Website for all devices", :completed => 0, :skills_list => "css, html, javascript,", :days => 4)
project.tasks << task

ad = Ad.create(:title => "Front End WebDevelopment", :description => "Webapp Front End Development with HTML, CSS on Ruby on Rails Framework", :budget => 0, :days => 5, :skill_list => "css, html, javascript")
project.ads << ad
location.ads << ad
task.ad = ad

project = Project.find_by_name("WifiSharing")
task = Task.new(:name => "Backend App Development", :description => "Backend WebApp Development with Rails 5", :completed => 0, :skills_list => "css, html, rubyonrails, rails, postgresql, heroku,", :days => 15)
project.tasks << task
task.save

project = Project.find_by_name("WifiSharing")
location = Location.find_by_location("Prali")
task = Task.find_by_name("Backend App Development")
ad = Ad.new(:title => "BackEnd WebDevelopment", :description => "Webapp Back End Development with Ruby on Rails Framework", :budget => 0, :days => 5, :skill_list => "css, html, rails, rubyonrails,")
project.ads << ad
location.ads << ad
task.ad = ad
ad.save

# Creation of Developer sample Profile

user = User.new(:email => "fabrizio@email.com", :firstname => "Fabrizio", :lastname => "Bertoglio", :country => "IT", :location => "Turin", :roles_id => 0, :password => "fabrizio")


# To be edited when database is resetted, you should fix the Host object
#user = User.find(user.id)
user.skip_confirmation!	
user.save

developer = Developer.new(:experience => 1, :interest_list => "snowboarding, surfing, travelling", :skill_list => "HTML, CSS,",:jobtitle => "Full-Stack WebDeveloper")
user.developer = developer



# Creation of Developer sample Profile

user = User.new(:email => "federico@email.com", :firstname => "Federico", :lastname => "Bertoglio", :country => "IT", :location => "Turin", :roles_id => 0, :password => "fabrizio")


# To be edited when database is resetted, you should fix the Host object
#user = User.find(user.id)

user.skip_confirmation!	
user.save

developer = Developer.new(:experience => 1, :interest_list => "snowboarding, surfing, travelling", :skill_list => "HTML, CSS,", :jobtitle => "Full-Stack WebDeveloper")
user.developer = developer

# Creation of Host sample Profile

user = User.new(:email => "enzo@email.com", :firstname => "Enzo", :lastname => "Motorini", :country => "IT", :location => "Turin", :roles_id => 1, :password => "fabrizio")


# To be edited when database is resetted, you should fix the Host object
#user = User.find(user.id)
user.skip_confirmation!	
user.save

#user = User.find(17)
host = Host.new(:description => "Hello, my name is Enzo and I have a couple of nice Web Development projects that i would like to realize with the help from other developers.", :interest_list => "walking, talking,", :skill_list => "project management, accounting,")
user.host = host
user.save

#user = User.find(17)
location = Location.create(:description => "Nice Room in Leipzig", :location => "Leipzig", :singleroom => 1, :skiresort => 0, :country => "DE", :state => "Sachsen")
user.host.locations << location

project = Project.create(:name => "PetSharing", :description => "Saving money and time by sharing a Pet", :percentage_completion => 50, :budget => 3000, :nemployees => 0, :hiring => 1, :ninvestors => 0)
user.host.projects << project

task = Task.create(:name => "Front end Development", :description => "creation of the Front End responsive Website for all devices", :completed => 0, :skills_list => "css, html, javascript,", :days => 4)
project.tasks << task

ad = Ad.create(:title => "Front End WebDevelopment", :description => "Webapp Front End Development with HTML, CSS on Ruby on Rails Framework", :budget => 0, :days => 5, :skill_list => "css, html, javascript")
project.ads << ad
location.ads << ad
task.ad = ad

task = Task.create(:name => "Design", :description => "making a Mock Up for the WebApp", :completed => 0, :skills_list => "photoshop, design, mochup,", :days => 3)
project.tasks << task

ad = Ad.create(:title => "Website Design with PS", :description => "Website Design with PS for a PetSharing Application", :budget => 300, :days => 5, :skill_list => "photoshop, design, mochup,")
project.ads << ad
location.ads << ad
task.ad = ad

#user = User.find(17)
location = Location.create(:description => "Nice Villa in Bali", :location => "Leipzig", :singleroom => 1, :villa => 1, :surfspot => 1, :country => "IN", :state => "Bali")
user.host.locations << location

project = Project.create(:name => "SurfCoaching", :description => "Saving money and time by sharing a Surfcoach", :percentage_completion => 80, :budget => 150, :nemployees => 0, :hiring => 1, :ninvestors => 0)
user.host.projects << project

task = Task.create(:name => "Front end Development", :description => "creation of the Front End responsive Website for all devices", :completed => 0, :skills_list => "css, html, javascript,", :days => 4)
project.tasks << task

ad = Ad.create(:title => "Front End WebDevelopment", :description => "Webapp Front End Development with HTML, CSS on Ruby on Rails Framework", :budget => 0, :days => 5, :skill_list => "css, html, javascript")
project.ads << ad
location.ads << ad
task.ad = ad

task = Task.create(:name => "Design", :description => "making a Mock Up for the WebApp", :completed => 0, :skills_list => "photoshop, design, mochup,", :days => 3)
project.tasks << task

ad = Ad.create(:title => "Website Design with PS", :description => "Website Design with PS for a PetSharing Application", :budget => 300, :days => 5, :skill_list => "photoshop, design, mochup,")
project.ads << ad
location.ads << ad
task.ad = ad

task = Task.new(:name => "Backend App Development", :description => "Backend WebApp Development with Rails 5", :completed => 0, :skills_list => "css, html, rubyonrails, rails, postgresql, heroku,", :days => 15)
project.tasks << task
task.save

ad = Ad.new(:title => "BackEnd WebDevelopment", :description => "Webapp Back End Development with Ruby on Rails Framework", :budget => 0, :days => 5, :skill_list => "css, html, rails, rubyonrails,")
project.ads << ad
location.ads << ad
task.ad = ad
ad.save