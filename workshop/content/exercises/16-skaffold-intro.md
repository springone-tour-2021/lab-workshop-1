**Skaffold**

*   [Skaffold](https://github.com/GoogleContainerTools/skaffold) is a command line tool that facilitates continuous development for Kubernetes applications
*   Simplifies the development process by combining multiple steps into one easy command
*   Provides the building blocks for a CI/CD process


Confirm Skaffold is installed by running the following command
```execute-1
skaffold version
```



### 
**Adding Skaffold YAML**



*   Skaffold is configured using…you guessed it…another YAML file
*   Create a YAML file `skaffold.yaml` in the root of the project


```editor:append-lines-to-file
file: ~/demo/skaffold.yaml
text: |
        apiVersion: skaffold/v2beta12
        kind: Config
        metadata:
          name: k-s-demo-app--
        build:
          artifacts:
          - image: YourImage
            buildpacks:
              builder: docker.io/paketobuildpacks/builder:base
              dependencies:
                paths:
                - src
                - pom.xml
        deploy:
          kubectl:
            manifests:
            - k8s/deployment.yaml
            - k8s/service.yaml
            - k8s/ingress.yaml
```


We need to replace the image `YourImage` with the correct image located in our repository in the above `skaffold.yaml` file.
To do this execute the following `sed` command. 
```execute-1
 sed "s/YourImage/{{ registry_host }}\/apps\/demo/g" skaffold.yaml -i
```

Take a peek at your file to verify your `image` populated correctly.
```editor:select-matching-text
file: ~/demo/skaffold.yaml
text: "image" 
```

The `builder` is the same one used by Spring Boot when it builds a container from the build plugins (you would see it logged on the console when you build the image). Instead of the `buildpacks` builder you could use the `custom` one (with the same `dependencies`):


```
   custom:
      buildCommand: ./mvnw spring-boot:build-image -D spring-boot.build-image.imageName=$IMAGE && docker push $IMAGE
```



