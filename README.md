# Now Playing Application
Application list game form API RAWG https://api.rawg.io/

This project using clean architecture patern and Providers for State management, if you use Bloc, only cnhange on folder provider than replace with Bloc State

# Project Tree
```bash
├── common
│   ├── constants.dart
│   ├── date_formatter.dart
│   ├── exceptions.dart
│   ├── failure.dart
│   ├── state_enum.dart
│   └── utils.dart
├── data
│   ├── datasources
│   │   ├── locale
│   │   └── remote
│   │       └── game_remote_data_sources.dart
│   ├── models
│   │   ├── game_details_model.dart
│   │   ├── game_details_response.dart
│   │   ├── game_model.dart
│   │   └── game_response.dart
│   └── repositories
│       └── game_repository_impl.dart
├── di
│   └── injection.dart
├── domain
│   ├── entities
│   │   ├── game.dart
│   │   └── game_detail.dart
│   ├── repositories
│   │   └── game_repository.dart
│   └── usecase
│       ├── get_game_detail.dart
│       └── get_games.dart
├── main.dart
└── presentation
    ├── pages
    │   ├── game_detail_page.dart
    │   └── home_page.dart
    └── provider
        ├── game_detail_notifiers.dart
        └── game_list_notifiers.dart
```

# LIBRARY USSING
| Name                 | Description                                                                                                 | Link                                          |
|----------------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| cached_network_image | A flutter library to show images from the internet and keep them in the cache directory.                    | https://pub.dev/packages/cached_network_image |
| cool_dropdown        | Customize dropdown menu                                                                                     | https://pub.dev/packages/cool_dropdown        |
| dio                  | A powerful HTTP networking package for Dart/Flutter                                                         | https://pub.dev/packages/dio                  |
| dartz                | Functional programming in Dart                                                                              | https://pub.dev/packages/dartz                |
| equatable            | Being able to compare objects in Dart often involves having to override the == operator as well as hashCode | https://pub.dev/packages/equatable            |
| flutter_any_logo     | A Flutter plugin that provides asset images for popular industry categories.                                | https://pub.dev/packages/flutter_any_logo     |
| flutter_html         | Render HTML tag                                                                                             | https://pub.dev/packages/flutter_html         |
| get_it               | This is a simple Service Locator for Dart and Flutter                                                       | https://pub.dev/packages/get_it               |
| intl                 | Provides internationalization and localization facilities                                                   | https://pub.dev/packages/intl                 |
| provider             | State management                                                                                            | https://pub.dev/packages/provider             |

# SCREENSHOOT
![Screenshot_20231126_132136](https://github.com/primajatnika27/now-playing-flutter/assets/51253537/bc8e3b91-4c2e-4987-b4d0-063532e69716)
![Screenshot_20231126_132122](https://github.com/primajatnika27/now-playing-flutter/assets/51253537/cf8cf7de-ea36-482a-9ced-1e09a71e5647)
![Screenshot_20231126_132155](https://github.com/primajatnika27/now-playing-flutter/assets/51253537/0d30bb92-1d03-4381-85cc-8d838bdd6327)
