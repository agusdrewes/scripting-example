echo "📌⚙️  Starting git repository clone"
sleep 5

# Clones the project from GitHub
git clone https://github.com/agusdrewes/scripting-example.git

# Navigates to the project directory
cd scripting-example

echo "📌⚙️  Starting the db docker image build"
sleep 5
# This script builds a Docker image for a PostgreSQL database
docker build -t postgres-users-db .

echo "📌⚙️  Starting the db docker container"
sleep 5
# Runs the image in a container
docker run -d --name postgres-users-db -p 5432:5432 postgres-users-db

read -p "🚧  Show the newly created container and DB. Press enter to continue!"

echo "📌⚙️  Installing project dependencies"
sleep 5
# Installs dependencies
npm install

# Builds the typescript application
npm run build

echo "📌⚙️  Creating tables and populating DB"
sleep 5
# Runs the migrations
npm run db:migrate

read -p "🚧  Show the newly created table. Press enter to continue!"

echo "📌⚙️  Starting the nodejs app"
# Runs the application
nohup npm run start &
app_pid=$!
sleep 5

# Wait for user input before exiting
read -p "🧪🧐  Press enter to start the test"

echo "🧪🧐  Starting tests"
sleep 5

echo "🧪🧐  Fetching user with id 1 from API"
# Calls the endpoint http://localhost:3000/api/users/1
response=$(curl -s -X GET http://localhost:3000/api/users/1)
printf "User found in API: \n$response"
sleep 5

echo "🧪🧐  Fetching user with id 1 from DB"
# Fetches the user data from the database
export PGPASSWORD="test_password"
user=$(docker exec postgres-users-db psql -U test_user -d postgres -t -c "SELECT row_to_json(users) FROM users WHERE id = 1;" | tr -d '[:space:]')

# Checks if the user exists
if [[ $response == *"User not found"* ]]; then
  echo "User not found"
else
# Prints the response and user data
  printf "User found in DB: \n$user"
fi
sleep 5


echo "🧪🧐  Checking equality between the DB and API response"
# Compares the response and user JSONs
if [[ "$response" == "$user" ]]; then
    echo "Response and user JSONs are equal"
else
    echo "‼️❌  Error: Response and user JSONs are not equal!"
fi
sleep 5

read -p "Press enter to start cleanup"
echo "♻️🚮  Cleaning up"

echo "♻️🚮  Stopping the nodejs app"
ps aux | grep node | grep -v grep | awk '{print $1}' | xargs kill -9
sleep 5

echo "♻️🚮  Stopping and removing the DB container"
# Stops and removes the container
docker stop postgres-users-db
docker rm postgres-users-db
# Removes the image
docker rmi postgres-users-db
sleep 5

echo "♻️🚮  Removing the GIT project directory"
# Removes the project directory
cd ..
rm -rf scripting-example
sleep 5

# Prints a test successful message
echo "Script finished"

# Wait for user input before exiting
read -p "Press enter to exit"
# End of script