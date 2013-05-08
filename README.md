eRegister
=========

This project is a case study in the 12/13 Web Architectures module at Sheffield Hallam University. 

It's used to explore the various aspects of developing a web application including 
* Configuration management -  How the development process reacts with git
* Model - View - Controller framworks

Using the Application
=====================

1. Once you have cloned the application to your own directory, a new directory named eRegister should have been created within it. Use this README.md file as a walkthrough of my application.

2. Type 'cd eRegister' into the terminal to change to the correct directory and then use 'grails run-app' and wait for the URL to appear, by following this you will find yourself at the index of my application.  

3. From the index of my application you are able to navigate through the application. You will be faced with both the admin and student pages, the admin pages include the views generated by the commands 'grails generate-all <<domain classes>>' 

4. You can follow each of these links to view or insert some data of your own. 

5. You will notice that there is already some reference data within the application, I did this through the Bootstrap.groovy file, located eRegister/grails-app/conf/Bootstrap.groovy

6. Here you can see that I added some reference data in using the findBy and elvis operator to check if the data is already present, and if not insert it. 

7. A good example would be for you to navigate to the registration sheet page, and insert a new row of data for yourself. For example a sheet 4 or 5.

8. You should have a play around with the data using the scaffold views, you can add, edit or delete some data of your own. Be sure to create yourself a new studentID and record for use in the next step.

9. From the homepage, click the link at the bottom of the page to navigate your way to the apply page.

10. Here you should insert your studentID along with the sheet number you wish to attend. This page creates a new regEntry, to view how this is done you can by finding the file in eRegister/grails-app/controllers/uk/ac/shu/webarch/eregister/ApplyController.groovy for the controller and eRegister/grails-app/views/apply/index.gsp for the view containing the HTML form. 

*NOTE* Be sure to choose a valid studentID and sheet number otherwise no data will be sent to the listActiveClasses page

11. Once you click register you should see the data you entered in the URL. 

12. Click class attendees at below the form to view all the students that have registered for this class

*NOTE* Had I done this again I would have had the page redirect to listActiveClasses rather than back to the index, this would have been easier. 

*NOTE* The listActiveClasses page should have contained the date that they were registered as is the case in the regEntry page. This is a feature I would have included had I done this again.

13. You can use the link to navigate back to the home and start again from here.
