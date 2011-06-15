# encoding: utf-8

def create_user(group, name, email)
  user = User.create!(:name => name, :email => email, :password => 'entrar', :password_confirmation => 'entrar')
  group.users << user
  group.save
  user
end

cyl = Group.create!(:name => 'Crestas y lechugas', :subdomain => 'cyl')
blah = Group.create!(:name => 'Blah', :subdomain => 'blah')

User.create!(:name => 'Anónimx', :email => 'anonimo@crestasylechugas.org', :password => 'none', :password_confirmation => 'none')
danigb = create_user(cyl, 'Danigb', 'danigb@gmail.com')
blah.users << danigb
blah.save

[{:name=>"Vega", :email=>"vegalina@gmail.com"}, {:name=>"Manu", :email=>"manusantiago@gmail.com"},
 {:name=>"Marianna", :email=>"marionn_nn@yahoo.es"}, {:name=>"Bernardo", :email=>"arquibernardo@gmail.com"},
 {:name=>"Bárbara", :email=>"barbara@semasl.com"}, {:name=>"Joan", :email=>"joanvidto@hotmail.com"},
 {:name=>"Serena", :email=>"seremiau@gmail.com"}, {:name=>"Salva", :email=>"salcut00@gmail.com"},
 {:name=>"elena", :email=>"moreyeta@gmail.com"}, {:name=>"Luis", :email=>"luisnavarro06@gmail.com"},
 {:name=>"Unai", :email=>"unai.panos@gmail.com"}, {:name=>"Fernando", :email=>"fernigd@hotmail.com"},
 {:name=>"Viola", :email=>"viola.bertoni@gmail.com"}, {:name=>"Oscar", :email=>"morenuco1982@hotmail.com"},
 {:name=>"Enrique", :email=>"empenper@gmail.com"}, {:name => 'Carmen', :email => 'carmen_escudero_gomez@hotmail.com'}
].each do |info|
  create_user(cyl, info[:name], info[:email])
end