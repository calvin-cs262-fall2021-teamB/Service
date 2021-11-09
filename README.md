# KnightDash Webservice

This is the data service application for the 
[CS 262 KnightDash project](https://github.com/calvin-cs262-fall2021-teamB/Project),
 which is deployed here:
          
- <https://still-crag-08186.herokuapp.com/>

It is based on the standard Heroku with Node.js tutorial.

- <https://devcenter.heroku.com/articles/getting-started-with-nodejs>  

The database is relational with the schema specified in the `sql/` sub-directory
and is hosted on [ElephantSQL](https://www.elephantsql.com/). The database server,
user and password are stored as Heroku configuration variables rather than in this 
(public) repo.

This service is set up to auto-deploy upon pushes to the main Github branch.