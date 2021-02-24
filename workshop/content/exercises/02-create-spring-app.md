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
mkdir demo && cd demo
```

Download and extract the project from the Spring Initializr
```execute-1
curl https://start.spring.io/starter.tgz -d artifactId=k8s-demo-app -d name=k8s-demo-app -d packageName=com.example.demo -d dependencies=web,actuator -d javaVersion=11 | tar -xzf -
```



**Modify K8sDemoApplication.java and create your Rest  controller**

First, add the annonations and @RestController

```editor:insert-lines-before-line
file: ~/demo/src/main/java/com/example/demo/K8sDemoAppApplication.java
line: 6
text: |
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.RestController;

    @RestController

```

Now, add your 'Helllo World' rest controller
```editor:insert-lines-before-line
file: ~/demo/src/main/java/com/example/demo/K8sDemoAppApplication.java
line: 17
text: |
    @GetMapping("/")
	public String hello() {
		return "HelloWorld\n start.spring.io\n";
	}
    
```



Your file should look like the following: 

```java
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class K8sDemoAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(K8sDemoAppApplication.class, args);
	}

	@GetMapping("/")
	public String hello() {
		return "Hello World";
	}
}
```