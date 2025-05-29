# Spaceflight News iOS Sample App

## Overview

This sample iOS application demonstrates how to fetch, decode, and display spaceflight news articles using the Spaceflight News API v4. It follows the MVVM architecture and includes robust networking, custom date decoding, connectivity handling, and a clean SwiftUI-based user interface.

## Features

* **MVVM Architecture**: Separation of concerns with `ViewModel` for data logic and `ContentView` for UI rendering.
* **SwiftUI List & Navigation**: Displays a scrollable list of articles with navigation and async image loading.
* **AsyncImage Integration**: Loads remote images efficiently, with placeholders and caching.
* **Pagination Support**: Requests limited results per page to avoid large payloads.
* **Custom ISO8601 Date Decoding**: Handles both millisecond and second precision timestamps.
* **Network Resilience**:

  * Uses an ephemeral `URLSession` to avoid simulator bugs.
  * `waitsForConnectivity` ensures requests resume when network is available.
  * Automatic retry on transient network loss (error `-1005`).

## Architecture

```
App
 └── ContentView.swift    // SwiftUI view layer
     └── Displays articles list and handles navigation
 └── ViewModel.swift      // ObservableObject
     └── fetchData() handles networking and decoding
 └── DataModel.swift      // Codable structs for API response
```

### DataModel

* **ApiResponse**: Wraps the API's JSON response and extracts the `results` array.
* **Article**: Conforms to `Identifiable` and includes:

  * `id`, `title`, `url`, `imageUrl`, `summary`, `newsSite`
  * `publishedAt`, `updatedAt` as `Date`
  * Nested `Launch` and `Event` types.

### ViewModel

* Configures an **ephemeral** `URLSession`:

  ```swift
  let cfg = URLSessionConfiguration.ephemeral
  cfg.waitsForConnectivity = true
  cfg.timeoutIntervalForRequest = 30
  cfg.timeoutIntervalForResource = 60
  ```
* Builds a paginated request:

  ```swift
  let fullURL = "https://api.spaceflightnewsapi.net/v4/articles?limit=20&page=1"
  ```
* Implements a **custom date decoding** strategy:

  ```swift
  decoder.dateDecodingStrategy = .custom { ... }
  ```
* Includes a retry mechanism for `NSURLErrorNetworkConnectionLost`.

## ContentView (SwiftUI)

* Uses `@StateObject var vm = ViewModel()` to observe data changes.
* Renders each `Article` in a vertically stacked `List`:

  * AsyncImage for `imageUrl` with `.cornerRadius(10)`.
  * Shows `newsSite` and formatted `publishedAt`.
  * Title, summary (truncated to 3 lines), and a `Link("Read more", ...)`.
* Applies `.insetGrouped` style and `.navigationTitle("Spaceflight News")`.

## Installation

1. Clone the repository:

   ```bash
   git clone <your-repo-url>
   cd your-repo
   ```
2. Open `SpaceflightNews.xcodeproj` in Xcode 16.4 or later.
3. Build and run on simulator (or device).

## Requirements

* **Xcode 16.4+** (fixes simulator URLSession issues)
* **iOS 15.0+** deployment target
* SwiftUI and Combine frameworks

## Usage

* Launch the app to automatically fetch the first page of articles.
* Pull-to-refresh by stopping and re-running the app (or implement a refresh control).
* Tap "Read more" to open the article in Safari.

## Extending for Other Apps

Use this project as a reference when building AI-driven iOS applications:

* Swap out `baseURL` and `ApiResponse` to integrate different REST APIs.
* Reuse the `Date` decoding strategy for any ISO8601 timestamps.
* Leverage the `ephemeral` session and connectivity settings for reliable networking.
* Adapt `ContentView` layout to your app’s UI design system.

## License

This sample code is released under the MIT License. Feel free to reuse and modify in your own projects.
