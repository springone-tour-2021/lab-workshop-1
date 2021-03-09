

Let’s update the `pom.xml` to configure the image name explicitly:


```editor:insert-lines-before-line
file: ~/demo/pom.xml
line: 17
text: |
	<spring-boot.build-image.imageName>{{ registry_host }}/apps/demo</spring-boot.build-image.imageName>
```


Then we can build and push a new image to our repository:


```execute-1
./mvnw clean spring-boot:build-image
```

```execute-1
docker push {{ registry_host }}/apps/demo
```


When we apply our resources again the old container will be terminated and a new one will be deployed with the new changes.
```execute-1
kubectl apply -f ~/demo/k8s
```


You can run the following command to watch Kubernetes terminate the old container and redeploy a new one in real time.
```execute-1
watch -n 1 kubectl get all
```

You can stil test with curl.
```execute-2
curl k8s-demo-app-{{ session_namespace }}.{{ ingress_domain }}
```


To exit running process in terminal one.
```terminal:interrupt
session: 1
```

---