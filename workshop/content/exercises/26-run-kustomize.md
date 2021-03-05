

You will need to have [Kustomize installed](https://github.com/kubernetes-sigs/kustomize/blob/master/docs/INSTALL.md)


This is our base deployment and service resources.
```execute-1
kustomize build ./kustomize/base

```

Notice when we build the QA customization that the replicas property is updated to `2`
```execute-1
kustomize build ./kustomize/qa
```

```
...
spec:
  replicas: 2
...

```

---


