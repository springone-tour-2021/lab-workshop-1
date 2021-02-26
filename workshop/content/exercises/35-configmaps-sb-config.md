

*   In Spring Boot we usually place our configuration values in application properties or YAML
*   Config Maps in Kubernetes can be populated with values from files, like properties or YAML files
*   We can do this via `kubectl`


```execute-1
ubectl create configmap k8s-demo-app-config --from-file ./path/to/application.yaml
```


No need to execute the above command, it is just an example, the following sections will show a better way



*   We can then mount this config map as a volume in our container at a directory Spring Boot knows about and Spring Boot will automatically recognize the file and use it



---