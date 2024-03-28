# SWIGGY-CLONE-PROJECT
#########################################

Name -- Yatin Gambhir

Date -- 28/03/2024

Topic -- Swiggy Clone using Jenkins CI/CD

##########################################


Step 1  - Launch a Virtual Machine on any of the cloud providers (AWS, Azure, or GCP), and install the below tools:

`Docker (for deployment)`

`Jenkins (for ci/cd and automation)`

`Trivy (for image scanning)`

`Nginx (for reverse proxy, optional)`

Step 2 - Once you have installed the above tools and configured them write the below commands in the terminal and add the sonarqube server using docker:

`sudo chown $USER /var/run/docker.sock`

`sudo usermod -aG docker jenkins`

`sudo systemctl restart jenkins`

`docker run -d --name sonarqube -p 9000:9000 sonarqube:lts-community (open port 9000)`

Step 3 - After all this add the necessary plugins in Jenkins and install automatically the tools in the Manage Jenkins section using the official website:

`Eclips Termium Installer (for JAVA JDK)`

`Sonarqube Scanner (for code scanning)`

`Nodejs plugin`

`Docker, Docker commons, Docker pipeline, Docker API`

Step 4 - For adding the credentials, generate the token for Sonarqube and Dockerhub (where your image will be pushed for deployment) and add them in the credentials section of Manage Jenkins :

`Token of Sonarqube`

`Token of Dockerhub`

Step 5 - Add the webhook to trigger the pipeline whenever any new commit occurs and the sonarqube scanning will be tested again:

`Add webhook to GitHub (http://public-ip:8080/github-webhook)`

`Add webhook to sonarqube (http://public-ip:8080/sonarqube-webhook)`

Step 6 - Now create a new job with Pipeline as the project style and add the GitHub repository URL where your code, Jenkinsfile, and the Dockerfile are present with the specified branch.

Step 7 - At this final step build the pipeline, once your pipeline build is successful you can view the website by copying the Public IP of the VM with the port on which your application is exposed.

Step 8 - TERMINATE ALL THE RESOURCES AFTER YOUR WORK IS COMPLETED TO STOP INCURRING ANY CHARGES

MAKE THE NECESSARY CHANGES IN THE JENKINSFILE ACCORDING TO YOUR PREFERENCE (LIKE THE NAME OF SONARQUBE PROJECT AND KEY, NAME OF TOOLS, GITHUB REPO URL & MORE).


