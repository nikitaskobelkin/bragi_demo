# Demo repo manual

## Building the App

1. Clone the repository to your local machine.
2. Open the BragiDemo.xcworkspace file in Xcode.
3. Select the appropriate target and build the app.
4. Make sure you have CocoaPods installed on your system. If not, you can install it using the following command:

```
$ gem install cocoapods
```
Then, navigate to the project directory and install the required dependencies:
```
$ pod install
```

## General Architecture

The iOS app follows the MVVM (Model-View-ViewModel) architectural pattern, incorporating Dependency Injection for handling dependencies and Async/Await for asynchronous operations.

Key Components:
- Dependency Injection: The project uses NeedleFoundation for dependency injection, allowing for loosely coupled components and easy testability. **Important:** after changes components, you must restart build for generating providers. More info: [Needle GitHub](https://github.com/uber/needle)
- MVVM Pattern: The app follows the MVVM pattern, where Views display data and events, ViewModels handle business logic and data presentation, and Models represent data and services.
- Convert RxSwift to Async/Await: The app has replaced RxSwift with Swift's native Async/Await for cleaner and more straightforward asynchronous programming.
- UI shared: Contains style-related files such as Theme for theming, Modifiers, Colors, and Styles for reusable styles.
- Utilities: Contains extension files with utility functions, helping to keep the main codebase clean and organized.


## Libraries Used

The app uses the following libraries:

- Introspect: A library that provides SwiftUI extensions to work with UIKit components, enabling easier customization and integration with SwiftUI.
- Alamofire: A popular networking library for handling API requests and responses, simplifying network calls.
- RxSwift and RxCocoa: Used previously for reactive programming. However, we've now switched to Swift's native Async/Await for better readability and performance.

Feel free to explore the codebase and contribute to the project. Happy coding!
