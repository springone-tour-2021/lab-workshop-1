
### 

*   Lets imagine we want to deploy our app to a QA environment, but in this environment we want to have two instances of our app running
*   Create a new directory called `qa` under the `kustomize` directory
*   Create a new file in `kustomize/qa` called `update-replicas.yaml`, this is where we will provide customizations for our QA environment
*   Add the following content to `kustomize/qa/update-replicas.yaml`


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: k8s-demo-app
spec:
  replicas: 2

```



*   Create a new file called `kustomization.yaml` in `kustomize/qa` and add the following to it


```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
- ../base

patchesStrategicMerge:
- update-replicas.yaml

```



*   Here we tell Kustomize that we want to patch the resources from the `base` directory with the `update-replicas.yaml` file
*   Notice that in `update-replicas.yaml` we are just updating the properties we care about, in this case the `replicas`



---
