# Patient Norah App

## Documentation

### Description

This Flutter project is app that displays a grid of products on the main screen. The middle component of the screen should feature a pagination system to allow users to navigate through multiple pages of products. The app should also include recommendations component at the end of the screen.

### Feature structure

| Folder                | Path                              | Description                                              |
|:----------------------|:----------------------------------|:---------------------------------------------------------|
| **home**              | `/lib/features/home`              | this feature is responsible on show products.            |
| **cart**              | `/lib/features/cart`              | add responsibility for this feature here.                 |
| **menu**              | `/lib/features/menu`              | add responsibility for this feature here.           |
| **rewards**           | `/lib/features/rewards`          | add responsibility for this feature here.               |
| **main**              | `/lib/features/main`              | this feature is responsible on main app functionalities. |
| **splash**            | `/lib/features/splash`            | this feature is responsible on splash screen.            |

---

## Watch a video <a name="video"></a>

<a href="https://www.youtube.com/watch?v=15XEGSQmrW8" target="_blank"><img alt="yotube" src="https://img.shields.io/badge/youtube-FF0000.svg?style=for-the-badge&logo=youtube&logoColor=white" /></a>

## Getting Started

### Prerequisites

- **Flutter SDK**: 3.5.3
- **Dart**: Matching Flutter SDK version.

### Installation

1. Clone the repository:
   ```bash
   git clone <your-repo-url>
    ```
2. Navigate to the project directory:
    ```bash
    cd caregiver_norah_app
    ```

3. Install the dependencies:
    ```bash
    flutter pub get
    ```

4.	Generate necessary files using build_runner:
      ```bash
      flutter pub run build_runner build --delete-conflicting-outputs
      ```

5. Run the application:
    ```bash
    flutter run
    ```


## Project Structure

```plaintext
lib/
├── core/                        # Core utilities and common functionalities
│   ├── di/                      # Dependency injection setup
│   ├── error/                   # Error handling mechanisms
│   ├── network/                 # Network-related utilities
│   ├── themes/                  # Application themes and styles
│   ├── usecase/                 # Common use cases
│   ├── util/                    # Utility classes and functions
│   ├── value_objects/           # Value objects and entities
│
├── features/                    # Application features
│   ├── cart/                    # Cartscreen feature
│   ├── home/                    # Home screen feature
│   │   ├── data/                # Data handling (models, repositories)
│   │   │   ├── fixture/         # Fixed Data Mocks
│   │   │   ├── models/          # Model Data objects
│   │   │   ├── remote/          # Remote data sources (e.g., API calls)
│   │   │   ├── repository/      # Data repositories
│   │   ├── domain/              # Domain logic (use cases, repositories)
│   │   │   ├── repository/      # Domain repositories
│   │   │   ├── usecases/        # Business logic use cases
│   │   ├── presentation/        # UI layer (screens, widgets)
│   │   │   ├── cubit/           # State management with Cubit
│   │   │   ├── screens/         # UI screens
│   │   │   ├── widgets/         # Reusable UI widgets
│   ├── main/                    # Main app functionalities
│   ├── menu/                    # Main menu feature
│   ├── rewards/                 # Rewards screen feature
│   ├── splash/                  # Splash screen feature
│
├── main.dart                    # Main entry point for nana app

```


## Packages Used

| Package           | Version                     | Description                                |
| :--------------- | :----------------------- |:-------------------------------------------|
| **flutter_bloc, bloc**       | `^8.1.6, ^8.1.4`            | For state management.                      |
| **shared_preferences**   | `^2.2.3`        | For local storage.                         |
| **intl**     | `^0.19.0` | For date and time formatting.              |
| **flutter_svg**   | `^2.0.10+1`        | For handling SVG files.                    |
| **equatable**     | `^2.0.7` | For value equality in models.              |
| **go_router**   | `^14.6.1`        | For routing and navigation.                |
| **dartz**     | `^0.10.1` | Functional programming helper.             |
| **easy_localization**   | `^3.0.7`        | For app localization and translations.     |
| **dio, pretty_dio_logger**     | `^5.7.0, ^1.4.0` | For HTTP requests and logging.             |
| **get_it, injectable**   | `^8.0.2, ^2.5.0`        | For dependency injection.                  |
| **retrofit**     | `^4.1.1` | For network request abstraction.           |
| **skeletonizer**     | `^1.4.2` | For loading animations.                    |
| **cached_network_image**     | `^3.4.1` | For Image Loading cases.                   |
| **lottie**   | `^3.1.3`        | For handel Lottie Image Formated.          |
| **mockito**     | `^5.4.4` | For create mock classes.                   |
| **bloc_test**   | `^9.1.7`        | For test cubit.                            |
| **injectable_generator, freezed, freezed_annotation, retrofit_generator**     | `^2.6.1, ^2.4.7, ^2.4.1, ^9.1.2` | For code generation.                       |
| **flutter_screenutil**   | `^5.9.1`        | For screen size adaptation.                |
| **json_annotation**     | `^4.9.0` | For JSON serialization.                    |



## Assets

```plaintext
- Fonts: 
  - PlusJakartaSans font families with various weights.
  - assets/fonts/
- Icons:
  - SVG and PNG formats located in:
  - assets/icons/
- Logo:
  - Image format located in:
  - assets/logo/
- Translations:
  - Located in:
  - assets/translations/
```

## Contributing

```plaintext
Contributions are welcome! Here’s how you can get involved:
1. Fork the project.
2. Create a new feature branch.
3. Commit your changes.
4. Push your branch and open a pull request.
```

## License

```plaintext
This project is licensed under the MIT License - see the LICENSE file for details.
```