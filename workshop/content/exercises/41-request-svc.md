
*   Modify the `hello` method of `K8sDemoApplication.java` to make a request to the new service


```
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@RestController
public class K8sDemoAppApplication {

	private RestTemplate rest = new RestTemplateBuilder().build();

	public static void main(String[] args) {
		SpringApplication.run(K8sDemoAppApplication.class, args);
	}

	@GetMapping("/")
	public String hello() {
		String name = rest.getForObject("http://k8s-workshop-name-service", String.class);
		return "Hola " + name;
	}
}

```



*   Notice the hostname of the request we are making matches the service name in [our service.yaml file](https://github.com/ryanjbaxter/k8s-spring-workshop/blob/master/name-service/kustomize/base/service.yaml#L7)



---

