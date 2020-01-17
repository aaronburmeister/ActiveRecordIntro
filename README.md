# ActiveRecordIntro
# Instructions for Active Record
## Command Line  
1. Run  
`bundle init`  
2. generate a Gemfile  
`bundle add <gem1> <gem2>`  
in this case we used `sinatra-activerecord activerecord rake sqlite3 require_all`  
This generates the Gemfile.lock file. Should be all set on gems (maybe include pry?)  
3. `mkdir config lib`  
this will make 2 new folders  
4. `mkdir lib/models`  
A model is the object that relates to the database. i.e. classes. Above is convention.  
5. `touch config/environment.rb`  
This can also be 'app.rb', where everything comes together.  
6. `touch Rakefile`  
Rakefile will contain automated tasks for us  
7. (Optional) Now create your model files  
`touch lib/models/<model-name>.rb`  
## Text Editor  
8. Establish the connection in config/environment.rb using the following code:  
`require "bundler/setup"
Bundler.require()

require_all "lib"

ActiveRecord::Base.establish_connection({
    adapter: "sqlite3",
    database: "flatiron.db"
})`  
environment is now done.  
9. Go to Rakefile  
`require_relative "config/environment"
require "sinatra/activerecord/rake"`  
If you run `rake -T` in the Command Line, it will show you the rake tasks.  
## Command Line  
10. Migrations  
`rake db:create_migration NAME==<name_of_table>`  
This creates a folder 'db' and a subfolder 'migrate', and the migration inside of it.  
## Migration File you just created  
11. In the change method, create a table:  
`create_table(:table_name) { |t|
    t.string :name
    t.integer :age
    t.boolean :current_student
}`  
This is simply describing the column names and types for SQL.  
## Command Line  
`rake db:migrate`  
Supposed to work. Instead we need to use yaml file.  The establish connection method doesn't work in v6.0 of activerecord.  
`development:
    adapter: "sqlite3"
    database: "database_name.db"`  
This .yml file is to be created in the config folder and does the same thing as the establish connection method.   
## Text Editor  
In student.rb add:  
`class Student < ActiveRecord::Base
end`  
