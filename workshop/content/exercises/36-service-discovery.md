

*   Kubernetes makes it easy to make requests to other services
*   Each service has a DNS entry in the container of the other services allowing you to make requests to that service using the service name
*   For example, if there is a service called `k8s-workshop-name-service` deployed we could make a request from the `k8s-demo-app` just by making an HTTP request to `http://k8s-workshop-name-service`



---
