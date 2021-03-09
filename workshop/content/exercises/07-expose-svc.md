

*   If we want to expose the service outside of the cluster we can use an Ingress.

> An Ingress is an API object that defines rules which allow external access to services in a cluster. An Ingress controller fulfills the rules set in the Ingress.

Next, you will go create `ingress.yaml` so you can access your app outside of the clister. 

Click below to create your `ingress.yaml`.
```editor:append-lines-to-file
file: ~/demo/k8s/ingress.yaml
text: |
      apiVersion: networking.k8s.io/v1
      kind: Ingress
      metadata:
        name: k8s-demo-app
        labels:
          app: k8s-demo-app
      spec:
        rules:
        - host: k8s-demo-app-{{ session_namespace }}.{{ ingress_domain }}
          http:
            paths:
            - path: "/"
              pathType: Prefix
              backend:
                service:
                  name: k8s-demo-app
                  port: 
                    number: 80
```

Now, apply the `ingress.yaml`.
```execute-1
kubectl apply -f ~/demo/k8s
```

---