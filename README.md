[![ngrq123](https://circleci.com/gh/ngrq123/udacity-devops-project4.svg?style=svg)](https://circleci.com/gh/ngrq123/udacity-devops-project4)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment (Windows)

* Create a virtualenv `python -m venv .devops` and activate with `source .devops/Scripts/activate`
* Install `make` with Chocolatey `choco install make`
* Run `make install` to install the necessary dependencies
* [Install Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/)
* [Install Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [Install Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)

### Linting Dockerfile and Python code

* Install `hadolint` with scoop `scoop install hadolint`
* Run `make lint` to check Dockerfile using `hadolint` and `app.py` using `pylint` for any errors

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Making Predictions

With the application running, open another terminal window and run the bash script.
1. Standalone:  `./make_prediction_flask.sh`
2. Run in Docker:  `./make_prediction.sh <IP address>`
   * To find out the IP address of the virtual machine, run `docker-machine ls`
3. Run in Kubernetes:  `./make_prediction.sh localhost`

### Docker Steps

`Dockerfile` includes instructions to build the Docker image.
* To build and run the container, run `./run_docker.sh` - the application will be running on port `8000`
* `./upload_docker.sh` is used to automate uploading of the Docker container to my Docker Hub account
* To stop the application, run `docker stop <CONTAINER ID>`
  * Container ID can be found from `docker ps -a`
* To delete the application, run `docker rm <CONTAINER ID>`
* To delete the Docker image, run `docker rmi <IMAGE ID>`
  * Image ID can be found from `docker images`

### Kubernetes Steps

* [Setup and Configure Docker locally](#installing-docker)
* [Setup and Configure Kubernetes locally](#installing-kubernetes-and-minikube)
* [Create Flask app in Container](#docker-steps)
* Run `minikube start` to set up and run a local Kubernetes cluster 
* Run via kubectl: `./run_kubenetes.sh`
* Run `kubectl get pods --all-namespaces` after a few minutes to check if the pod's status is `Running` - the application runs on port `8000`
* To save the cluster state, run `minikube stop`
* To delete the cluster, run `minikube delete`

### CircleCI

* CircleCI pipeline configuration can be found in `.circleci/config.yml` to automate dependencies installation and linting for all commits
* Status badge indicating the test result can be found at the top of this `README.md` file