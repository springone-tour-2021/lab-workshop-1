

*   You will need to have [Kustomize installed](https://github.com/kubernetes-sigs/kustomize/blob/master/docs/INSTALL.md)


```
$ kustomize build ./kustomize/base

```



*   This is our base deployment and service resources


```
$ kustomize build ./kustomize/qa
...
spec:
  replicas: 2
...

```



*   Notice when we build the QA customization that the replicas property is updated to `2`



---


