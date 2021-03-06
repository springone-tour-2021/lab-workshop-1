
## 

*   With our container built and deployed to a registry you can now run this container on Kubernetes


---


### 
**Deployment Descriptor**



*   Kubernetes uses YAML files to provide a way of describing how the app will be deployed to the platform
*   You can write these by hand using the [Kubernetes documentation](https://kubernetes.io/docs/home/) as a reference
*   Or you can have Kubernetes generate them for you using `kubectl`
*   The `--dry-run` flag allows us to generate the YAML without actually deploying anything to Kubernetes

Lets create a directory to put the files we will need to deploy our application to Kubernetes

```execute-1
mkdir k8s
```

The first file we need is a deployment descriptor.  Execute the following command to create the file

```execute-1
kubectl create deployment k8s-demo-app --image {{ registry_host }}/apps/demo -o yaml --dry-run=client > ~/demo/k8s/deployment.yaml
```

*   The resulting `k8s/deployment.yaml` should look like this. You can switch to the Editor tab to compare with the file you just created.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: k8s-demo-app
  name: k8s-demo-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: k8s-demo-app
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: k8s-demo-app
    spec:
      containers:
      - image: {{ registry_host }}/apps/demo
        name: k8s-demo-app
        resources: {}
status: {}
```

---


### 
**Service Descriptor**


*   A service acts as a load balancer for the pod created by the deployment descriptor
*   If we want to be able to scale pods than we want to create a service for those pods


```execute-1
kubectl create service clusterip k8s-demo-app --tcp 80:8080 -o yaml --dry-run=client > ~/demo/k8s/service.yaml

```


*   The resulting `service.yaml` should look similar to this. Again, you can switch to the Editor tab to compare with the file you just created.

```yaml
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: k8s-demo-app
  name: k8s-demo-app
spec:
  ports:
  - name: 80-8080
    port: 80
    protocol: TCP
    targetPort: 8080
  selector:
    app: k8s-demo-app
  type: ClusterIP
status:
  loadBalancer: {}
```

---


### 
**Apply The Deployment and Service YAML**


*   The deployment and service descriptors have been created in the `/k8s` directory
*   Since we used the `--dry-run` flag to generate them, they have not yet been applied to Kubernetes
*   Apply these now to get everything running
*   You can watch as the pods and services get created

To apply your manifest files and get the app running, run the following command
```execute-1
kubectl apply -f ~/demo/k8s 
```

Execute the following `watch` command to see the deployment progress in Kubernetes
```execute-1
watch -n 1 kubectl get all
```

You should see something like the following:
```                 
NAME                               READY   STATUS    RESTARTS   AGE
pod/k8s-demo-app-d6dd4c4d4-7t8q5   1/1     Running   0          68m

NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/k8s-demo-app   ClusterIP   10.100.200.243   <none>        80/TCP    68m

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/k8s-demo-app   1/1     1            1           68m

NAME                                     DESIRED   CURRENT   READY   AGE
replicaset.apps/k8s-demo-app-d6dd4c4d4   1         1         1       68m
```

> `watch` is a useful command line tool that you can install on [Linux](https://www.2daygeek.com/linux-watch-command-to-monitor-a-command/) and [OSX](https://osxdaily.com/2010/08/22/install-watch-command-on-os-x/). All it does is continuously execute the command you pass it. You can just run the `kubectl` command specified after the `watch` command but the output will be static as opposed to updating constantly.

Terminate the `watch` process before to continuing.

```terminal:interrupt
session: 1
```

---