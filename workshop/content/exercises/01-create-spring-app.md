---
## 
**Getting Started** 



First we will create a directory for our app and use [start.spring.io](http://start.spring.io) to create a basic Spring
Boot application.

---

```execute-1
mkdir demo && cd demo
```

Download and extract the project from the Spring Initializr
```execute-1
curl https://start.spring.io/starter.tgz -d artifactId=k8s-demo-app -d name=k8s-demo-app -d packageName=com.example.demo -d dependencies=web,actuator -d javaVersion=11 | tar -xzf -
```



**Modify K8sDemoApplication.java and create your Rest  controller**

First, add the annotations and @RestController

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
		return "HelloWorld\n";
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
		return "Hello World\n";
	}
}
```