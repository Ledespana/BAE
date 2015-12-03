# B.A.E (Before All Else)
[ ![Codeship Status for ledes/BAE](https://codeship.com/projects/66a1d520-42b3-0133-a1f9-1eb5f82d52fc/status?branch=master)](https://codeship.com/projects/103829)
[![Code Climate](https://codeclimate.com/github/ledes/BAE/badges/gpa.svg)](https://codeclimate.com/github/ledes/BAE)
[![Coverage Status](https://coveralls.io/repos/ledes/BAE/badge.svg?branch=master&service=github)](https://coveralls.io/github/ledes/BAE?branch=master)


### Ruby version

*2.2.3*

#### Technical Specifications

  - Ruby on Rails
  - Ruby
  - PostgreSQL
  - Javascript/JQuery
  - HTML
  - SASS
  - Twilio API
  - Indico API

###  Description

BAE is a platform where users can create a personalized bot(bae) that maintains a conversation with the user over the phone. By implementing an algorithm and database, the bot interprets the user’s texts and responds with the perfect answer for the user and his state of happiness.

Built using modern software development techniques such as TDD and "Fat model, skinny controller".

[Click Here To View Storyboard](https://trello.com/b/nSJUDmf7/bae)

[Click Here To View Heroku Application](https://protected-sands-5404.herokuapp.com/)

![gif1](http://cdn.makeagif.com/media/12-03-2015/sqHSBS.gif)
![gif2](http://cdn.makeagif.com/media/12-03-2015/kPQHYW.gif)
![gif3](http://cdn.makeagif.com/media/12-03-2015/9fJn5-.gif)

### Presentation

[![Presentation](http://i.imgur.com/6JMggH9.png)](https://vimeo.com/143484288)

###  ER Diagram

![ER Diagram](http://i.imgur.com/Jk84Cfd.png)

### Features

* User is able to create a bae with different attributes.

* Bae's avatar will be different depending on its attributes.

* User has a vocabulary page with all the interactions

* User can add interactions to his own vocabulary

* User can edit/ delete interactions from his own vocabulary

* Each interaction can be a sentence, a keyword or a combination of keywords. Custom validation for submitting at least one of them

* User can see a list of other users and their vocabularies

* User can add interactions from another user's vocabulary to his own vocabulary.

* User can see add/remove any of his interactions to his bae

* User can see his bae's interactions (bae's vocabulary page)

* When a user creates a bae, the new bae will send a welcome message to the user's phone to start the conversation

* When a user replies to a message, his bae will analyze the user's state of happiness and the content of the message to return a different response

* The user's message will get a score from 0 to 1 depending on the state of happiness.
  If it's less than 0.25, the message will be considered with a "Negative" sentiment.
  If it's between 0.25 and 0.65, the message will be considered with a "Neutral" sentiment.
  If it's grader than 0.65, the message will be considered with a "Positive" sentiment.

* When a bae gets a response and analyzes the sentiment, it will look through the user's message for a whole sentence, a keyword, or a combination of keywords in the database in order to give the response attached to that specific interaction found with the same sentiment.

### Dream list of features

This is a list of features that I would like to implement in the future.

* Create IOS app with RubyMotion

* The ability to create more than one bae.

* Improve algorithm for text messages with several keywords included.
  Add feature to prioritize different keywords

* A user can follow other users

* User can talk to his bae and other baes from the website (so any user can try baes from other users)

* Modify algorithm to make a bae self learner

* Implement worker to improve responses speed

* Create bilingual website

* User is able to add interactions from Imessage

* Seed each BAE with a default vocabulary

* User can install packages of vocabularies. For example: romantic, funny, or optimistic


###  Challenges Faced

Among all the challenges faced while I was building this application,
implementing the Twilio API for fast responses was the most challenging.

While creating the algorithm that delivers responses to the users, I found an inconsistency in the response. I realize that I had to improve my code to make it faster.

It was difficult to find the cause of the problem due to the lack of possible tests in the local environment. At the very begining, the only way to check if the Twilio API for creating responses was working was to push to Heroku for every change in the algorithm. This was due to the twilio API.
Trying to find a way to do it from localhost, I found [ngrok](https://ngrok.com/). Ngrok allowed me to expose a web server running on my local machine to the internet.

Even though this was working, it was better to use Heroku due to the specific information
that I was getting from the command *heroku logs --tail*

After improving the algorithm and adding an index to the schema in order to improve the speed for finding the right response, I found that my problem of inconsistency was solved and I had created a more efficient app.

Also I added a function to reset the conversation so it continues the conversation in case a bae takes a long time to reply. This function is displayed by
a "Reset" button in the bae show page, or by sending the text message "answer me".

Due to the nature of the app, the bigger the database, the more realistic the app can be. It would be worthwhile to implement, in the future, a *worker* and a *binary/binary recursive search algorithm* to increase the speed of the app.
