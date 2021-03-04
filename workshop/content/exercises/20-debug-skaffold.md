Skaffold also makes it easy to attach a debugger to the container running in Kubernetes


```execute-1
skaffold debug --port-forward 
```

```bsh
...
Port forwarding service/k8s-demo-app in namespace rbaxter, remote port 80 -> address 127.0.0.1 port 4503
Watching for changes...
Port forwarding pod/k8s-demo-app-75d4f4b664-2jqvx in namespace rbaxter, remote port 5005 -> address 127.0.0.1 port 5005
...

```



The `debug` command results in two ports being forwarded    
* The http port, `4503` in the above example
* The remote debug port `5005` in the above example

Set a breakpoint where we return `Hola World` from the `hello` method in `K8sDemoApplication.java`

```editor:select-matching-text
file: ~/demo/src/main/java/com/example/demo/K8sDemoAppApplication.java
text: "return" 
```

Example: Adding breakpoint, notice the dot on the return statement (Click image to enlarge).
![alt_text](images/image2.png "~/demo/src/main/java/com/example/demo/K8sDemoAppApplication.java")

After setting breakpoint curl your endpoint.
```execute-2
curl localhost:80
```

