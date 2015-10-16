![BuildStatus](https://codeship.com/projects/c5547fa0-46b9-0133-f1b2-3a7a159e2683/status?branch=master)

# Bicycles Benefit Boston

BBB is a Rails app designed to help users fix mechanical problems with there bicycle. When a user submits an issue, the time and location is added to the database and map, which allows other users to either meet up to help fix the bike or email a suggested fix. App relies heavily on Google Maps API and Geocoder gem. User's location is automatically identified and generated on the map when a new issue is submitted.

## Live app hosted on Heroku
[Bicycles Benefit Boston](bicycles-benefit-boston.herokuapp.com)

## ER Diagrams and Schema structure
![ER](http://i.imgur.com/IXOkTU8.png)

## Get Started
1. Bundle the gems

  ```Bundle```

2. Bootup the database:

  ```rake db:create```

3. Bring in your migrations

  ```rake db:migrate```

4. Run the test suite

  ```rake```

## Deployment
On a clean Master branch, run:

  ```
  git push heroku master
  ```
