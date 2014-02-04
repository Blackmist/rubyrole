This is a simple scaffold for packaging a Ruby app to run on Windows Azure, inspired by Steve Marx's <https://github.com/smarx/pythonrole>. It allows you to host a Ruby application in a Windows Azure Cloud Service.

##Prerequisites

This sample requires a Windows operating system and the Windows Azure PowerShell cmdlets. To install and configure Windows Azure PowerShell, see [How to install and configure Windows Azure PowerShell](http://www.windowsazure.com/en-us/documentation/articles/install-configure-powershell/).

The Windows Azure PowerShell provides:

* Publish-AzureServiceProject - packs and publishes the deployment to a cloud service from the command line

* Start-AzureEmulator - packs and runs the deployment in the emulator

* Stop-AzureEmulator - stops the emulator

* Stop-AzureService - stops a deployed cloud service

* Enable-AzureServiceProjectRemoteDesktop - enables remote desktop on your cloud service

For more information on Windows Azure PowerShell, see [the Windows Azure Scripting Center](http://www.windowsazure.com/en-us/documentation/scripts/).

##General Usage

1. Edit `app.rb` to do whatever you want. If this is a web app, be sure to listen on the port specified in the `PORT` environment variable (and for best results when running locally, listen on the IP address specified in the `ADDRESS` environment variable.)

2. By default, the package will download RailsInstaller when the Cloud Service starts up in Windows Azure, but this can take a really long time to download. If you don't mind increasing deployment package size, you can download RailsInstaller ahead of time and save it as **railsinstaller.exe** in the **WorkerRole** directory, then modify run.cmd to comment out the download step. Little bit longer on the upload, but shaves time off the startup of the service environment.

3. Test the application locally by using `start-azureemulator` from inside the project directory, then going to the address (it will return the address and port at the end of the command,) to verify that it works.

4. Stop the emulator by using `stop-azureemulator`.

5. Publish to Windows azure by using the `publish-azureserviceproject` command. For example:

    `publish-azureserviceproject -servicename myrubyapp -location "East US" -slot Production`

    This will publish the project to a new cloud service named 'myrubyapp' in the East US region data center. It will be placed in a production slot, so the DNS name will be myrubyapp.cloudapp.net. If you deploy to a staging slot, the DNS will be <random-guid>.cloudapp.net.

After deployment completes, and after the cloud service starts, downloads and installs Ruby & required gems, you should be able to access the DNS address from your web browser to verify the application is running.

##Troubleshooting

If something goes wrong and the application doesn't start, you can enable remote desktop to the application by using the `enable-azureserviceprojectremotedesktop` command, then republish the application. You can then use Remote Desktop to connect to an instance of the cloud service, verify that Ruby was installed, gems are installed, errors in the event log, etc.



