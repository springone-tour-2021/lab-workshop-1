
### 
**Putting The Container In A Registry**



*   Up until this point the container only lives on your machine
*   It is useful to instead place the container in a registry
    *   Allows others to use the container
*   [Docker Hub](https://hub.docker.com/) is a popular public registry
*   Private registries exist as well. In this lab you will be using a private registry on localhost.


---


### 
**Run The Build And Deploy The Container**



*   You should be able to run the Maven build and

Maven Build:
```execute-1
./mvnw spring-boot:build-image -Dspring-boot.build-image.imageName={{ registry_host }}/apps/demo
```

Push the container to the local container registry
```execute-1
docker push {{ registry_host }}/apps/demo
```


You can now see the image in the registry

```execute-1
curl {{ registry_host }}/v2/_catalog
```

---