
## 
**Run The App**

In a terminal window run, the app will start on port `8080`.

```execute-1
./mvnw spring-boot:run
```

---


## 
**Test The App**

Make an HTTP request to [http://localhost:8080](http://localhost:8080/) in another terminal


```execute-2
$ curl http://localhost:8080; echo
Hello World
```

---


## 
**Test Spring Boot Actuator**

Spring Boot Actuator adds several other endpoints to our app


```execute-2
$ curl localhost:8080/actuator | jq .
{
  "_links": {
    "self": {
      "href": "http://localhost:8080/actuator",
      "templated": false
    },
    "health": {
      "href": "http://localhost:8080/actuator/health",
      "templated": false
    },
    "info": {
      "href": "http://localhost:8080/actuator/info",
      "templated": false
    }
}
```


Be sure to stop the Java process before continuing on or else you might get port binding issues since Java is using port `8080`

```terminal:interrupt-all
```
