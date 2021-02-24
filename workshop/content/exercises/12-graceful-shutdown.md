
*   Due to the asynchronous way Kubnernetes shuts down applications there is a period of time when requests can be sent to the application while an application is being terminated.
*   To deal with this we can configure a pre-stop sleep to allow enough time for requests to stop being routed to the application before it is terminated.
*   Add a `preStop` command to the `podspec` of your `deployment.yaml`


```editor:insert-value-into-yaml
file: ~/demo/k8s/deployment.yaml
path: spec.template.spec.containers.[0]
value:
        lifecycle:
          preStop:
            exec:
              command: ["sh", "-c", "sleep 10"]
```




---
