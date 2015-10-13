class User
 def self.execute(command)
   `psql -d fred_test -c "#{command}"`
 end

 def self.create_table
   execute "CREATE TABLE users (id serial PRIMARY KEY,   fname varchar(50),   dateCreated timestamp DEFAULT current_timestamp )"
 end

 def self.create(name)
   execute "insert into users (fname) VALUES ('#{name}');"
 end

 # (.find takes ID argument and finds the User with that ID)
 def self.find(id)
   results = `psql -d fred_test -c "SELECT * FROM users WHERE id=#{id}"`
   sql_results_parser results 
 end

 def self.last(id)
   execute "insert into users (lname) WHERE id=#{id}"
 end

 # (.where takes a Hash argument of user attributes and finds users with those attributes..)
 def self.where(conditions)
    #{name: "Sam", id :3}

   criteria = conditions.map do |key, val|
     if val.to_i == 0
       "#{key}='#{val}'"
     else
       "#{key}=#{val}"
     end
   end

   criteria = criteria.join(' OR ')

   results = `psql -d fred_test -c "SELECT * FROM users WHERE #{criteria}"`
   "SELECT * FROM users WHERE name='Sam' AND id = 3"
   
   sql_results_parser results 
 end

 # (.all returns all users in the db as objects inside of an array)
 def self.all
   results = `psql -d fred_test -c "SELECT * FROM users"`
   sql_results_parser results
 end


 def self.sql_results_parser(results)
   lines = results.split("\n")
   
   keys  = lines.first.split("|").map &:strip
   
   last_index = lines.length - 2
   
   value_lines = lines[2..last_index]

   value_lines.map do |line|
     values = line.split("|").map &:strip

     result = {}
     values.each_with_index do |value, i|
       key = keys[i]
       result[key] = value
     end

     result
   end
 end


 def self.destroy_all
 results = `psql -d fred_test -c "DELETE FROM users"`
 end
 
end


# User.create_table
# values = {"fname": "bon"}
User.create("Bob")
# puts User.find(1).inspect
# puts User.find(3).inspect

# User.destroy_all
puts User.all.inspect