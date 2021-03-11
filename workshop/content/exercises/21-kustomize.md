

So far, we have deployed our application to a single Kubernetes environment. Most likely, we would want to deploy it to several environments (e.g. dev, test, prod). We could create separate Kubernetes deployment manifests for each environment, or we could look to tools to help de-duplicate and manage environment-specific differences in our configuration. 

In this section we will look at one such tool: [Kustomize](https://kustomize.io/) allows us to customize deployments to different environments.

We can start with a base set of resources and then apply customizations on top of those.

Features
* Allows easier deployments to different environments/providers
* Allows you to keep all the common properties in one place
* Generate configuration for specific environments
* No templates, no placeholder spaghetti, no environment variable overload



---

