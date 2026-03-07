# Build CV (Flutter)

A Flutter CV builder application using:

- **MVVM architecture**
- **GetX** for routing, dependency injection, and state management
- **SQLite (`sqflite`)** for local persistence

## Features

- Create and edit CV information
- Select from **10 CV templates** (including classic blue style)
- A4 preview layout
- Export CV as **PDF** and **PNG**
- Save and load CV locally from SQLite

## Structure

- `lib/data` → models and repositories
- `lib/viewmodels` → MVVM viewmodels (GetX controllers)
- `lib/presentation` → pages and UI widgets
- `lib/core` → app binding, routing, theme, database setup, export service

## Run

```bash
flutter pub get
flutter run
```
