# Uno Quick Start
This repository is a basic sample for an [Uno Platform](http://platform.uno/) application which cross-targets UWP, iOS, Android, Linux and WebAssembly.

You can clone this repository and open it in:
-  Visual Studio 2019 or 2022 and use the WinUI tooling on Windows, such as 
[Xaml Hot Reload](https://docs.microsoft.com/en-us/visualstudio/xaml-tools/xaml-hot-reload?view=vs-2022), C# Hot Reload, then run your app on iOS, Android, Windows or [WSL](https://platform.uno/docs/articles/get-started-with-linux.html). 
- [Codespaces](https://github.com/features/codespaces) (WebAssembly) or [Gitpod](https://gitpod.io) (WebAssembly / Linux+Skia) to get a fully configured environment ready to use

You can [try out the WebAssembly Playground in your browser](http://platform.uno/Playground/index.html).

You can try developing this application right in your browser:

[![Open QuickStart in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/unoplatform/uno.quickstart) 

To create your own application, [follow our getting start guides](https://platform.uno/docs/articles/get-started.html).

## Develop on your machine

See [the VS Code Getting started](https://platform.uno/docs/articles/get-started.html) documentation for additional details about developing with Visual Studio on Windows.

## Develop using Codespaces
### WebAssembly
1. Install the suggested [Uno Platform extension](https://marketplace.visualstudio.com/items?itemName=unoplatform.vscode)
1. Open the command palette (Ctrl+Shift+P) and execute the `Run uno-check` command to install the appropriate .NET SDK
1. Open the command palette (Ctrl+Shift+P) and run the `Install the dotnet new templates` command to install the dotnet new templates
1. Once the C# environment is setup, with the commmand palette use the command "Omnisharp: Select project" (or click on the project name in the status bar)
1. Select the `MyApp.Wasm` project
1. Using a terminal, navigate to the `MyApp.Wasm` folder
1. Type `dotnet run`
1. Once the compilation is done, a server will open on port 5000
1. In the **Ports** tab (next to the Terminal tab), right click to make both the port 5000 and the other dotnet opened port (with `uno.ui.remotecontrol` in the running process column) to "public". 
   > Failure to make both ports public will prevent the app from starting properly.
1. Codespaces will suggest to open a new browser window or as a preview window

See the [section for examples](#making-additional-modifications) below of changes to the application. 

See [the VS Code Getting started](https://platform.uno/docs/articles/get-started-vscode.html) documentation for additional details about developing with VS Code.

## Develop using Gitpod
### How to develop for WebAssembly
1. Install the suggested [Uno Platform extension](https://open-vsx.org/extension/unoplatform/vscode)
1. Open the command palette (Ctrl+Shift+P) and execute the `Run uno-check` command to install the appropriate .NET SDK
1. Open the command palette (Ctrl+Shift+P) and run the `Install the dotnet new templates` command to install the dotnet new templates
1. Once the C# environment is setup, with the commmand palette use the command "Omnisharp: Select project" (or click on the project name in the status bar)
1. Select the `MyApp.Wasm` project
1. Using a terminal, navigate to the `MyApp.Wasm` folder
1. Type `dotnet run`
1. Once the compilation is done, a server will open on port 5000
1. In the **Ports** activity (on the left), click to padlock on both the port 5000 and the other dotnet opened port (with a number over 30000) to make ports public. 
   > Failure to make both ports public will prevent the app from starting properly.
1. Gitpod will suggest to open a new browser window or as a preview window

See the [section for examples](#making-additional-modifications) below of changes to the application. 

See [the VS Code Getting started](https://platform.uno/docs/articles/get-started-vscode.html) documentation for additional details about developing with VS Code.

### How to develop for Linux (Skia.Gtk)
1. As Gitpod will suggest, open the port 6080 as a browser preview to get access to the X11 environment.
1. Once the C# environment is setup, with the commmand palette use the command "Omnisharp: Select project" (or click on the project name in the status bar)
1. Select the `MyApp.Skia.Gtk` project
1. To run your application, either:
    - Using a terminal, navigate to the `MyApp.Skia.Gtk` folder and type `dotnet run`
    - In the debug activity section on the left, select `Skia.GTK (Debug)` in drop down, the press `F5` or Ctrl+F5 to start the application without the debugger.
1. Gitpod will suggest to open a new browser window or as a preview window

See the [section for examples](#making-additional-modifications) below of changes to the application. 

See [the VS Code Getting started](https://platform.uno/docs/articles/get-started-vscode.html) documentation for additional details about developing with VS Code.

## Making additional modifications

* Change some XAML content:
	* Open the `src/MyApp.Shared/MainPage.xaml`
	* Make some changes, such as `Hello, world!` to `Hello, Uno!`
	* No need to save, see that the application's text has changed !
* Change some C# code:
	* Stop the running application with `Ctrl+C`
	* Open the `src/MyApp.Shared/MainPage.xaml`
	* Replace the `TextBlock` definition with the following attribute:
		```xaml
		<StackPanel>
			<TextBlock x:Name="myTextBlock" Text="Hello, world!" Margin="20" FontSize="30" />
			<Button Content="Click me!" Click="{x:Bind OnClickMe}" />
		</StackPanel>
		```
	* Save the file
	* Open the `src/MyApp.Shared/MainPage.xaml.cs`
	* Immediately after the `MainPage` constructor, add the following:
		```csharp
		public void OnClickMe()
		{
			myTextBlock.Text = DateTime.Now.ToString();
		}
		```
	* Save the file
	* Start the application again with `dotnet run`
	* Refresh the Live Preview using the small refresh icon (not the full browser tab)
	* The time is showing !
	* Without stopping the application, in the `src/MyApp.Shared/MainPage.xaml.cs`, change the code to the following:
		```csharp
		public void OnClickMe()
		{
			myTextBlock.Text = "Hello Uno! " + DateTime.Now.ToString();
		}
		```
	* Still without restarting the application, click the button again
	* The text is now changed thanks to C# Hot Reload!
