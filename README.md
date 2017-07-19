# Eventtus-Task

Task:  build a Ruby gem that would collect all local gems in your project and send them to a web server to determine the system libraries you need to install.

This is done by a simple ruby script that reads the Gemfile and send parse it and send its content along with OS info to my localserver (for now) to retrieve system dependencies

Task:  Use one of Ruby or NodeJS frameworks to build a database-driven RESTful API web service that looks up received packages and returns a list of system libraries. 

The framework i chose is Sinatra as i think that Rails is an overkill for a simple web  api and Sinatra is a micro-framework that is convenient for the task (and also i wanted to try Sinatra for so long). And i used Datamapper as my ORM. 
The server reads the gemlist sent by my ruby script and fetch from the database the libraries that matches the gem and OS.


HOW TO USE:

The Gem is already published in rubygems by the name "libdepend"  do a simple 
gem install libdepend 

to use the gem i have made it into an executable so you can type 
libdepend

libdepend -h shows help
libdepend fetch   asks for the gem file location and send it to the (still local server so far) to show the system dependecies required

----------------------------------------------------------------------------------------
Running server : Sinatra is listening on port 4567 so just run ruby -Ilib server.rb in order to run the server and it will listen to the request coming from the gem libdepend fetch



Things to be done : 

1-I am aware that the optimal model representation would be a many to many relation between the gems and the libraries to avoid duplicate libraries in the database , which is done by making a third table combining the keys of the 2 

2-Deploying the Sinatra Web api 

3- Running brew/apt-get install on returned list of dependencies 


