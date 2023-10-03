<h1>Project</h1>

<a href=https://www.tripeasy.world> TripEasy </a>

<h1>Install</h1>

<p>Clone the repository</p>

git clone git@github.com:juliendargelos/project.git
cd project
Check your Ruby version

ruby -v
The ouput should start with something like ruby 2.5.1

<p>If not, install the right ruby version using rbenv (it could take a while):</p>

rbenv install 2.5.1
Install dependencies

<p>Using Bundler and Yarn:</p>

bundle && yarn
Set environment variables

<p>Initialize the database</p>

rails db:create db:migrate db:seed
Add heroku remotes

<p>Using Heroku CLI:</p>

heroku git:remote -a project
heroku git:remote --remote heroku-staging -a project-staging

<h3>Serve</h3

rails s

<p>You can now access to your localhost : <a href=localhost:3000> localhost:3000 </a></p>


Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
