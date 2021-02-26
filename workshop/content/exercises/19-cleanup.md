
### 

Once we are done, if we kill the `skaffold` process, skaffold will remove the deployment and service resources. Just hit `CTRL-C` in the terminal where `skaffold` is running…

To exit Skaffold in terminal one.
```terminal:interrupt
session: 1
```

```
...
WARN[2086] exit status 1
Cleaning up...
 - deployment.apps "k8s-demo-app" deleted
 - service "k8s-demo-app" deleted
```




---
