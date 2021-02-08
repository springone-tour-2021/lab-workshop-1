<!-- Copy and paste the converted output. -->

<!-----
NEW: Check the "Suppress top comment" option to remove this info from the output.

Conversion time: 7.925 seconds.


Using this Markdown file:

1. Paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* Docs to Markdown version 1.0β29
* Wed Jan 27 2021 13:57:30 GMT-0800 (PST)
* Source doc: Spring Tour Workshops TODO
* This document has images: check for >>>>>  gd2md-html alert:  inline image link in generated source and store images to your server. NOTE: Images in exported zip file from Google Docs may not appear in  the same order as they do in your doc. Please check the images!

----->


<p style="color: red; font-weight: bold">>>>>>  gd2md-html alert:  ERRORs: 0; WARNINGs: 0; ALERTS: 6.</p>
<ul style="color: red; font-weight: bold"><li>See top comment block for details on ERRORs and WARNINGs. <li>In the converted Markdown or HTML, search for inline alerts that start with >>>>>  gd2md-html alert:  for specific instances that need correction.</ul>

<p style="color: red; font-weight: bold">Links to alert messages:</p><a href="#gdcalert1">alert1</a>
<a href="#gdcalert2">alert2</a>
<a href="#gdcalert3">alert3</a>
<a href="#gdcalert4">alert4</a>
<a href="#gdcalert5">alert5</a>
<a href="#gdcalert6">alert6</a>

<p style="color: red; font-weight: bold">>>>>> PLEASE check and correct alert issues and delete this message and the inline alerts.<hr></p>



# **Spring on Kubernetes!**

