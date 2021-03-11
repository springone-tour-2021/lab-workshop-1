**Skaffold**

Thus far, to deploy any changes to the app, we have needed to re-build the image, push it to the docker registry, recreate the pod in Kubernetes, and potentially port-forward for testing. We can automate these steps (and more) using a command line tool called [Skaffold](https://github.com/GoogleContainerTools/skaffold).

*   Skaffold facilitates continuous development for Kubernetes applications by handling the workflow for building, pushing and deploying your application.
*   It simplifies the development process by combining multiple steps into one easy command
*   It provides the building blocks for a CI/CD process


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
          - image: {{ registry_host }}/apps/demo
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
        portForward:
        - resourceType: service
          resourceName: k8s-demo-app 
          port: 80
          localPort: 4503
```

The `builder` is the same one used by Spring Boot when it builds a container from the build plugins (you would see it logged on the console when you build the image). 

An alternative syntax for the `build` section would be to use `custom` instead of `buildpacks` configuration. For example:


```
   custom:
      buildCommand: ./mvnw spring-boot:build-image -D spring-boot.build-image.imageName=$IMAGE && docker push $IMAGE
```



