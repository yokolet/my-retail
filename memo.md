##### Considerations

1. MongoDB connection problem
    - For the first time, /ext/api/v1/products should get hit. It looks this successfully
    makes connection to MongoDB. Otherwise, rails freezes. There should be a solution
    out there.
2. Clean up
    - should narrow down routes and eliminates unused methods, which were created by
    Rails scaffolding.
3. Error handling
    - when restclient ussed in a controller fails to connect another API server,
    the app should handle the error and return the appropriate error code
4. Test more
    - test the update method with invalid values, and etc.
5. Swagger for documentation
    - swagger-docs gem bothered rspec requests. Needs more research or just writes on
    the editor(?).
6. Login
    - must feature in the real world application. at least, update should not be allowed
    to any user. (authentication)
7. API key
    - needs API key for authorization purpose. This app doesn't need at this moment,
    but it's good to have api-key authorization mechanism.
8. HTTPS
    - nice to have. where to get certificate? self-signed?
