# Assignment_Codimite

* I have used PHP for this project

* End points are addTodo,removeTodo and listTodos

* I did all the code and functions my GCE so this code have been connected with my cloudSQL instance and i'm using Cloud sql as my database

# Requirements

* GCE linux instance

* Google Cloud SQL instance

# Instructions 

* Download and Extract the codimite assignment.zip

* I did all the code and functions my GCE so this code have been connected with my cloudSQL instance 

* First you have to Install apache2 on your machine " sudo apt-get update && sudo apt-get install apache2 "

* Then install php by " sudo apt install php "

* Then move this html folder contents to /var/www/html

* Then Restart apache2 with "sudo systemctl restart apache2"

* Now use " cd /var/www/html " command and go to that directory

* In the /var/www/html execute this command to run the php script
    "php -S localhost:8000 index.php" 

* Then use these curl commands check the api

* To add a new todo item with the task "Clean the house", you can use the following command:
"curl -X POST -d "task=Clean the house" http://localhost:8000/addTodo "

* To delete a todo item with the id of 1, you can use the following command
" curl -X DELETE http://localhost:8000/removeTodo/2 "

* To list all the todo items, you can use the following command:
" curl http://localhost:8000/listTodos "

