># CICD 

# Softwares Required 
> **Note:**
>* Git For windows 
>* Bit Bucket Account/GitHub Enterprise / GitHub Account 
>* Internet Access 
* Windows Command Line / GitBash Command line 

# Devops CAMS Model 
* Culture 
* Automation 
* Monitoring 
* Sharing 


## Creating a bit bucket account. 

* If you already have an account, skip this section and go to the next. You can create an account with the standard sign up or you can create one through OpenID (using an existing Google or Yahoo account for example). Regardless of which sign on method you use, you must supply the following fields


## Steps to open a bitbucket account 
1. Open https://bitbucket.org/account/signup/ in your browser.

Create a Git repository
As our new Bitbucket space station administrator, you need to be organized. When you make files for your space station, you’ll want to keep them in one place and shareable with teammates, no matter where they are in the universe. With Bitbucket, that means adding everything to a repository. Let’s create one!

Some fun facts about repositories

You have access to all files in your local repository, whether you are working on one file or multiple files.
You can view public repositories without a Bitbucket account if you have the URL for that repository.
Each repository belongs to a user account or a team. In the case of a user account, that user owns the repository. + In the case of a team, that team owns it.
The repository owner is the only person who can delete the repository. If the repository belongs to a team, an admin can delete the repository.
A code project can consist of multiple repositories across multiple accounts but can also be a single repository from a single account.
Each repository has a 2 GB size limit, but we recommend keeping your repository no larger than 1 GB.
Step 1. Create the repository
Initially, the repository you create in Bitbucket is going to be empty without any code in it. That's okay because you will start adding some files to it soon. This Bitbucket repository will be the central repository for your files, which means that others can access that repository if you give them permission. After creating a repository, you'll copy a version to your local system—that way you can update it from one repo, then transfer those changes to the other.

