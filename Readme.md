# Uno Quick Start
This repository is a basic sample for an [Uno](http://platform.uno/) application which cross-targets UWP, iOS, Android and WebAssembly.

Use the Visual Studio's UWP tooling on Windows, such as 
[Xaml Edit and Continue](https://blogs.msdn.microsoft.com/visualstudio/2016/04/06/ui-development-made-easier-with-xaml-edit-continue/), C# Edit 
and Continue, then run your app on iOS, Android and Windows.

You can also [try out the experimental WebAssembly Playground in your browser](http://platform.uno/Playground/index.html).

[![Open Uno in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/unoplatform/uno.quickstart) 

## Develop in GitPod
* Open this repository in [GitPod](https://gitpod.io/#https://github.com/unoplatform/uno.quickstart)
* In the tab named `XAML Hot Reload server`, run `build/gitpod/serve-remote-control.sh`
* In the tab named `SampleApp Static Files Server`, run `build/gitpod/serve-sampleapp-wasm.sh`
* The Live Preview window will open with the running application.
* To change some XAML content:
	* Open the `src/MyApp.Shared/MainPage.xaml`
	* Make some changes, such as `Hello, world!` to `Hello, Uno!`
	* Hit `Ctrl+S`, see that the live preview has changed !
* To change some C# code:
	* Open the `src/MyApp.Shared/MainPage.xaml`
	* After the `TextBlock` definition add the `x:Name="myTextBlock"` attribute:
	```xaml
	<TextBlock x:Name="myTextBlock" Text="Hello, world!" Margin="20" FontSize="30" />
	```
	* Save the file
	* Open the `src/MyApp.Shared/MainPage.xaml.cs`
	* Immediately after `this.InitializeComponent();`, add the following:
	```csharp
	myTextBlock.Text = DateTime.Now.ToString();
	```
	* Save the file
	* Select the tab named `Build`, and type `build/gitpod/build-wasm.sh`
	* Refresh the Live Preview using the small refresh icon (not the full browser tab)
	* Time is showing !

## Develop in Visual Studio

### Prerequisites
* Visual Studio 2017 15.5 or later, with :
	* Xamarin component, with the iOS Remote Simulator installed
	* A working Mac with Visual Studio for Mac, XCode 8.2 or later installed
	* The google Android x86 emulators
* On Windows
	- Running WASM Project using Python
		- The Linux Subsystem to run the native Python tools
		- Or the Python tools for windows
	- Running WASM Project using Node
		- Node tools (https://nodejs.org/en/)
		- http-server package (https://www.npmjs.com/package/http-server)
			- `npm install http-server -g`

## Create an application from the solution template

To easily create an multi-platform application:
* Install the [Uno Solution Template Visual Studio Extension](https://marketplace.visualstudio.com/items?itemName=nventivecorp.uno-platform-addin)
* Create a new C# solution using the **Cross-Platform App (Uno Platform)** template, from Visual Studio's **Start Page** :

![](docs/assets/vsix-new-project.png)
* Update to the latest nuget package named `Uno.UI`, make sure to check the `pre-release` box.
* To debug the iOS head, select the `Debug|iPhoneSimulator` configuration
* To debug the Android head, select the `Debug|AnyCPU` configuration
* To debug the UWP head, select the `Debug|x86` configuration
* To run the WASM head, select the `Debug|AnyCPU` and `IIS Express` debug target

Note that the WASM head cannot be easily debugged at this point, the `mono-wasm` SDK does
not provide adequate support for this yet. For more details on the wasm support see 
the [Uno.Wasm.Bootstrap repository](https://github.com/nventive/Uno.Wasm.Bootstrap)