

---

### 
**Building A Container**



*   Spring Boot 2.3.x can build a container for you without the need for any additional plugins or files
*   To do this use the Spring Boot Build plugin goal `build-image`


```execute-1
./mvnw spring-boot:build-image

```


*   Running `docker images` will allow you to see the built container


```execute-2
docker images
```


---


### 
**Run The Container**


```execute-1
docker run --name k8s-demo-app -p 8080:8080 k8s-demo-app:0.0.1-SNAPSHOT
```




---



### 
**Test The App Responds**


```execute-2
$ curl http://localhost:8080; echo
Hello World
```


Be sure to stop the docker container before continuing. You can stop the container and remove it by running 
```execute-2
docker rm -f k8s-demo-app 
```

---

