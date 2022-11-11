# Welcome to Countries Explore App!

Hi! My name is David Orakpo. I am a Junior Software Engineer and current intern of HNG 9 2022 in the mobile dev track.  This project is for said track, stage 3. The app is a fairly simple one, consisting of 2 screens:
- Landing Page
- Details Page
 
The app supports features such as Dark Mode (auto and manual switching), responsiveness to phone Orientation as well filtering of the list and translations. The minimum sdk level for this app is Android 12 (API 31) as well.

# Description of Code Base
The Code base applies the MVVM design architecture.
The lib folder is divided into two halves:
- Core
- Presentation
In Core, you find folders that handle back end specific functionalities such as Services, State Management, Utilities, Extensions and so on. 
In Presentation, you find folders that correspond to the UI/Page design of the app, as well as widget components.
 
# Design
The  esign of the app was provided to us. However, fonts were sorted out for individually to try and match the given appearance of
the design.


# Libraries Used
I made use of a few libraries to accomplish this project. Their names along with reasons why used are listed below:
- Shared Preferences: I made use of this library to store the current theme of the app when the app is closed down
- Provider: I used provider as my general state management tool. Mostly used for the management of the Theme as well
- Google Fonts: I used the font Rubik for all Texts. I got access to it through this package
- Dio: I made use of Dio package to handle my API requests. I chose this instead of http, due to the Interceptors functionality present in Dio.
- Font Awesome: Font Awesome provided the icons of various social media platforms referenced in the app
- Grouped List: This package is responsible for arraaging the list view into groups. 
- smooth_page_indicator: This package was used to provide visual confirmation of scrolling from one page to the other in the details page
- intl: This package helped in translations
- Connectivity_plus: This package helped in controlling the connection state of the app
- Internet Connection Checker: This app helped to monitor the internet state of the app


# Wish List of Features
If I had more time, I would have loved to fully implement the filtering functionality. I was only able to get filtering down to Regions. I attempted a go at TimeZones but ran into alot of errors and not enough time to hash them out. Nonetheless, alot was learned during this task


# Challenges Faced
My major challenge faced, was parsing the JSON data. The response was quite complex to say the least. Auto JSON to Dart converters onllnie never truly generated an error free class. I had to do alot of debugging and work on Post Man to figure out what was going on.
However, I now have a better understanding on how toJson and fromJson functions work.


# Links and Files

The link to the apk can be foud [here](https://drive.google.com/drive/folders/1ACY3szOVTaz0POK1I3Xce5mysf7UrEcO?usp=sharing), while the appetize link can be foud [here](https://appetize.io/app/x5disfqsllokug2rv4t2romumu?device=pixel6&osVersion=12.0&scale=75)



