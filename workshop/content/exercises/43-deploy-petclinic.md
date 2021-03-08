

*   We have a Kustomization that we can use to easily get it up and running

```execute-1
kustomize build https://github.com/dsyer/docker-services/layers/samples/petclinic?ref=HEAD | kubectl apply -f -
```

The above `kustomize build` command may take some time to complete.  You can watch the pod status to know once everything is ready.

```execute-2
watch kubectl get all
```

Once the pod is up and running, you can stop the `watch` command.

To exit the watch command
```terminal:interrupt
session: 2
```

Add an ingress rule to expose the service

```editor:append-lines-to-file
file: ~/demo/petclinic-ingress.yaml
text: |
      apiVersion: networking.k8s.io/v1
      kind: Ingress
      metadata:
        name: petclinic-app
        labels:
          app: petclinic-app
      spec:
        rules:
        - host: YourHost
          http:
            paths:
            - path: "/"
              pathType: Prefix
              backend:
                service:
                  name: petclinic-app
                  port: 
                    number: 80
```

Now, get `YourHost` from your lab environment and add it to your `petclinic-ingress.yaml` with the next command. Within this lab petclinic-app{{ session_namespace }}.{{ ingress_domain }} is `YourHost` for your `Petclinic` app.

```execute-1
 sed s/YourHost/petclinic-app{{ session_namespace }}.{{ ingress_domain }}/g ~/demo/petclinic-ingress.yaml -i
```

We need to apply the new ingress rule to our cluster

```execute-1
 kubectl apply -f ~/demo/petclinic-ingress.yaml
```

Finally we can watch to see once an IP address has been assigned to our ingress rule

```execute-1
kubectl get ingress -w
```

Once an IP address has been assigned you can open the host name in your browser or click the action below to open the Pet Clinic dashboard in the workshop.

```dashboard:create-dashboard
name: Dogclinic
url: petclinic-app-{{ session_namespace }}.{{ ingress_domain}}
```

```dashboard:open-dashboard
name: Petclinic
```


*   To use the app you can go to “Find Owners”, add yourself, and add your pets
*   All this data will be stored in the MySQL database



---