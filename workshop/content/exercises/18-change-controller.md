
### 

Skaffold will watch the project files for changes
Open `K8sDemoApplication.java` and change the `hello` method to return `Hola World`

```editor:select-matching-text
file: ~/demo/src/main/java/com/example/demo/K8sDemoAppApplication.java
text: "return" 
```

Once you save the file you will notice Skaffold rebuild and redeploy everything with the new change

Execute the following command and notice it now returns `Hola World`.
```execute-2
curl localhost:4503
```



---