# Axi Assessment

The Powershell script is located on `.\Deploy.ps1`.
This contains the steps in building the docker image, running it on a container, and pushing the image to the docker registry.

We also have the `Dockerfile` where the application will be built and tests will be ran.

## Pre-requisite

Ensure you have the following installed in your system:
- Docker
- Git
- .NET SDK vesion 3.1 or latest

## Instruction

1. On your local machine, pull the Git repository found here: https://github.com/ChessDP/super-service
2. Open the repository in an IDE or a terminal.
3. Under the `devops` folder, run `.\Deploy.ps1` on the terminal.
4. You can check the image by runnung the command, `docker image ls `.

## Bonus

If you want to run the docker image in an orchestration like k8s, install `minikube` and do the following:

1. Run the minikube cluster with the command `minikube start`.
2. K8s uses the default namespace which is `default`. If you want to create another namespace, run `kubectl create ns axi`.
3. Deploy the docker image `kubectl create deployment super-service --image=chessdp/super-service-test --namespace=axi --replicas=3`.
4. Monitor the pods being created `kubectl -n axi get po`. You'll see 3 instances as we created 3 replicas.