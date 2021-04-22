*   The relative paths `../../*` are all relative to the file `~/docker-services/layers/samples/petclinic/kustomization.yaml`. 

*   Important features:
    
    
  *   `base`: a generic `Deployment` and `Service` with a `Pod` listening on port 8080.
    
```editor:select-matching-text
file: ~/docker-services/layers/samples/petclinic/kustomization.yaml
text: "base" 
```

  *   `mysql`: a local MySQL `Deployment` and `Service`. 
  *   `transformers`: patches to the basic application deployment. The patches are generic and could be shared by multiple different applications.
  *   `env-config`: the base layer uses this `ConfigMap` to expose environment variables for the application container. These entries are used to adapt the PetClinic to the Kubernetes environment.




