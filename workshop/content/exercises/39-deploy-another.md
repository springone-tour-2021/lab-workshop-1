
*   In order to save time we will use an [existing app](https://github.com/ryanjbaxter/k8s-spring-workshop/tree/master/name-service) that returns a random name
*   The container for this service resides [in Docker Hub](https://hub.docker.com/repository/docker/ryanjbaxter/k8s-workshop-name-service) (a public container registery)
*   To make things easier we placed a [Kustomization file](https://github.com/ryanjbaxter/k8s-spring-workshop/blob/master/name-service/kustomize/base/kustomization.yaml) in the GitHub repo that we can reference from our own Kustomization file to deploy the app to our cluster

### 