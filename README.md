Simbolica
=========

Simbolica is an automatic tool to upload your iOS DSYMs to other location.

Currently it only support builds from Ship.io and uploads to Parse

Installing
----------

First of all, you need a server that you have access to shell

* Intall Ruby 2
* Install [Parse CLI](https://parse.com/docs/cloud_code_guide)
* gem install bundler
* Install Git
* Clone this project

And your are ready to go.

Configuring Simbolica
---------------------

```
cd simbolica
bundle install
cd applications
parse new FOLDER_NAME (enter your parse credentials and select your App from the list.)
cd ..
foreman start
```

Ok now the server is running on [localhost:9669](localhost:9669)

Configuring your sender
-----------------------

Now you need to setup a Webhook on your CI to the Simbolica server, like this:

http://SimbolicaServerDomain.org:9669/job-receiver/from/shipio/to/parse?folder_name=FOLDER_NAME

Remember: You have to put the same FOLDER_NAME on parse new command and folder_name URL param.

And it's done, now your app will be symbolicated automatically on Parse Crash
Analytics.

How to contribute
-----------------

* Clone this project
* Add your feature
* Open a Pull Request.

It would be awesome if we start to support other CIs like Jenkins, Travis, etc..
and services, like [Crashlytics](https://try.crashlytics.com/).