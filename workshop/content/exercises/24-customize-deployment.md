
### 

Lets imagine we want to deploy our app to a QA environment, but in this environment we want to have two instances of our app running.  To do
this we can create a new Kustomization for this environment which specifies the number of instances we want deployed.

Create a new directory called `qa` under the `kustomize` directory
```execute-1
mkdir -p kustomize/qa
```

Create a new file in `kustomize/qa` called `update-replicas.yaml`, this is where we will specify that we want 2 replicas running

```editor:append-lines-to-file
file: ~/demo/kustomize/qa/update-replicas.yaml
text: |
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: k8s-demo-app
      spec:
        replicas: 2
```



Create a new file called `kustomization.yaml` in `kustomize/qa` and add the following to it

```editor:append-lines-to-file
file: ~/demo/kustomize/qa/kustomization.yaml
text: |
      apiVersion: kustomize.config.k8s.io/v1beta1
      kind: Kustomization

      resources:
      - ../base

      patchesStrategicMerge:
      - update-replicas.yaml

```

Here we tell Kustomize that we want to patch the resources from the `base` directory with the `update-replicas.yaml` file.
Notice that in `update-replicas.yaml` we are just updating the properties we care about, in this case the `replicas`.



---
