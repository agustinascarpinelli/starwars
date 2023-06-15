# Star Wars App

This is a Flutter application that consumes the SWAPI (Star Wars API) to display information about Star Wars species. The app includes animations and provides offline functionality by loading preloaded data when in disconnected mode. It also allows users to report a species, but an internet connection is required for that feature.

## Getting Started

To run this application, follow these steps:

1. Ensure that you have Flutter installed on your machine. For installation instructions, refer to the official [Flutter documentation](https://flutter.dev/docs/get-started/install).
2. Clone this repository or download the source code.
3. Open the project in your preferred IDE or text editor.
4. Install the dependencies specified in the `pubspec.yaml` file by running the following command in the project directory:
   ```
   flutter pub get
   ```
5. Connect a device or start an emulator.
6. Run the application using the following command:
   ```
   flutter run
   ```

## Dependencies

This application relies on the following dependencies:

- `animated_text_kit: ^4.2.2`: Provides animated text widgets for creating engaging UI elements.
- `animations: ^2.0.7`: Offers a collection of predefined animations to enhance the user experience.
- `bloc: ^8.1.2`: Implements the BLoC (Business Logic Component) architecture for managing application state.
- `cupertino_icons: ^1.0.2`: Provides the Cupertino icon set for iOS-style icons.
- `dartz: ^0.10.1`: Offers functional programming constructs in Dart, such as Option and Either.
- `flutter_bloc: ^8.1.3`: Adds Flutter-specific extensions and utilities to the BLoC package.
- `google_fonts: ^5.0.0`: Enables easy integration of custom fonts from the Google Fonts library.
- `http: ^1.0.0`: Provides functions for making HTTP requests to communicate with the SWAPI.
- `hydrated_bloc: ^9.1.1`: Persists and restores BLoC states to maintain state across application restarts.
- `path_provider: ^2.0.15`: Enables access to commonly used locations on the device's file system.

## Assets

The application includes the following assets:

- `assets/images/background.jpg`: A background image displayed on the initial screen.
- `assets/images/logo_app.png`: The application's logo image.

Feel free to modify or add additional assets as needed.

## Usage

Upon launching the application, you will see an initial screen with animations. Tapping the screen will take you to the home screen, where you can view a list of Star Wars species. By default, the app operates in offline mode, loading preloaded data instead of making API calls (unless you activate the internet connection).

Tapping on each species allows you to report it, but please note that an internet connection is required for this feature to function properly.

## Contributing

Contributions to this project are welcome. If you encounter any issues or have suggestions for improvement, please submit an issue on the project's GitHub repository. Feel free to fork the repository and submit pull requests with your proposed changes as well.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute the code for personal and commercial purposes.
