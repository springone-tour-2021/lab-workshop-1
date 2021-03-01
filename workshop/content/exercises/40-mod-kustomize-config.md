
In your k8s-demo-app’s `kustomize/base/kustomization.yaml` add a new resource pointing to the new app’s `kustomize` directory


```editor:insert-lines-before-line
file: ~/demo/kustomize/base/kustomization.yaml
line: 6
    apiVersion: kustomize.config.k8s.io/v1beta1
    kind: Kustomization

    resources:
      - service.yaml
      - deployment.yaml
      - https://github.com/ryanjbaxter/k8s-spring-workshop/name-service/kustomize/base

    configMapGenerator:
      - name: k8s-demo-app-config
        files:
          - application.yaml
```