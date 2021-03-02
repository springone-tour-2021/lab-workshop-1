
*   Modify the `hello` method of `K8sDemoApplication.java` to make a request to the new service
```editor:insert-lines-before-line
file: ~/demo/src/main/java/com/example/demo/K8sDemoAppApplication.java
line: 8
text: |
		import org.springframework.web.client.RestTemplate;

```




```editor:insert-lines-before-line
file: ~/demo/src/main/java/com/example/demo/K8sDemoAppApplication.java
line: 18
text: |
		private RestTemplate rest = new RestTemplateBuilder().build();

```


```editor:insert-lines-before-line
file: ~/demo/src/main/java/com/example/demo/K8sDemoAppApplication.java
line: 18
text: |
		String name = rest.getForObject("http://k8s-workshop-name-service", String.class);
		return "Hola " + name;

```




*   Notice the hostname of the request we are making matches the service name in [our service.yaml file](https://github.com/ryanjbaxter/k8s-spring-workshop/blob/master/name-service/kustomize/base/service.yaml#L7)



---

