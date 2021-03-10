



*   There are a number of ways to consume the data from ConfigMaps in our apps
*   Perhaps the easiest is to use the data as environment variables
*   To do this we need to change our `deployment.yaml` in `kustomize/base`

*   Add the `envFrom` properties from the previous module which reference our ConfigMap `log-level`
```editor:insert-value-into-yaml
file: ~/demo/kustomize/base/deployment.yaml
path: spec.template.spec.containers.[0]
value:
      envFrom:
        - configMapRef:
            name: log-level
```

*   Update the deployment by running `skaffold dev` (so we can stream the logs)
```execute-1
skaffold dev
```
*   If everything worked correctly you should see much more verbose logging in your console
```execute-2
curl localhost:4503
```

Be sure to kill the `skaffold` process before continuing

```terminal:interrupt
session: 1
```