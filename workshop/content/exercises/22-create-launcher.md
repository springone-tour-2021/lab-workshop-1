
The other option is to set up a launcher that attaches to the remote process. This will work for any remote process (doesn’t have to be running in Kubernetes).



*   On the left hand side of the IDE tab, click the Run/Debug icon
*   Click the `create launch.json file`


![alt_text](images/image4.png "image_tooltip")




*   The IDE will create a default launch configuration for the current file and for `K8sDemoAppApplication`
*   Add another configuration for remote debugging


```editor:insert-lines-before-line
file: ~/.vscode/launch.json
line: 7
text: |
        {
            "type": "java",
            "name": "Debug (Attach)",
            "request": "attach",
            "hostName": "localhost",
            "port": 5005
        },
}

```

Now select the `Debug (Attached)` option from the drop down and click the Run button

This should attach the debugger to the remote port

![alt_text](images/image5.png "image_tooltip")


Be sure to detach the debugger and kill the `skaffold` process before continuing
```terminal:interrupt
session: 1
```



---