>![GitRepo](https://wac-cdn.atlassian.com/dam/jcr:a226d62e-3f0f-4c7e-8d99-c3c73188f9f6/01.svg?cdnVersion=1716)  

# Do the following to create your repository

1. From Bitbucket, click the + icon in the global sidebar and select Repository
>    ![](https://wac-cdn.atlassian.com/dam/jcr:bd8f6b7c-f3ad-43c2-b178-7e72e5b3c768/bbc_globalsidebar_create_repo.png)


2. Bitbucket displays the Create a new repository page. Take some time to review the dialog's contents. With the exception of the Repository type, everything you enter on this page you can later change.

![Repo](https://wac-cdn.atlassian.com/dam/jcr:a7ae8cb6-c567-45d0-a560-2c64c985be87/03.png)


3. Enter BitbucketStationLocations for the Name field. Bitbucket uses this Name in the URL of the repository. For example, if the user the_best has a repository called awesome_repo, the URL for that repository would be https://bitbucket.org/db/gradsrepo.


4. For Access level, leave the This is a private repository box checked. A private repository is only visible to you and those you give access to. If this box is unchecked, everyone can see your repository.

5. Pick Git for the Repository type. Keep in mind that you can't change the repository type after you click Create repository.

6. Click Create repository. Bitbucket creates your repository and displays its Overview page


# Step 2. Explore your new repository
Take some time to explore the repository you have just created. You should be on the repository's Overview page:

>![NewRepo](https://wac-cdn.atlassian.com/dam/jcr:8c475d77-935d-4f3a-bf86-3f0e3dee9d00/explore_repository_gif.gif?cdnVersion=1716)


Click + from the global sidebar for common actions for a repository. Click items in the navigation sidebar to see what's behind each one, including Settings to update repository details and other settings. To view the shortcuts available to navigate these items, press the ? key on your keyboard.

When you click the Commits option in the sidebar, you find that you have no commits because you have not created any content for your repository. Your repository is private and you have not invited anyone to the repository, so the only person who can create or edit the repository's content right now is you, the repository owner.


# Copy your Git repository and add files
Now that you have a place to add and share your space station files, you need a way to get to it from your local system. To set that up, you want to copy the Bitbucket repository to your system. Git refers to copying a repository as "cloning" it. When you clone a repository, you create a connection between the Bitbucket server (which Git knows as origin) and your local system. 

>![](https://wac-cdn.atlassian.com/dam/jcr:a4d2c201-3486-4f2b-81a9-8ab6b663c9b9/01.svg?cdnVersion=1716)


# Step 1. Clone your repository to your local system
Open a browser and a terminal window from your desktop. After opening the terminal window, do the following:

Navigate to your home (~) directory

~~~powershell
cd examples 
mkdir myrepo 
git clone https://nileshdevdas@bitbucket.org/db/examples.git

Cloning into 'dbexamples'...


~~~



# Step 2. Add a file to your local repository and put it on Bitbucket
With the repository on your local system, it's time to get to work. You want to start keeping track of all your space station locations. To do so, let's create a file about all your locations.

Go to your terminal window and navigate to the top level of your local repository.

~~~powershell
cd ~/myrep/dbexamples/
echo "Test me the sample" >> newfile.txt
git status 
 On branch main
 Initial commit
 Untracked files:
   (use "git add <file>..." to include in what will be committed)
     locations.txt
 nothing added to commit but untracked files present (use "git add" to track)
~~~

The file is untracked, meaning that Git sees a file not part of a previous commit. The status output also shows you the next step: adding the file.

Tell Git to track your new locations.txt file using the git add command. Just like when you created a file, the git add command doesn't return anything when you enter it correctly.


~~~powershell                          
git add locations.txt
~~~

The git add command moves changes from the working directory to the Git staging area. The staging area is where you prepare a snapshot of a set of changes before committing them to the official history.

>![](https://wac-cdn.atlassian.com/dam/jcr:dbf0c59f-848d-4814-bfd5-6b190a092963/03.svg)


Check the status of the file.

~~~powershell
$ git status 
 On branch main
 Initial commit
 Changes to be committed:
   (use "git rm --cached <file>..." to unstage)
     new file: locations.txt
~~~

Now you can see the new file has been added (staged) and you can commit it when you are ready. The git status command displays the state of the working directory and the staged snapshot.

Issue the git commit command with a commit message, as shown on the next line. The -m indicates that a commit message follows.

~~~powershell
git commit -m 'Initial commit' 
 [main (root-commit) fedc3d3] Initial commit
  1 file changed, 1 insertion(+)
~~~

  create mode 100644 locations.txt
The git commit takes the staged snapshot and commits it to the project history. Combined with git add, this process defines the basic workflow for all Git users.

>![statging](https://wac-cdn.atlassian.com/dam/jcr:d5f60ca0-b606-4e7c-b3a2-430165bc0672/04.svg)


Up until this point, everything you have done is on your local system and invisible to your Bitbucket repository until you push those changes.

Learn a bit more about Git and remote repositories

Git's ability to communicate with remote repositories (in your case, Bitbucket is the remote repository) is the foundation of every Git-based collaboration workflow.

Git's collaboration model gives every developer their own copy of the repository, complete with its own local history and branch structure. Users typically need to share a series of commits rather than a single changeset. Instead of committing a changeset from a working copy to the central repository, Git lets you share entire branches between repositories.


>![](https://wac-cdn.atlassian.com/dam/jcr:c24540ba-3f2b-4697-9fd3-91242f5ac5f2/05.svg)
You manage connections with other repositories and publish local history by "pushing" branches to other repositories. You see what others have contributed by "pulling" branches into your local repository.


~~~powershell
git push origin main 
 Counting objects: 3, done.
 Writing objects: 100% (3/3), 253 bytes | 0 bytes/s, done.
 Total 3 (delta 0), reused 0 (delta 0) 
  * [new branch] main -> main
 Branch main set up to track remote branch main from origin.
~~~



# Jenkins Pipeline Tutorial


## Table of Contents

- [Jenkins Pipeline Tutorial](#jenkins-pipeline-tutorial)
    - [Table of Contents](#table-of-contents)
    - [Prerequisites](#prerequisites)
    - [Forking the Repository](#forking-the-repository)
    - [Preparing the Deployment Environment](#preparing-the-deployment-environment)
        - [Preparing Jenkins](#preparing-jenkins)
        - [Create an GCP Instance](#create-an-ec2-instance)
        - [Install Jenkins](#install-jenkins)
        - [Install Git and Docker on the Jenkins Instance](#install-git-and-docker-on-the-jenkins-instance)
        - [Run the Jenkins Setup Wizard](#run-the-jenkins-setup-wizard)
    - [Creating the Pipeline](#creating-the-pipeline)
    - [Configuring the Pipeline](#configuring-the-pipeline)
        - [Looking at the Sample Pipeline](#looking-at-the-sample-pipeline)
        - [Running the Pipeline](#running-the-pipeline)
        - [Adding a CI Stage](#adding-a-ci-stage)
        - [Adding a CD Stage](#adding-a-cd-stage)
    - [Testing the Pipeline](#testing-the-pipeline)
    - [Cleaning Up](#cleaning-up)

## Prerequisites


## Forking the Repository

You will have to push changes to Github in order to trigger the CI/CD pipeline. Therefore, before
going any further in this tutorial, **fork this repository** and work on your own fork from now on.
If you have never forked a repository, [this][10] might help.

## Preparing Jenkins


### Install Jenkins

> **Note:** If you've deployed Jenkins from a pre-configured AMI, go directly to
> [Run the Jenkins Setup Wizard](#run-the-jenkins-setup-wizard).

1. SSH into the instance you created in the previous step.
2. Run the following commands to install Jenkins:

        sudo yum remove -y java
        sudo yum install -y java-1.8.0-openjdk
        yum install wget -y
        sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
        sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
        sudo yum install -y jenkins
        
        
   #  vi   /usr/lib/systemd/system/jenkins.service ; over here give jenkins the rrot previliges

3. Run `sudo service jenkins start` to start the Jenkins service.

### Install Git and Docker on the Jenkins Instance

1. SSH into the Jenkins instance if you are not already there.
2. Run the following commands on the Jenkins instance:

     Install docker latest version : https://docs.docker.com/engine/install/centos/
    
        sudo service jenkins restart

give aws instance an admin role so it can discover ecs and other services 
### Run the Jenkins Setup Wizard

1. Browse `http://<instance_ip>:8080`.
2. Under **Administrator password** enter the output of `sudo cat /var/lib/jenkins/secrets/initialAdminPassword` on the Jenkins instance.
3. Click **Continue**.
4. Click **Install suggested plugins** and let the installation finish.
5. Click **Continue as admin**.
6. Click **Start using Jenkins**.






## Creating the Pipeline

We will now create the Jenkins pipeline. Perform the following steps on the Jenkins UI:

1. Click **New Item** to create a new Jenkins job.
2. Under **Enter an item name** type "sample-pipeline".
3. Choose **Pipeline** as the job type and click **OK**.
4. Under **Pipeline -> Definition** choose **Pipeline script from SCM**.
5. Under **SCM** choose **Git**.
6. Under **Repository URL** paste the [HTTPS URL][9] of your (forked) repository.

> **NOTE:** It is generally recommended to use Git **over SSH** rather than HTTPS, especially in
> automated processes. However, to simplify things and since the repository is public, we can
> simply use the HTTPS URL instead of dealing with SSH keys.

7. Leave the rest at the default and click **Save**.

You should now have a pipeline configured. When executing the pipeline, Jenkins will clone the Git
repository, look for a file named `Jenkinsfile` at its root and execute the instructions in it.

## Configuring the Pipeline

The Jenkins Pipeline plugin supports two types of piplines: **declarative pipelines** and
**scripted pipelines**. Declarative pipelines are simpler and have a nice, clean syntax. Scripted
pipelines, on the other hand, offer unlimited flexibility by exposing the full power of the
[Groovy][11] programming language in the pipeline.

In this tutorial we will use the **declarative syntax**, which is more than enough for what we are
trying to accomplish.

### Looking at the Sample Pipeline

Let's take a look at the sample pipeline that is already in the repository. Open the file called
`Jenkinsfile` file in a text editor (preferably one [which][12] [supports][13] the Jenkinsfile
syntax).

We can see that the entire pipeline is inside a top-level directive called `pipeline`.

Then we have a line saying `agent any` - this is required for declarative pipelines, but we are not
going to touch it in this tutorial. If you are still curious about what the agent directive does,
you can read about it [here][15].

Next we have the `environment` directive. This section allows us to configure global variables
which will be available (for both reading and writing) in any of the pipeline's stages. This is
useful for configuring global settings.

Lastly, we have a `stage`. You can have as many stages as you want in a pipeline. A stage is a
major section of the pipeline and it contains the actual "work" which the pipeline does. This work
is defined in `steps`. A step can execute a shell script, push an artifact somewhere, send an email
or a Slack message to someone and do lots of other stuff. We can see that at the moment our
pipeline doesn't do much, just prints something to the console using an `echo` step.

> **NOTE:** There is [an entire list][16] of step types which can be used in Jenknis pipelines,
> however in this tutorial we will keep things simple and use mostly the `sh` step, which executes
> a shell script.

So, now that we understand the structure of our pipeline, let's run it.

### Running the Pipeline

1. From the top-level view on the Jenkins UI, click on the pipeline's name ("sample-pipeline").
2. On the menu to the left, click **Build Now**.

This will trigger a run. You should see a new run (or "build") under the **Build History** view on
on the left side. To see the logs from the build, click the build number (`#1` if this is your
first build) and the click **Console Output**.

If all went well, after some Git-related output you should see that the pipeline ran the only stage
we currently have, which should simply print `This is a sample stage`.

Great. Now let's make the pipeline do some real stuff.

### Adding a CI Stage

Let's add a simple CI step to our pipeline. We want to build a Docker image from our app and push
it to GCR so that we can later deploy containers from it.

Let's populate the `docker_repo_uri` environment variable with the full URI of the ECR repository
you created previously. It shall be similar to the following:

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
Notice that we have two types of steps here: `script` and `sh`. `script` steps allow us to run a
Groovy code snippet inside our declarative pipeline. We need this because we want to capture the
SHA1 of the current commit and assign it to a variable, which we can then use to uniquely tag the
Docker image we are building. `sh` steps are simply shell commands.

So now our pipeline should build a Docker image, push it to ECR and clean up the leftover image so
that we don't accumulate garbage on Jenkins.

In order to update the pipeline, we must commit and push our changes to Github. So, when you are
done editing, do the following:

1. Commit your changes by running `git commit -am "Add CI step to pipeline"`.
2. Push your changes to Github by running `git push origin`.

Now, re-run the pipeline on Jenkins and examine its output. If all goes well, the pipeline will
build a Docker image, push it to GCR and clean up the local image on Jenkins.


Type of environments :- 

* Local
* Development 
* Integration
* Testing/QC 
* UAT 
* Pre-Prod 
* Performance Testing 
* Production 
