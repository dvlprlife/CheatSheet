# Git

##  Table of Contents
1. [Set Global Username/Email Configuration](#set-global-usernameemail-configuration)
2. [Set Repository-Specific Username/Email Configuration](#set-repository-specific-usernameemail-configuration)
3. [Create Tag](#create-tag)
4. [Delete Tag](#delete-tag)
5. [List Tags](#list-tags)

***

### **Set Global Username/Email Configuration**
    git config –-global user.name “<your name>”
    git config –-global user.email “youremail@example.com”

### **Set Repository-Specific Username/Email Configuration**
    git config user.name  “<your name>”
    git config user.email “youremail@example.com”

     git config –-get user.email
     git config –-get user.name

### Log

#### Display Commit Log
    git log --pretty=oneline

#### Display Commit Information
    git show <commit id> (--stat)
### **Tags**
---
#### **Create Tag**
    git tag -a <tagname> -m <messge> <commit id>
    git tag -a v21.0.0.0 -m "App Version 21.0.0.0" 9dad5ec4d1d1de8438eda39fd5f6b6a4fdb25273

#### **Delete Tag**
    git tag -d <tagname>
    git tag -d v21.0.0.0

#### **List Tags**
    git tag -l

#### **Tag Commit**
    git tag -a <tagname> -m <messge> <checksum of commit>
