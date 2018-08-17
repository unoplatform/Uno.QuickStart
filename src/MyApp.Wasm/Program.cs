using System;
using Windows.UI.Xaml;

namespace MyApp.Wasm
{
	public class Program
	{
		private static App _app;

		static void Main(string[] args)
		{
			Application.Start(_ => _app = new App());
		}
	}
}
