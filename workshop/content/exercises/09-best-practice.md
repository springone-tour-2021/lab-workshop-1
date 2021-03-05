### 
**Liveness and Readiness Probes**

*   Kubernetes uses two probes to determine if the app is ready to accept traffic and whether the app is alive
*   If the readiness probe does not return a `200` no traffic will be routed to it
*   If the liveness probe does not return a `200` Kubernetes will restart the Pod
*   Spring Boot has a build in set of endpoints from the [Actuator](https://spring.io/blog/2020/03/25/liveness-and-readiness-probes-with-spring-boot) module that fit nicely into these use cases
    *   The `/health/readiness` endpoint indicates if the application is healthy, this fits with the readiness probe
    *   The `/health/liveness` endpoint serves application info, we can use this to make sure the application is “alive”

> The `/health/readiness` and `/health/liveness` endpoints are only available in Spring Boot 2.3.x. The`/health` and `/info` endpoints are reasonable starting points in earlier versions.

