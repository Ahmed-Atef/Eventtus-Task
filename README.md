# Eventtus-Task

Task:  build a Ruby gem that would collect all local gems in your project and send them to a web server to determine the system libraries you need to install.

This is done by a simple ruby script that reads the Gemfile and send parse it and send its content along with OS info to my localserver (for now) to retrieve system dependencies

Task:  Use one of Ruby or NodeJS frameworks to build a database-driven RESTful API web service that looks up received packages and returns a list of system libraries. 

The framework i chose is Sinatra as i think that Rails is an overkill for a simple web  api and Sinatra is a micro-framework that is convenient for the task (and also i wanted to try Sinatra for so long). And i used Datamapper as my ORM. 
The server reads the gemlist sent by my ruby script and fetch from the database the libraries that matches the gem and OS.

