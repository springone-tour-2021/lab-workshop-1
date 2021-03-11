
### 

Once we are done, if we kill the `skaffold` process, Skaffold will remove all the    resources. Just hit `CTRL-C` in the terminal where `skaffold` is running…

To exit Skaffold in terminal one.
```terminal:interrupt
session: 1
```

You should see the following output.
```
...
WARN[2086] exit status 1
Cleaning up...
 - deployment.apps "k8s-demo-app" deleted
 - service "k8s-demo-app" deleted
 - ingress.networking.k8s.io "k8s-demo-app" deleted
```




---
