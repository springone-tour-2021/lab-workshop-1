---
## 
**What You Will Do**

*   Create a basic Spring Boot app
*   Build a Docker image for the app
*   Push the app to a Docker repo
*   Create deployment and service descriptors for Kubernetes
*   Deploy and run the app on Kubernetes
*   External configuration and service discovery
*   Deploy the Spring PetClinic App with MySQL

---


```execute-1
curl https://start.spring.io/starter.tgz -d artifactId=k8s-demo-app -d name=k8s-demo-app -d packageName=com.example.demo -d dependencies=web,actuator -d javaVersion=11 | tar -xzf -
```


*   Open the IDE using the "Editor" button at the top of the lab - it might be obscured by the “Call for Assistance” button.

---

