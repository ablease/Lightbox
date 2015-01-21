#Makers Academy Final Project: Lightbox - A Secure Chat for Doctors

[![Test Coverage](to be added)](to be added)
[![Code Climate](to be added)](to be added)

![docgif](http://www.gifss.com/profesiones/doctores/doctor-05.gif)

Our challenge for the 2 week final project at Makers Academy is to develop
a chat application specifically for use by Doctors.

### The Lightbox Team

- [Ben Conway](https://github.com/Benc93)
- [Simon Lange](https://github.com/langesi)
- [Daniel Obembe](https://github.com/ayoobembe)
- [Alex Blease](https://github.com/ablease)
- [Chris Batts](https://github.com/chrisjbatts)

| Languages | Technologies  | Testing Tools| Misc
| :---------------------------------------------- |:------------|:-----------|:----|
| Javascript|[Sinatra](http://www.sinatrarb.com/)                |  [RSpec](http://rspec.info/)           |            |
| HTML      |[WebSocket](http://en.wikipedia.org/wiki/WebSocket) |             |           |
| CSS       |[Cramp](https://github.com/lifo/cramp)              |             | 
| Ruby      |                                                    |             | 


###The Problem

As a Medical Professional, getting a second opinion for a patient is a lengthy and expensive process. Patient data may only be viewed by medical staff outside of the patient's case under a myriad of rules and regulations. This means that this process is often conducted in prearranged face to face meetings, at great cost in terms of time and inconvenience for the participating doctors.

Traditionally a doctor could meet with another doctor in a private face-to-face environment to discuss one-off patient cases. At this meeting a [Caldicott Guardian](http://systems.hscic.gov.uk/data/ods/searchtools/caldicott/index_html) must be present and various legal documents signed to ensure patient data security.

Of course Doctors already have access to various popular chat applications, such as WhatsApp and Facebook Messenger, but they do not adequately answer questions surrounding patient data security. 

What if Medical Professionals had a dedicated chat application that verifies users as Qualified Medical Professionals and adhered to patient data protection standards in the UK? 

###Version 0 - The Planning Stages

#### Research Resources

Over the weekend,
- [Information commission](https://ico.org.uk/)
- [DGL](http://www.helixhealth.co.uk/products/dgl.181.html)
- [HCPC](http://www.hpc-uk.org/)
- Read up on patient data security
- [Caldicott principals](http://www.tameside.gov.uk/sap/principles)
- Data protection, in what context will it apply for our app?
- Brush up on technology covered so far in the course
- Come up with app name and branding
- Look at other apps for inspiration/features/design/improvments

### Technology
##### Research Options
Below are some technologies we researched for inspiration to this project.

- [chat servers](http://socket.io/get-started/chat/)
- [sinatra chat](https://blog.engineyard.com/2013/getting-started-with-ruby-and-websockets)
- [Cramp](https://github.com/lifo/cramp)

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

