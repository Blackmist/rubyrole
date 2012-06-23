This is a simple scaffold for packaging a Ruby app to run on Windows Azure, inspired by Steve Marx's <https://github.com/smarx/pythonrole>. It allows you to host a Ruby application in a Windows Azure Cloud Service.

#Prerequisites

This sample requires a Windows operating system and at least version 1.7 of the
Windows Azure SDK (available at <http://www.windowsazure.com/en-us/develop/overview/>). 
This sample will work with the [Windows Azure Other SDK], but if you install the Windows Azure PowerShell cmdlets (they come in the [Windows Azure Node.js SDK] or [Windows Azure PHP SDK]) you can use the (much more feature-filled) PowerShell cmdlets.

#General Usage

1. Edit `app.rb` to do whatever you want. If this is a web app, be sure to listen on the port specified in the `PORT` environment variable (and for best results when running locally, listen on the IP address specified in the `ADDRESS` environment variable.)

2. By default, the package will download RailsInstaller when the Cloud Service starts up in Windows Azure, but this can take a really long time to download. If you don't mind increasing deployment package size, you can download RailsInstaller ahead of time and save it as **railsinstaller.exe** in the **WorkerRole** directory, and that will be used to install Ruby into the environment. Little bit longer on the upload, but shaves time off the startup of the service environment.

#'Other' SDK

The 'other' SDK is a very bare-bones set of tools that let you package and deploy a cloud service, as well as run it in the local emulator. There are two files included in the root of this project that facilitate these operations; **run.cmd** and **pack.cmd**.

* Run `run.cmd` to build and run the application locally in the emulator. When running locally, ruby.exe must be in the path. (It is not automatically
installed as it is in the cloud.)

* Run `pack.cmd` to output `RubyRole.cspkg`. That file, along with
`ServiceConfiguration.Cloud.cscfg` is what you need to deploy via the Windows Azure portal (or with some other tool) to get the app running in the cloud.

#Windows Azure PowerShell

The Windows Azure PowerShell comes with both the [Windows Azure Node.js SDK] and [Windows Azure PHP SDK], and provides a lot of features beyond what you get in the 'other' SDK. Such as:

* Publish-AzureServiceProject - packs and publishes the deployment to a cloud service from the command line

* Start-AzureEmulator - packs and runs the deployment in the emulator

* Stop-AzureEmulator - stops the emulator

* Stop-AzureService - stops a deployed cloud service

* Enable-AzureServiceProjectRemoteDesktop - enables remote desktop on your cloud service

For more information on Windows Azure PowerShell, see [How to use the Windows Azure PowerShell Cmdlets].

#Notes

* This sample uses the Ruby package provuded at <http://railsinstaller.org>. This is installed using the `installRuby.cmd` file.

* `installDependencies.cmd` installs the bundler gem and then uses it to install the gems listed in the Gemfile in the app folder.

* The `run.cmd` in the WorkerRole/app directory launches `app.rb` by running `ruby app.rb`. If you need to launch a Rails application, or by using `rackup`, you may need to use the following format: `call rails ....` or `call rackup ....`. The CALL command must be used for anything that is implemented as a .cmd or .bat file under windows.

[Windows Azure Other SDK]: https://www.windowsazure.com/en-us/develop/other/
[Windows Azure Node.js SDK]: http://go.microsoft.com/fwlink/?LinkId=254279&clcid=0x409
[Windows Azure PHP SDK]: http://go.microsoft.com/fwlink/?LinkId=254280&clcid=0x409
[How to use the Windows Azure PowerShell Cmdlets]: https://www.windowsazure.com/en-us/develop/php/how-to-guides/powershell-cmdlets/