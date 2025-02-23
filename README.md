# real_estate_app

Moniepoint UI interview task

# Please do this before running the app:

open terminal, then run
```
make runner
```

or

```
dart run build_runner build -d
```

This will create all generated files


https://github.com/user-attachments/assets/1a78685d-a348-4f5e-bc10-9556c806a1ce


https://github.com/user-attachments/assets/bae76568-54ba-4554-803d-18f23292fca2


This project is my submission to Moniepoint's UI and animation challenge which is an implementation
of this design


- [Dribble design](https://dribbble.com/shots/23780608-Real-Estate-App)
- [APK Download link](https://drive.google.com/file/d/15ZoFETc6KpPqGB9g89ABsAOrg32EiSNn/view?usp=sharing)


## Folder Structure :open_file_folder:
This application uses a feature driven folder structure to seperate related functionality into individual features

```
(lib)
│
├── gen
│
├── l10n
│
├── src
│    ├── features
│    │     ├── feature0
│    │     │     ├── data
│    │     │     │     ├── data_sources
│    │     │     │     ├── models
│    │     │     │     └── repositories (implementation)
│    │     │     ├── domain
│    │     │     │     ├── entities
│    │     │     │     ├── repositories (abstract)
│    │     │     │     └── use_cases
│    │     │     └── presentation
│    │     │           ├── blocs
│    │     │           ├── pages
│    │     │           └── widgets
│
└── main.dart
```

## Packages Used:

- **`auto_route`** – Ensures smooth and well-structured navigation, making screen transitions effortless.  
- **`cupertino_icons`** – Provides iOS-style icons to maintain a polished look on Apple devices.  
- **`flutter_hooks`** – Simplifies state management, with custom hooks built to streamline UI logic.  
- **`flutter_localizations`** – Enables support for multiple languages and region-specific formatting.  
- **`flutter_screenutil`** – Ensures UI responsiveness by adapting layouts to different screen sizes.  
- **`flutter_svg`** – Allows the use of SVG images, keeping graphics sharp and scalable.  
- **`intl`** – Handles formatting for dates, numbers, and localization to enhance user experience.
