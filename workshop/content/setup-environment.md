## Before you begin ...

#### Workshop Command Execution
The workshop uses these action blocks for various purposes. Anytime you see such a block with an icon on the right hand side, you can click on it and it will perform the listed action for you.

> When clicking through make sure to wait a second or two for the action to execute before proceeding to the next command or the workshop might not behave as expected.

#### Workshop Terminals
Two terminals are included in this workshop, you will mainly use terminal 1, but sometimes a process might occupy it so you can use terminal 2 .

You can try an action block bellow
```execute-1
echo "Hi I'm terminal 1"
```
```execute-2
echo "Hi I'm terminal 2"
```
#### Workshop Code Editor
The workshop features a built in code editor you can use by pressing the `Editor` tab button. Pressing the refresh button in the workshop's UI can help the editor load when switching tabs. The files in this editor automatically 
save.


The editor takes a few moments to load, please select the **Editor** tab now to display it, or click on the action block below.

```dashboard:open-dashboard
name: Editor
```

#### Workshop Console (Ocant)
You will have the ability to inspect your Kubernetes cluster with Octant, an open source developer-centric web interface for Kubernetes that lets you inspect a Kubernetes cluster and its applications.

Feel free to look at this tab or click the command bellow.

```dashboard:open-dashboard
name: Console
```