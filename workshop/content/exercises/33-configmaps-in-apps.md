



*   There are a number of ways to consume the data from config maps in our apps
*   Perhaps the easiest is to use the data as environment variables
*   To do this we need to change our `deployment.yaml` in `kustomize/base`


```editor:insert-value-into-yaml
file: ~/kustomize/base/deployment.yaml
path: spec.template.spec.containers
value:
        envFrom:
          - configMapRef:
              name: log-level
```



*   Add the `envFrom` properties above which reference our config map `log-level`
*   Update the deployment by running `skaffold dev` (so we can stream the logs)
*   If everything worked correctly you should see much more verbose logging in your console
