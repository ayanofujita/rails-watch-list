# 📚 Movie Watchlist

A web application built in approximately two days during my Le Wagon bootcamp. It allows users to create movie lists, add and remove movies from lists, and leave reviews.

This project helped solidify my understanding of multiple model relationships and RESTful routing, reinforcing how to structure associations between models and properly design routes for resourceful actions.

During development, I had many ideas for additional features, such as authentication and a more flexible movie selection process. Currently, users can only add movies that already exist in the database, but I want to enable searching and adding any movie. I also wanted to improve responsiveness for a better user experience.

With that in mind, I'm working on Version 2, where I aim to address these limitations and expand the feature set. You can check out the progress here: [Watchlist v2](https://old-aya-watchlist-20fde36147bd.herokuapp.com/)

![screenshot of homepage]

App home: https://old-aya-watchlist-20fde36147bd.herokuapp.com/
<br>
v2: https://watch-list-v2-08a859a1db81.herokuapp.com/
## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
<br>
Inside `.env`, set this variable.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
[Le Wagon](https://www.lewagon.com/ja/tokyo/web-development-course)
Design from [Doug's website](https://watchlist-dmb.herokuapp.com/)
