

Let’s update the `pom.xml` to configure the image name explicitly:


```editor:insert-lines-before-line
file: ~/demo/pom.xml
line: 17
text: |
	<spring-boot.build-image.imageName>{{ registry_host }}/apps/demo</spring-boot.build-image.imageName>
```


Then we can build and push the changes and re-deploy:


```execute-1
./mvnw clean spring-boot:build-image
```

```execute-1
docker push {{ registry_host }}/apps/demo
```


An updated Pod will be created and started and the old one will be terminated when you re-deploy.
```execute-1
kubectl apply -f ~/demo/k8s
```



To see all the Kubernetes resources you will be able to see this happen in real time
```execute-1
watch -n 1 kubectl get all
```

To exit running process in terminal one.
```terminal:interrupt
session: 1
```

---