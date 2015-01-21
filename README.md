#Makers Academy Final Project: Lightbox
##A Secure Chat App for Doctors

[![Test Coverage](to be added)](to be added)
[![Code Climate](to be added)](to be added)

<p align="center"> <img src="http://www.gifss.com/profesiones/doctores/doctor-05.gif" /> </p>

Our challenge for the 2 week final project at Makers Academy is to develop a chat application specifically for use by Doctors.
   
Technologies are not specified within the brief - they must be decided upon by the teams based on the merits of each technology for the project they have been given.
   
Projects should adhere to an Agile methodology and be developed in a [test driven](http://agiledata.org/essays/tdd.html) manner wherever possible.
      
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
    
This forms a solid framework on which the rest of the project can be built against. Each planned version and its features is summarised below:
      
___________________________________________________________________
#####Version 1: Skateboard

+ Feature 1: Users must authenticate themselves vs GMC data to be able to log in
+ Feature 2:  
+ Feature 3: 

#####Version 2: Scooter

+ Feature 4:    
+ Feature 5: 

#####Version 3: Bike

+ Feature 6:  
+ Feature 7: 
    
______________________________________________________________________________________
     
##### Experimenting

Before we decided on a stack of technology to use to build this project, we experimented with a few options
- Socket.io and Node.js + Express.js
It was quick and relativly simple to setup a basic chat server using Socket.io.

- Cramp and sinatra
Having used sinatra extensively for previous projects, these technologies felt familiar
and easy to use, and with our current skill set easily expandible into other features. 

### User Story Discussion

We held a discussion to describe the type of stakeholders in our app and came to the
following conclusions
- Doctor who needs a second opinion
- Doctor who wants to give a second opinion
- Patient
- System Administrator

We then describe use cases of each stakeholder and outlined our workflow using pivitol tracker

