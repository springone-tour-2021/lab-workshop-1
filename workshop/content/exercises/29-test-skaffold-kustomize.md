
If you run `skaffold` without specifying a `profile` parameter Skaffold will use the deployment configuration from `kustomize/base`.

```execute-1
skaffold dev --port-forward

```

Terminate the currently running Skaffold process.

```terminal:interrupt
session: 1
```

Run the following command specifying the `qa` profile to test out the QA deployment.

```execute-1
skaffold dev -p qa --port-forward
```

Test your deployment freely. You can validate that two pods are created when the qa profile is specified.
```execute-2
kubectl get all
```

You can also validate that the app is functional.
```execute-2
curl localhost:4503
```

Be sure to kill the `skaffold` process before continuing.

```terminal:interrupt
session: 1
```


---


