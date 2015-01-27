#Makers Academy Final Project: Lightbox
##A Secure Chat App for Doctors

[![Code Climate](https://codeclimate.com/github/ablease/Lightbox/badges/gpa.svg)](https://codeclimate.com/github/ablease/Lightbox)
[![Test Coverage](https://codeclimate.com/github/ablease/Lightbox/badges/coverage.svg)](https://codeclimate.com/github/ablease/Lightbox)

<p align="center"> <img src="http://www.gifss.com/profesiones/doctores/doctor-05.gif" /> </p>

Our challenge for the 2 week final project at Makers Academy is to develop a chat application specifically for use by Doctors.
   
Technologies are not specified within the brief - they must be decided upon by the teams based on the merits of each technology for the project they have been given.
   
Projects should adhere to an [Agile methodology](http://agilemethodology.org/) and be developed in a [test driven](http://agiledata.org/essays/tdd.html) manner wherever possible.
      
### The Lightbox Team

- [Ben Conway](https://github.com/Benc93)
- [Simon Lange](https://github.com/langesi)
- [Daniel Obembe](https://github.com/ayoobembe)
- [Alex Blease](https://github.com/ablease)
- [Chris Batts](https://github.com/chrisjbatts)

### Technologies Used
   
| Languages | Technologies  | Testing Tools| Misc
| :---------------------------------------------- |:------------|:-----------|:----|
| Javascript|[Sinatra](http://www.sinatrarb.com/)                |[RSpec](http://rspec.info/)    |Project Homepage: [Agile Ventures](http://agileventures.org/projects/secondappinion)      |
| HTML      |[WebSocket](http://en.wikipedia.org/wiki/WebSocket) |[Cucumber](http://cukes.info/) |Project Management: [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1253704)      |
| CSS       |[Cramp](https://github.com/lifo/cramp)              |            | GUI Sketches: [Balsamiq](https://makerslightbox.mybalsamiq.com/projects/lightbox/lightbox%20app) |
| Ruby      |                                                    |             | 
    
   
###The Problem
    
As a Medical Professional, getting a second opinion for a patient can be a lengthy and expensive process. Patient data may only be viewed by medical staff outside of the patient's case under a myriad of rules and regulations. This means that this process is often conducted in prearranged face to face meetings, at great cost in terms of time and inconvenience for the participating doctors.
   
Traditionally a doctor could meet with another doctor in a private face-to-face environment to discuss one-off patient cases. At this meeting a [Caldicott Guardian](http://systems.hscic.gov.uk/data/ods/searchtools/caldicott/index_html) must be present and various legal documents signed to ensure patient data security.
   
Of course Doctors already have access to various popular chat applications, such as WhatsApp and Facebook Messenger, but they do not adequately answer questions surrounding patient data security. 
   
What if Medical Professionals had a dedicated chat application that verifies users as Qualified Medical Professionals and adhered to patient data protection standards in the UK? 
   
###Version 0 - Planning Stages
     
With our Client's problem now defined - the next step was to structure a solution. Vital features that meet the minimum criteria for a basic solution are priorised forward during the planning stage. "Nice to have" features are planned into later versions of the application (in the manner shown below).  
    
![MVP](https://fastmonkeys.files.wordpress.com/2014/06/howtobuildmvp.gif?w=500)
    
This forms a solid framework on which the rest of the project can be built against. Each planned version and its features is summarised below, and shown on our [live project management board](https://www.pivotaltracker.com/n/projects/1253704):
      
____________________________________________________________________________________________________________________________
#####Version 1: Skateboard

+ [**Feature 1**](https://www.pivotaltracker.com/story/show/86688272): A User can 'Sign Up' with an email address and a General Medical Council (GMC) number. 
+ [**Feature 2**](https://www.pivotaltracker.com/story/show/86688958): A User can 'Login' to a single chat room and exchange messsages with other users.
+ [**Feature 3**](https://www.pivotaltracker.com/story/show/86689228): A User is presented with a *basic* mobile web app format - as sketched. [here](https://makerslightbox.mybalsamiq.com/projects/lightbox/lightbox%20app).
    
#####Version 2: Scooter
    
+ Feature 4: A User's GMC number is validated at the GMC website when they 'Sign Up'.
+ Feature 5: A User can create and/or join numerous chat rooms.
    
#####Version 3: Bike
    
+ Feature 6: A User's messages are protected using end-to-end encryption. 
+ Feature 7: A User is presented with a more aesthetic mobile web format, plus a basic desktop view. 

___________________________________________________________________
    
##### Experimenting with frameworks
    
Before we decided on a stack of technology to use to build this project we spiked a few options, namely [Socket.io](http://socket.io/), [Node.js](http://nodejs.org/) & [Express.js](http://expressjs.com/).
    
It was quick and relativly straight forward to setup a basic chat server using Socket.io, but implentation beyond the most simple and most basic features seemed to promise slow progress and a lack of flexibility for what we needed on the security features for our App.
    
Having used Sinatra extensively for previous projects, the framework felt easy to implement with more flexibility, and with our current skill set, easily expandible into later stage features. 
    
###Execution of the Project
    
####Version 1 
    
[**Feature 1**](https://www.pivotaltracker.com/story/show/86688272) - Building out our testing files (Feature, Acceptance & Integration tests). Building out our Views for Sign Up, Login and a Homepage. Creating routes between the View and the back end of the App. Initialise the database, and build a User Model to handle parameters send from the Front End. 
    
[**Feature 2**](https://www.pivotaltracker.com/story/show/86688958) - Building a new Feature test, and subsequent Acceptance and Integration tests. New View created for Chat Rooms & Websockets logic implemented. 
    
[**Feature 3**](https://www.pivotaltracker.com/story/show/86689228) - Basic HTML format and accompanying stylesheet. 