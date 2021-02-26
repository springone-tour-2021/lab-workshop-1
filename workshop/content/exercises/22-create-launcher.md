
The other option is to set up a launcher that attaches to the remote process. This will work for any remote process (doesn’t have to be running in Kubernetes).



*   On the left hand side of the IDE tab, click the Run/Debug icon
*   Click the `create launch.json file`



<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image4.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image4.png "image_tooltip")




*   The IDE will create a default launch configuration for the current file and for `K8sDemoAppApplication`
*   Add another configuration for remote debugging


```
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "java",
            "name": "Debug (Attach)",
            "request": "attach",
            "hostName": "localhost",
            "port": 5005
        },
        {
            "type": "java",
            "name": "Debug (Launch) - Current File",
            "request": "launch",
            "mainClass": "${file}"
        },
        {
            "type": "java",
            "name": "Debug (Launch)-K8sDemoAppApplication<k8s-demo-app>",
            "request": "launch",
            "mainClass": "com.example.demo.K8sDemoAppApplication",
            "projectName": "k8s-demo-app"
        }
    ]
}

```

*   Now select the `Debug (Attached)` option from the drop down and click the Run button
*   This should attach the debugger to the remot port



<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/image5.png). Store image on your image server and adjust path/filename/extension if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/image5.png "image_tooltip")


Be sure to detach the debugger and kill the `skaffold` process before continuing



---
