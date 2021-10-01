# No Faces - A no face dating app.

### Introduction
---

We have all wanted to meet people with same interests (music, movies, etc.) and
hobbies as ours; to discuss, collaborate or simply have fun talking about them.
Of course, there are interest group/fan clubs on sites like Facebook and reddit, but
they are restricted to a single movie or an artist. What if you wanted to find an
identical twin of yours, someone who thinks like you, who shares similar likes as you
or have the same views as you. It could be a start of a great friendship or a birth of
new ideas.


This is where NoFaces comes in. NoFaces is an app where one can filter out people
based on their likes, dislikes, interests, political inclination, etc. , so that like-minded
people can come together, share their thoughts and discuss ideas. 

The main distinguishing feature of the app is that all of this is done behind a veil of
anonymity, profile pictures are not included, instead a randomly generated avatar will
be assigned, Hence the name, NoFaces. If the users prefer, they can share it later, in
private. With this users will focus more on interests rather than physical appearances.

Download and install the app on your device to try it out for yourself: 
[No Faces APK](https://drive.google.com/drive/folders/1g_wLm8hLHVKxA1YaPVRn1jNNa1z0FAWJ?usp=sharing)

### UI Screenshots

<p align="center">	
<table>
	
  <tr>
	  <td><b>Login Screen</b></td>
	  <td><b>Home Screen</b></td>
	  <td><b>Add Details Screen</b></td>
  </tr>
  <tr>
    <td><img src="https://github.com/TheGreatFellow/NoFaces/blob/main/Screens/LoginScreen.jpg" width=320 height=570></td>
    <td><img src="https://github.com/TheGreatFellow/NoFaces/blob/main/Screens/mainScreen.jpg" width=320 height=570></td>
    <td><img src="https://github.com/TheGreatFellow/NoFaces/blob/main/Screens/DetailScreen.jpg" width=320 height=570></td>
  </tr>
		
  <tr>
	  <td><b>Favorite Screen</b></td>
	  <td><b>Messages Screen</b></td>
	  <td><b>Chat Screen</b></td>
  </tr>
  
	
  <tr>
    <td><img src="https://github.com/TheGreatFellow/NoFaces/blob/main/Screens/FavoriteScreen.jpg" width=320 height=570></td>
    <td><img src="https://github.com/TheGreatFellow/NoFaces/blob/main/Screens/MessagesScreen.jpg" width=320 height=570></td>
    <td><img src="https://github.com/TheGreatFellow/NoFaces/blob/main/Screens/ChatScreen.jpg" width=320 height=570></td>
  </tr>	
		
  <tr>
	  <td><b>Preferences Screen</b></td>
	  <td><b>Settings Screen</b></td>
	  <td><b>Ride Confirmed</b></td>
  </tr>
  <tr>
    <td><img src="https://github.com/TheGreatFellow/NoFaces/blob/main/Screens/tags.jpg" width=320 height=570></td>	
    <td><img src="https://github.com/TheGreatFellow/NoFaces/blob/main/Screens/SettingScreen.jpg" width=320 height=570></td>

    
  </tr>	
 </table>	
</p>


### Abstract
---

NoFaces is a cross platform mobile app built using Flutter. The user information,
interests and other data will be stored on a PostgreSQL database, which is hosted on
Heroku. Firebase helps with google sign in and authentication. For real-time chatting,
Firestore will be used.


NoFaces consists of 10 screens:
- Login Screen       – Authentication
- On Boarding Screen – Get user details and interests
- Interests Screen   – Add Interests
- Bio Screen         – Add Bio
- Preferences Screen – Set Preference and Age range
- Discover screen    – Discover new users
- Likes Screen       – List of profiles which liked the user
- Favorites Screen   – List of Friends and chats
- Profile Screen     – Display/edit user details
- Chat Screen        – All the chatting is done here

### Tools Used
---

Flutter: UI toolkit for cross platform app development 

PostgreSQL: Primary database

Firebase: Authentication and real-time database
