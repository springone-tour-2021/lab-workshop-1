
### 

*   Skaffold is watching the project files for changes
*   Open `K8sDemoApplication.java` and change the `hello` method to return `Hola World`
*   Once you save the file you will notice Skaffold rebuild and redeploy everthing with the new change


```
$ curl localhost:4503; echo
Hola World
```




---