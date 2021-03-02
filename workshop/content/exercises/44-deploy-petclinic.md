

*   We have a Kustomization that we can use to easily get it up and running

```execute-1
kustomize build https://github.com/dsyer/docker-services/layers/samples/petclinic?ref=HEAD | kubectl apply -f -
```

```execute-1
kubectl port-forward service/petclinic-app --address 0.0.0.0 8080:80
```


The above `kustomize build` command may take some time to complete

Head to `http://localhost:8080` 
```execute-1
http://localhost:8080
```

*   To use the app you can go to “Find Owners”, add yourself, and add your pets
*   All this data will be stored in the MySQL database



---