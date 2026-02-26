# Build CV (Flutter)

A Flutter CV builder application using:

- **MVVM architecture**
- **GetX** for routing, dependency injection, and state management
- **SQLite (`sqflite`)** for local persistence

## Features

- Create and edit CV information
- Select from **10 CV templates**
- Preview selected template with your data
- Save and load CV locally from SQLite

## Structure

- `lib/data` → models and repositories
- `lib/viewmodels` → MVVM viewmodels (GetX controllers)
- `lib/presentation` → pages and UI widgets
- `lib/core` → app binding, routing, theme, and database setup

## Run

```bash
flutter pub get
flutter run
```
