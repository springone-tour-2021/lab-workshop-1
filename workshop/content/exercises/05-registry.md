
### 
**Putting The Container In A Registry**



*   Up until this point the container only lives on your machine
*   It is useful to instead place the container in a registry
    *   In a real life scenario this allows others to use the container
*   [Docker Hub](https://hub.docker.com/) is a popular public registry
*   Private registries exist as well. In this lab you will be using a private registry on localhost.


---


### 
**Run The Build And Deploy The Container**



*   Run the following Maven command to build the application and container.  `spring-boot.build-image.imageName`
allows us to specify the image name.

```execute-1
./mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=$REGISTRY_HOST/apps/demo
```

Now we can push the container to the local container registry
```execute-1
docker push $REGISTRY_HOST/apps/demo
```

If you query the registry you should now see the image

```execute-1
curl $REGISTRY_USERNAME:$REGISTRY_PASSWORD@$REGISTRY_HOST/v2/_catalog
{"repositories":["apps/demo"]}
```
---