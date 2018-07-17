# My Retail API

### Description

This app provides products API, which is a Proof-of-Concept. The API has a limited set of
REST API. The app includes two types of API. One is a public, another is an internal.
The internal API exists for testing purpose. In the actual situation, it should be some
external API. The public product API hits the internal API to get product's id and name.
Then, it puts external and its own information together to return to API consumers.

### Versions

This is a Rails app MongoDB backend. The app uses versions below:

- Ruby 2.5.1
- Rails 5.2.0
- MongoDB 4.0.0

To run the app, install Ruby and MongoDB of the versions above. The MongoDB should be running
to start up the Rails app.

### Prep before starting the Rails app

#### Gem installation

Once at the first time, necessary gems should be installed

```ruby
bundle install
```

#### Database seeding

To test the app, the database should have some data.

```ruby
rake db:seed
```

### Start the server

```ruby
rails s
```

### Run specs

The app has only models and requests specs since this is a Proof-of-Concept REST API app.
Make sure the app is up and running since the public API hits the internal API to get a
product info.

```ruby
# models spec
rake spec:models

# requests spec
rake spec:requests 
``` 

## Product API

### public API

- GET
    - /api/v1/products Get products' ids and names
        - responses
            - `200` returns an array of product objects
    - /api/v1/products/{productId} Get a product info including a current price
        - responses
            - `200` returns an object
            - `404` returns an error when no product found by the given id
- PUT/UPDATE
    - /api/v1/products/{productId} Update an existing product's current price
        - parameters
            - path id
            - body object of value or currency code, or both
        - responses
            - `204` no content will be returned when the current price is updated
            - `404` returns an error when no product found by the given id

### internal API

- GET
    - /ext/api/v1/products Get products' ids and names
        - responses
            - `200` returns an array of product objects
    - /ext/api/v1/products/{productId} Get a product info specified by id
        - responses
            - `200` returns an object
            - `404` returns an error when no product found by the given id