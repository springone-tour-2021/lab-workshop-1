### 
**Using Kustomize With Skaffold**



Currently our Skaffold configuration uses `kubectl` to deploy our artifacts, but we can change that to use `kustomize`

First, delete your previous `skaffold.yaml`
```execute-1
rm skaffold.yaml
```

Change your `skaffold.yaml` to the following.
```editor:append-lines-to-file
file: ~/demo/skaffold.yaml
text: |
      apiVersion: skaffold/v2beta5
      kind: Config
      metadata:
        name: k-s-demo-app
      build:
        artifacts:
        - image: {{ registry_host }}/apps/demo
          buildpacks:
            builder: gcr.io/paketo-buildpacks/builder:base-platform-api-0.3
            dependencies:
              paths:
                - src
                - pom.xml
      deploy:
        kustomize:
          paths: ["kustomize/base"]
      profiles:
        - name: qa
          deploy:
            kustomize:
              paths: ["kustomize/qa"]

```

*   Notice now the `deploy` property has been changed from `kubectl` to now use Kustomize
*   Also notice that we have a new profiles section allowing us to deploy our QA configuration using Skaffold



---