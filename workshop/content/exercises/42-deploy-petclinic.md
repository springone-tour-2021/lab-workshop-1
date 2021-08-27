

*   We have a Kustomization that we can use to easily get it up and running

Clone the repository for the `kustomization.yaml`.
```execute-1
git clone https://github.com/springone-tour-2021/docker-services.git
```

```execute-1
kustomize build ~/demo/docker-services/layers/samples/petclinic/ | kubectl apply -f -
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
        - host: petclinic-app-{{ session_namespace }}.{{ ingress_domain }}
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

Use the following command to apply the new ingress rule to the cluster

```execute-1
 kubectl apply -f ~/demo/petclinic-ingress.yaml
```

Depending on the ingress being used in the Kubernetes cluster you might need to wait for an IP address to be assigned to the ingress.  For
this lab, if you are using the hosted version you will not see an IP address assigned.  If you are running the workshop locally on
a Kubernetes cluster like Minikube you will need to wait for an IP address to be assigned.

Use the following command to find the hostname for the ingress rule and optionally watch for an IP address to be assigned to the ingress rule.

```execute-1
kubectl get ingress -w
```

You can open the host name in your browser or click the action below to open the Pet Clinic dashboard in the workshop.

```dashboard:open-dashboard
name: Petclinic
```


*   To use the app you can go to “Find Owners”, add yourself, and add your pets
*   All this data will be stored in the MySQL database

To exit the watch command
```terminal:interrupt
session: 1
```

---