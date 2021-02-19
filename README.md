LAB - Spring on Kubernetes
=====================

Sample workshop content using Markdown formatting for pages.

For more detailed information on how to create and deploy workshops, consult
the documentation for eduk8s at:

* https://docs.eduk8s.io

If you already have the eduk8s operator installed and configured, as well as having this repo cloned to deploy
and view this sample workshop, run:

```
kubectl apply -f ./resources/workshop.yaml
kubectl apply -f ./resources/training-portal.yaml
```

This will deploy a training portal hosting just this workshop. To get the
URL for accessing the training portal run:

```
kubectl get trainingportal/lab-st-test
```

The training portal is configured to allow anonymous access. For your own
workshop content you should consider removing anonymous access.
