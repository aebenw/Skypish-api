
#WELCOME TO SKYPISH

This is a video chat and messaging application.

To test the app you can login with the two users listed below in two tabs or on two separate computers. You can also make your own account, if you'd like.


  eben@eben.com
  juan@juan.com
  pass: test


*The bulk of the app was built in a 4 day code sprint. It also needs a little cosmetic work*

Auth was implemented but its commented out in the App.js file. When testing on a single computer, it makes it little cumbersome to log into two profiles.



Tech Specks


  React for Front End and Rails for backend
  PostgreSQL for DB
  Communicates messages and video information using WebRTC through ActionCable which uses Websockets and Redis.
