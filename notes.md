  == README B.A.E(Before Anyone Else)

#USER STORIES

#BASIC STORIES
CRUD User Stories

#Create:
[X]# As a prospective user
  I want to create an account
  So I can start using the app

# As an authenticated user
  I want to submit a form with a text
  So I can get an answer as result

# As an authenticated user
  I want to create a new BAE
  So I can have my own BAE

# As an authenticated user
  I want to add keywords/responses to my BAE
  So I can have my personalize BAE

#Read:

# As an authenticated user
  I want to see all the keywords/responses of my BAE
  So I can manage them.

[X]# As an authenticated user
  I want to see my  profile
  So I can see my profile details.


#Update:

# As an authenticated user
  I want to update keywords/responses to my BAE
  So I can have my personalize BAE

[X]# As an authenticated user
  I want to update my information
  So that I can keep my profile up to date

#Delete:

# As an authenticated user
  I want to delete keywords/responses to my BAE
  So I can have my personalize BA

[X]# As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app

# As the admin
  I want to delete user accounts
  so I can have only users that behave.


#Others:

# As an authenticated user
  I want to sign in/out/up
  so I can have and use my account

# As the app
  I want to find a keyword inside the user's text
  so I can give an answer related


->DREAM STORIES

# Admin
As the admin
I want to delete profiles
so I can manage who uses the app


# As an authenticated user
  I want to see another users profile
  So I can see the profile details.

# As an authenticated user
  I want to see my friendlist
  So I can see who is my friend

# As an authenticated user
  I want to delete users from my friendlist
  So I can follow only the users I want.

# As an authenticated user
  I want to add a user to my friendlist
  So I can manage friend list

# As an authenticated user
  I want to be able to use the app from my phone using imessages
  so I can use the app from my phone

# As an authenticated user
  I want to enter in a chatroom
  so I can chat with the app from my laptop

# As an authenticated user
  I want to send a private message to another user
  so I can chat chat with another user.

# As an authenticated user
  I want to see another users that are close to where I am
  so I can meet them.

# As the app
  I want to analyse a combination of keywords
  so I can give the perfect answer

# As the app
  I want to know whats the main topic of the user's message
  so I can give the perfect answer

# As the app
  I want to know if the user's message is positive, neutral or negative
  so I can give the perfect answer


#SCHEMA

+----------------------------+                                    +-------------------------+  
| USERS                      |                                    |FRIENDS_LIST             |  
+----------------------------+                                    +-------------------------+  
|                            |                                    |user_id1   |user_id2     |  
| +username                  |                                    |           |             |  
|                            |                                    |           |             |  
| +email                     |                                    |           |             |  
|                            |                                    |           |             |  
| +password                  |     +----------------------+       |           |             |  
|                            |     |BOTS                  |       |           |             |  
| +phone_number              |     +----------------------+       |           |             |  
|                            +---> |                      |       |           |             |  
| +age                       |     ++User_id              |       |           |             |  
|                            |     |                      |       |           |             |  
| +description               |     ++Name                 |       |           |             |  
+----------------------------+     |                      |       |           |             |  
                                   ++Age                  |       +-----------+-------------+  
                                   |                      |                                    
                                   ++Eye_color            |                                    
                                   |                      |                                    
                                   ++Hair_color           |                                    
                                   |                      |              +--------------------+
                                   |                      |              | BOTS_INTERACTION   |
                                   |                      +---------->   +--------------------+
                                   +----------------------+              |                    |
                                                                         | -Interaction_id    |
                                                                         |                    |
                                                                         | -Bot_id            |
                                                                         |                    |
                                                                         |                    |
                                 +--------------------------+            |                    |
                                  |INTERACTION              |            |                    |
                                  +-------------------------+            |                    |
                                  |                         |            |                    |
                                  +-Keyword                 |            |                    |
                                  |                         |            |                    |
                                  +-Response, priority      +--------->  |                    |
                                  |                         |            |                    |
                                  |                         |            +--------------------+
                                  |                         |                                  
                                  |                         |                                  
                                  |                         |                                  
                                  |                         |                                  
                                  |                         |                                  
                                  |                         |                                  
                                  |                         |                                  
                                  +-------------------------+                                  

#Steps
X 1- Create app
X 2- Create user authentication
X 3-Create users migration, model and test
X 4-Create routes, and user profile page. test
5-Create Bots model, migration,controller, routes and test
6-Create keywords migration, responses migration, and join table
