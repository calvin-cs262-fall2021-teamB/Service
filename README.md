# KnightDash Webservice

This is the data service application for the 
[CS 262 KnightDash project](https://github.com/calvin-cs262-fall2021-teamB/Project),
 which was originally deployed here:
          
- <https://still-crag-08186.herokuapp.com/>

It has now been migrated to run in the following location due to Heroku eliminating its free tier of services, including the free dynos used in building / deploying the service.

- https://knightdash-webservice.onrender.com

It was based on the standard Heroku with Node.js tutorial.

- <https://devcenter.heroku.com/articles/getting-started-with-nodejs>  

The database is relational with the schema specified in the `sql/` sub-directory
and is hosted on [ElephantSQL](https://www.elephantsql.com/). The database server,
user and password are stored as Heroku configuration variables rather than in this 
(public) repo.

This service is set up to auto-deploy upon pushes to the main Github branch.
