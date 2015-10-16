# B.A.E (Before All Else)
[ ![Codeship Status for ledes/BAE](https://codeship.com/projects/66a1d520-42b3-0133-a1f9-1eb5f82d52fc/status?branch=master)](https://codeship.com/projects/103829)
[![Code Climate](https://codeclimate.com/github/ledes/BAE/badges/gpa.svg)](https://codeclimate.com/github/ledes/BAE)
[![Coverage Status](https://coveralls.io/repos/ledes/BAE/badge.svg?branch=master&service=github)](https://coveralls.io/github/ledes/BAE?branch=master)

### Ruby version

*2.2.3*

###  Description

BAE is a platform for users to create a personalized bot(bae) that maintains a conversation with the user over the phone. By implementing an algorithm and database, the bot interprets the user’s texts and responds with the perfect answer for the user and his state of happiness.

Built using modern software development techniques such as TDD and "Fat model, skinny controller". Languages used were Ruby, JavaScript and SQL. Software and tools were Ruby on Rails, TDD, Github, Twilio, Indico, and PostgreSQL.

[Click Here To View Storyboard](https://trello.com/b/nSJUDmf7/bae)

[Click Here To View Heroku Application](https://protected-sands-5404.herokuapp.com/)

###  ER Diagram

[Imgur](http://i.imgur.com/Jk84Cfd.png)

### Features

* User is able to create a bae with different attributes.

* Bae's avatar will be different depending of its attributes.

* User has a vocabulary page with all the interactions

* User can add interactions to his vocabulary

* User can edit/ delete interaction from his vocabulary

* Each interaction can be a sentence, a keyword or a combination of keywords. Custom validation for submitting at least one of them

* User can see a list of other users and their vocabularies

* User can add interactions from other vocabulary to his own vocabulary.

* User can see add//remove any of his interactions to his bae

* User can see his bae's interactions (bae's vocabulary page)

* When a user creates a bae, the new bae will send a welcome message to the user phone to start the conversation

* When a user replies a message, his bae will analyze the user state of happiness and the content of the message and depending on that it will return a different response

* The user message will get an score from 0 to 1 depending of the state of happiness.
  If its less than 0.25 the message will be considered with a "Negative" sentiment.
  If it between 0.25 and 0.65 the message will be considered with a "Neutral" sentiment.
  If it grader than 0.65 the message will be considered with a "Positive" sentiment.

* When a bae gets a response and analyse the sentiment, it will look through the user's message for a whole sentence, a keyword or a combination of keywords in the database in order to give the response attached to that specific interaction found with the same sentiment.

### Dream list of features

This is a list of features that I would like to implement in the future.

* Create IOS app with RubyMotion

* User can create more than one bae

* A user can follow other users

* User can talk to his BAE and other BAEs from the website. So any user can try BAEs from other users

* Modify algorithm to make a BAE self learner

* Implement worker to improve responses speed

* Create bilingual website

* User is able to add interactions from Imessage

* Seed each BAE with a default vocabulary

* User can install packages of vocabularies. For example: romantic, funny or optimist.


###  Challenges Faced
