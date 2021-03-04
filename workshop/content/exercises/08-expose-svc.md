
### 
**Exposing The Service**

*   If we want to expose the service publically we can use an Ingress.

> An Ingress is an API object that defines rules which allow external access to services in a cluster. An Ingress controller fulfills the rules set in the Ingress.

Next, you will go create `ingress.yaml` so you can access your app externally. 

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
        - host: YourHost
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

Now, source your host from your lab environment and add to your `ingress.yaml`. (This is not necessary outside of this lab).
```execute-1
 sed s/YourHost/k8s-demo-app-${SESSION_NAMESPACE}.${INGRESS_DOMAIN}/g ~/demo/k8s/ingress.yaml -i
```

Take a peek at your file to verify your host populated.
```editor:select-matching-text
file: ~/demo/k8s/ingress.yaml
text: "host" 
```

Now, apply the `ingress.yaml`, your service, and your Kubernetes deployment.
```execute-1
kubectl apply -f ~/demo/k8s
```

---