Workshop Materials: [https://hackmd.io/@ryanjbaxter/spring-on-k8s-workshop](https://hackmd.io/@ryanjbaxter/spring-on-k8s-workshop)

Ryan Baxter, Spring Cloud Engineer, VMware

Dave Syer, Spring Engineer, VMware



---



## 
**What You Will Do**



*   Create a basic Spring Boot app
*   Build a Docker image for the app
*   Push the app to a Docker repo
*   Create deployment and service descriptors for Kubernetes
*   Deploy and run the app on Kubernetes
*   External configuration and service discovery
*   Deploy the Spring PetClinic App with MySQL



---



### 
**Prerequisites**

Everyone will need:



*   Basic knowledge of Spring and Kubernetes (we will not be giving an introduction to either)

If you are following these notes from a KubeAdademy event all the pre-requisites will be provided in the Lab. You only need to worry about these if you are going to work through the lab on your own.



*   [JDK 8 or higher](https://openjdk.java.net/install/index.html)
    *   **Please ensure you have a JDK installed and not just a JRE**
*   [Docker](https://docs.docker.com/install/) installed
*   [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed
*   [Kustomize](https://github.com/kubernetes-sigs/kustomize/blob/master/docs/INSTALL.md) installed
*   [Skaffold](https://skaffold.dev/docs/install/) installed
*   An IDE (IntelliJ, Eclipse, VSCode)
    *   **Optional** [Cloud Code](https://cloud.google.com/code/) for IntelliJ and VSCode is nice. For VSCode the [Microsoft Kubernetes Extension](https://github.com/Azure/vscode-kubernetes-tools) is almost the same.



---



### 
**Configure kubectl**



*   Depending on how you are doing this workshop will determine how you configure `kubectl`

#### 
**Doing The Workshop On Your Own**

*   If you are doing this workshop on your own you will need to have your own Kubernetes cluster and Docker repo that the cluster can access
    *   **Docker Desktop and Docker Hub** - Docker Desktop allows you to easily setup a local Kubernetes cluster ([Mac](https://docs.docker.com/docker-for-mac/#kubernetes), [Windows](https://docs.docker.com/docker-for-windows/#kubernetes)). This in combination with [Docker Hub](https://hub.docker.com/) should allow you to easily run through this workshop.
    *   **Hosted Kubernetes Clusters and Repos** - Various cloud providers such as Google and Amazon offer options for running Kubernetes clusters and repos in the cloud. You will need to follow instructions from the cloud provider to provision the cluster and repo as well configuring `kubectl` to work with these clusters.

#### 
**Doing The Workshop in Strigo**

*   Login To Strigo with the link and access code provided by KubeAcademy.

Configuring `kubectl`. Run this command in the terminal: \
`  $ kind-setup`


```
  Cluster already active: kind
  Setting up kubeconfig

```



*   
*   Run the below command to verify kubectl is configured correctly


```
$ kubectl cluster-info
Kubernetes master is running at https://127.0.0.1:43723
KubeDNS is running at https://127.0.0.1:43723/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```


NOTE: it might take a minute or so after the VM launches to get the Kubernetes API server up and running, so your first few attempts at using `kubectl` may be very slow or fail. After that it should be responsive.



---



## 
**Create a Spring Boot App**

In the Lab:

Run these commands in your terminal (please copy them verbatim to make the rest of the lab run smoothly) \
`$ cd demo`


```
$ curl https://start.spring.io/starter.tgz -d artifactId=k8s-demo-app -d name=k8s-demo-app -d packageName=com.example.demo -d dependencies=web,actuator -d javaVersion=11 | tar -xzf -

```



*   
*   Open the IDE using the “IDE” button at the top of the lab - it might be obscured by the “Call for Assistance” button.

Working on your own:



*   Click [here](https://start.spring.io/starter.zip?type=maven-project&language=java&bootVersion=2.3.0.M4&packaging=jar&jvmVersion=1.8&groupId=com.example&artifactId=k8s-demo-app&name=k8s-demo-app&description=Demo%20project%20for%20Spring%20Boot%20and%20Kubernetes&packageName=com.example.demo&dependencies=web,actuator&javaVersion=11) to download a zip of the Spring Boot app
*   Unzip the project to your desired workspace and open in your favorite IDE



---



## 
**Add A RestController**

Modify `K8sDemoApplication.java` and add a `@RestController`

Be sure to add the `@RestController` annotation and not just the `@GetMapping`


```
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class K8sDemoAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(K8sDemoAppApplication.class, args);
	}

	@GetMapping("/")
	public String hello() {
		return "Hello World";
	}
}
```




---



## 
**Run The App**

In a terminal window run


```
$ ./mvnw spring-boot:run
```


The app will start on port `8080`



---



## 
**Test The App**

Make an HTTP request to [http://localhost:8080](http://localhost:8080/) in another terminal


```
$ curl http://localhost:8080; echo
Hello World
```




---



## 
**Test Spring Boot Actuator**

Spring Boot Actuator adds several other endpoints to our app


```
$ curl localhost:8080/actuator | jq .
{
  "_links": {
    "self": {
      "href": "http://localhost:8080/actuator",
      "templated": false
    },
    "health": {
      "href": "http://localhost:8080/actuator/health",
      "templated": false
    },
    "info": {
      "href": "http://localhost:8080/actuator/info",
      "templated": false
    }
}
```


Be sure to stop the Java process before continuing on or else you might get port binding issues since Java is using port `8080`



---



## 
**Containerize The App**

The first step in running the app on Kubernetes is producing a container for the app we can then deploy to Kubernetes



<p id="gdcalert1" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image1.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert2">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image1.png "image_tooltip")




---



### 
**Building A Container**



*   Spring Boot 2.3.x can build a container for you without the need for any additional plugins or files
*   To do this use the Spring Boot Build plugin goal `build-image`


```
$ ./mvnw spring-boot:build-image

```



*   Running `docker images` will allow you to see the built container


```
$ docker images
REPOSITORY                            TAG                 IMAGE ID            CREATED             SIZE
k8s-demo-app                          0.0.1-SNAPSHOT      ab449be57b9d        5 minutes ago       124MB
```




---



### 
**Run The Container**


```
$ docker run --name k8s-demo-app -p 8080:8080 k8s-demo-app:0.0.1-SNAPSHOT
```




---



### 
**Test The App Responds**


```
$ curl http://localhost:8080; echo
Hello World
```


Be sure to stop the docker container before continuing. You can stop the container and remove it by running `$ docker rm -f k8s-demo-app `



---



### 
**Putting The Container In A Registry**



*   Up until this point the container only lives on your machine
*   It is useful to instead place the container in a registry
    *   Allows others to use the container
*   [Docker Hub](https://hub.docker.com/) is a popular public registry
*   Private registries exist as well. In this lab you will be using a private registry on localhost.



---



### 
**Run The Build And Deploy The Container**



*   You should be able to run the Maven build and push the container to the local container registry


```
$ ./mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=localhost:5000/apps/demo
$ docker push localhost:5000/apps/demo

```



*   You can now see the image in the registry


```
$ curl localhost:5000/v2/_catalog
{"repositories":["apps/demo"]}
```




---



## 
**Deploying To Kubernetes**



*   With our container build and deployed to a registry you can now run this container on Kubernetes



---



### 
**Deployment Descriptor**



*   Kubernetes uses YAML files to provide a way of describing how the app will be deployed to the platform
*   You can write these by hand using the Kubernetes documentation as a reference
*   Or you can have Kubernetes generate it for you using kubectl
*   The `--dry-run` flag allows us to generate the YAML without actually deploying anything to Kubernetes


```
$ mkdir k8s
$ kubectl create deployment k8s-demo-app --image localhost:5000/apps/demo -o yaml --dry-run=client > k8s/deployment.yaml

```



*   The resulting `deployment.yaml` should look similar to this


```
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: k8s-demo-app
  name: k8s-demo-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: k8s-demo-app
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: k8s-demo-app
    spec:
      containers:
      - image: localhost:5000/apps/demo
        name: k8s-demo-app
        resources: {}
status: {}
```




---



### 
**Service Descriptor**



*   A service acts as a load balancer for the pod created by the deployment descriptor
*   If we want to be able to scale pods than we want to create a service for those pods


```
$ kubectl create service clusterip k8s-demo-app --tcp 80:8080 -o yaml --dry-run=client > k8s/service.yaml

```



*   The resulting `service.yaml` should look similar to this


```
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: k8s-demo-app
  name: k8s-demo-app
spec:
  ports:
  - name: 80-8080
    port: 80
    protocol: TCP
    targetPort: 8080
  selector:
    app: k8s-demo-app
  type: ClusterIP
status:
  loadBalancer: {}
```




---



### 
**Apply The Deployment and Service YAML**



*   The deployment and service descriptors have been created in the `/k8s` directory
*   Apply these to get everything running
*   If you have `watch` installed you can watch as the pods and services get created


```
$ watch -n 1 kubectl get all

```



*   In a separate terminal window run


```
$ kubectl apply -f ./k8s

Every 1.0s: kubectl get all                                 Ryans-MacBook-Pro.local: Wed Jan 29 17:23:28 2020

NAME                               READY   STATUS    RESTARTS   AGE
pod/k8s-demo-app-d6dd4c4d4-7t8q5   1/1     Running   0          68m

NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/k8s-demo-app   ClusterIP   10.100.200.243   <none>        80/TCP    68m

NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/k8s-demo-app   1/1     1            1           68m

NAME                                     DESIRED   CURRENT   READY   AGE
replicaset.apps/k8s-demo-app-d6dd4c4d4   1         1         1       68m
```


`watch` is a useful command line tool that you can install on [Linux](https://www.2daygeek.com/linux-watch-command-to-monitor-a-command/) and [OSX](https://osxdaily.com/2010/08/22/install-watch-command-on-os-x/). All it does is continuously executes the command you pass it. You can just run the `kubectl` command specified after the `watch` command but the output will be static as opposed to updating constantly.



---



### 
**Testing The App**



*   The service is assigned a cluster IP, which is only accessible from inside the cluster


```
NAME                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/k8s-demo-app   ClusterIP   10.100.200.243   <none>        80/TCP    68m

```



*   To access the app we can use `kubectl port-forward`


```
$ kubectl port-forward service/k8s-demo-app 8080:80

```



*   Now we can `curl` localhost:8080 and it will be forwarded to the service in the cluster


```
$ curl http://localhost:8080; echo
Hello World
```


**Congrats you have deployed your first app to Kubernetes 🎉**

[via GIPHY](https://giphy.com/gifs/day-subreddit-msKNSs8rmJ5m)

Be sure to stop the `kubectl port-forward` process before moving on



---



### 
**Exposing The Service**

NOTE: `LoadBalancer` features are platform specific. The visibility of your app after changing the service type might depend a lot on where it is deployed (e.g. per cloud provider).



*   If we want to expose the service publically we can change the service type to `LoadBalancer`

Open `k8s/service.yaml` and change `ClusterIp` to `LoadBalancer \
apiVersion: v1`


```
kind: Service
metadata:
  labels:
    app: k8s-demo-app
  name: k8s-demo-app
spec:
...
  type: LoadBalancer
...

```



*   

Now apply the updated `service.yaml \
$ kubectl apply -f ./k8s`



*   



---



### 
**Testing The Public LoadBalancer**



*   In a Cloud environment (Google, Amazon, Azure etc.), Kubernetes will assign the service an external ip
*   It may take a minute or so for Kubernetes to assign the service an external IP, until it is assigned you might see `&lt;pending>` in the `EXTERNAL-IP` column

For a local cluster we need to manually set the external IP address to the IP address of the Kubernetes node (the docker container running Kind in this case): \
`$ kubectl patch service k8s-demo-app -p '{"spec": {"type": "LoadBalancer", "externalIPs":["172.18.0.2"]}}'`



*   


```
$ kubectl get service k8s-demo-app -w
NAME           TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)        AGE
k8s-demo-app   LoadBalancer   10.100.200.243   172.18.0.2   80:31428/TCP   85m
$ curl http://172.18.0.2; echo
Hello World
```


The `-w` option of `kubectl` lets you watch a single Kubernetes resource.



---



## 
**Best Practices**


### 
**Liveness and Readiness Probes**



*   Kubernetes uses two probes to determine if the app is ready to accept traffic and whether the app is alive
*   If the readiness probe does not return a `200` no trafic will be routed to it
*   If the liveness probe does not return a `200` kubernetes will restart the Pod
*   Spring Boot has a build in set of endpoints from the [Actuator](https://spring.io/blog/2020/03/25/liveness-and-readiness-probes-with-spring-boot) module that fit nicely into these use cases
    *   The `/health/readiness` endpoint indicates if the application is healthy, this fits with the readiness proble
    *   The `/health/liveness` endpoint serves application info, we can use this to make sure the application is “alive”

The `/health/readiness` and `/health/liveness` endpoints are only available in Spring Boot 2.3.x. The`/health` and `/info` endpoints are reasonable starting points in earlier versions.



---



### 
**Enable The Actuator Probe Endpoints**

Open `application.properties` in `/src/main/resources` and add the following properties


```
management.endpoint.health.probes.enabled=true
management.health.livenessState.enabled=true
management.health.readinessState.enabled=true
```




---



### 
**Add The Readiness Probe**


```
apiVersion: apps/v1
kind: Deployment
metadata:
  ...
  name: k8s-demo-app
spec:
...
  template:
    ...
    spec:
      containers:
        ...
        readinessProbe:
          httpGet:
            port: 8080
            path: /actuator/health/readiness
```




---



### 
**Add The Liveness Probe**


```
apiVersion: apps/v1
kind: Deployment
metadata:
  ...
  name: k8s-demo-app
spec:
...
  template:
    ...
    spec:
      containers:
        ...
        livenessProbe:
          httpGet:
            port: 8080
            path: /actuator/health/liveness
```




---



### 
**Graceful Shutdown**



*   Due to the asynchronous way Kubnernetes shuts down applications there is a period of time when requests can be sent to the application while an application is being terminated.
*   To deal with this we can configure a pre-stop sleep to allow enough time for requests to stop being routed to the application before it is terminated.
*   Add a `preStop` command to the `podspec` of your `deployment.yaml`


```
apiVersion: apps/v1
kind: Deployment
metadata:
  ...
  name: k8s-demo-app
spec:
...
  template:
    ...
    spec:
      containers:
        ...
        lifecycle:
          preStop:
            exec:
              command: ["sh", "-c", "sleep 10"]
```




---



### 
**Handling In Flight Requests**



*   Our application could also be handling requests when it receives the notification that it need to shut down.
*   In order for us to finish processing those requests before the applicaiton shuts down we can configure a “grace period” in our Spring Boot applicaiton.
*   Open `application.properties` in `/src/main/resources` and add


```
server.shutdown=graceful
```


There is also a `spring.lifecycle.timeout-per-shutdown-phase` (default 30s).

`server.shutdown` is only available begining in Spring Boot 2.3.x



---
