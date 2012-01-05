This is a simple scaffold for packaging a Ruby app to run on Windows Azure, inspired by Steve Marx's <https://github.com/smarx/pythonrole>.

Prerequisites
=============
This sample requires a Windows operating system and at least version 1.6 of the
Windows Azure SDK (available at <http://www.windowsazure.com/en-us/develop/overview/>). 
This sample was devoloped using the `Other` language version of the SDK, but should work with all language versions.

Usage
=====

1. Edit `app.rb` to do whatever you want. If this is a web app, be sure to listen on the port
specified in the `PORT` environment variable (and for best results when running
locally, listen on the IP address specified in the `ADDRESS` environment
variable.
2. Run `run.cmd` to build and run the application locally. When
running locally, ruby.exe must be in the path. (It is not automatically
installed as it is in the cloud.)
3. Run `pack.cmd` to output `PackAndRun.cspkg`. That file, along with
`ServiceConfiguration.cscfg` is what you need to deploy via the Windows Azure
portal (or with some other tool) to get the app running in the cloud.

Notes
=====

* This sample uses the Ruby 1.9.3 package provuded at <http://rubyinstaller.org>. This is installed using the `installRuby.cmd` file.
* DevKit is also installed and configured using the `installDK.cmd` file.
* `installDependencies.cmd` installs the bundler gem and then uses it to install the gems listed in the Gemfile.
* The `run.cmd` in the WorkerRole/app directory launches `app.rb` by running `ruby app.rb`. If you need to launch a Rails application, or by using `rackup`, you may need to use the following format: `call rails ....` or `call rackup ....`. The CALL command must be used for anything that is implemented as a .cmd or .bat file under windows.