
If you run `skaffold` without specifying a `profile` parameter skaffold will use the deployment configuration from `kustomize/base`.

```execute-1
skaffold dev --port-forward

```



If you want to test out the QA deployment you can specify the `qa` profile.


```execute-1
skaffold dev -p qa --port-forward
```

Test your deployment freely.
```execute-1
curl localhost:4503
```

Be sure to kill the `skaffold` process before continuing.

```terminal:interrupt
session: 1
```


---


