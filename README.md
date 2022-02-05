# ParkingApp

Simple app made for recruitment process. This app enables users to book parking places. To do so one has to sign in with Slack or use command directly on Slack workspace.

### Slash commands implemented

* **/parking_book** [place] = booking a place (a user may book only one place at a time)
* **/release_place** [place] = to release a place previously booked
* **/place_status** [place] = to check whether the place is free or taken


Incoming Slack requests are verified based on the X-Slack-Signature header.