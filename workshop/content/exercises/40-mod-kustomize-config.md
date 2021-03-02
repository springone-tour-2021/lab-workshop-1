
In your k8s-demo-app’s `kustomize/base/kustomization.yaml` add a new resource pointing to the new app’s `kustomize` directory


```editor:insert-lines-before-line
file: ~/demo/kustomize/base/kustomization.yaml
line: 7
text: |
      - https://github.com/ryanjbaxter/k8s-spring-workshop/name-service/kustomize/base
```