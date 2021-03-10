
*   Here’s the `kustomization.yaml` that you just deployed:


```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
- ../../base
- ../../mysql
namePrefix: petclinic-
transformers:
- ../../mysql/transformer
- ../../actuator
- ../../prometheus
images:
  - name: dsyer/template
    newName: dsyer/petclinic
configMapGenerator:
  - name: env-config
    behavior: merge
    literals:
      - SPRING_CONFIG_LOCATION=classpath:/,file:///config/bindings/mysql/meta/
      - MANAGEMENT_ENDPOINTS_WEB_BASEPATH=/actuator
      - DATABASE=mysql

```



*   The relative paths `../../*` are all relative to this file. Clone the repository to look at those: `git clone https://github.com/dsyer/docker-services` and look at `layers/samples/petclinc/kustomization.yaml`.

Clone the repository for the `kustomization.yaml`.
```execute-2
git clone https://github.com/dsyer/docker-services
```

Look at `~/docker-services/layers/samples/petclinic/kustomization.yaml`.
```editor:select-matching-text
file: ~/docker-services/layers/samples/petclinic/kustomization.yaml
text: "base" 
```


*   Important features:
    *   `base`: a generic `Deployment` and `Service` with a `Pod` listening on port 8080
    *   `mysql`: a local MySQL `Deployment` and `Service`. Needs a `PersistentVolume` so only works on Kubernetes clusters that have a default volume provider
    *   `transformers`: patches to the basic application deployment. The patches are generic and could be shared by multiple different applications.
    *   `env-config`: the base layer uses this `ConfigMap` to expose environment variables for the application container. These entries are used to adapt the PetClinic to the Kubernetes environment.




