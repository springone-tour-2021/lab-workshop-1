
You can use `kustomize build` to build the customizations and produce all of the YAML to deploy our application. This command will return the generated YAML as output in the terminal.

To build the base profile for our application run the following command.
```execute-1
kustomize build ./kustomize/base

```

When we build the QA customization the replicas property is updated to `2`.
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


