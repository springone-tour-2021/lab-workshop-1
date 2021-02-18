### 
**Using Kustomize With Skaffold**



*   Currently our Skaffold configuration uses `kubectl` to deploy our artifacts, but we can change that to use `kustomize`
*   Change your `skaffold.yaml` to the following


```
apiVersion: skaffold/v2beta5
kind: Config
metadata:
  name: k-s-demo-app
build:
  artifacts:
  - image: localhost:5000/apps/demo
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