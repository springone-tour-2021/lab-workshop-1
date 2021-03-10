
*   Our application could also be handling requests when it receives the notification that it needs to shut down.
*   In order for us to finish processing those requests before the application shuts down we can configure a “grace period” in our Spring Boot applicaiton.
*   Open `application.properties` in `/src/main/resources` and add

```editor:append-lines-to-file
file: ~/demo/src/main/resources/application.properties
text: |
        server.shutdown=graceful
```


There is also a `spring.lifecycle.timeout-per-shutdown-phase` (default 30s).

> `server.shutdown` is only available begining in Spring Boot 2.3.x



---