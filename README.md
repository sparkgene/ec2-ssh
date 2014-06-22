ec2-ssh
=======

ssh login command for Amazon EC2.
ec2-ssh shows instance list using percol.
By selecting from the list, you can be logged in with SSH

![alt tag](https://raw.github.com/sparkgene/ec2-ssh/master/movie.gif)

## Installation

### percol
 
First, install [percol](https://github.com/mooz/percol)

### aws cli

ec2-ssh use aws cli.

The security credentials must be configured.
http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html

### Manual

#### clone repository

    $ git clone git://github.com/sparkgene/ec2-ssh.git

#### fix paths and ssh keys

    $ vi ec2-ssh/bash_func

* EC2SSH_ROOT: path to ecs-ssh directory
* EC2SSH_KEY: path to ssh key
* EC2SSH_USER: ssh user name

#### add comand to include ec2-ssh/bash_func

    $ vi ~/.bashrc

    # add file include
    source /path/to/ec2-ssh/bash_func

reload bashrc

    $ source ~/.bashrc

## Usage

ec2-ssh vpc id

## Limitation

ec2-ssh is assumes be used on VPC.
Instances Name(Tags) is required.
