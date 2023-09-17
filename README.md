# KeysocItunesSearchAPIServiceiOS-Swift

A service package for calling iTunes search API.

## Installation

The Swift Package Manager is a tool for automating the distribution of Swift code and is integrated into the swift compiler. It is in early development, but SwiftUITrackableScrollView does support its use on supported platforms.

Once you have your Swift package set up, adding this package as a dependency is as easy as adding it to the dependencies value of your Package.swift.


```swift
dependencies: [
    .package(url: "https://github.com/VansonLeung/KeysocItunesSearchAPIServiceiOS-Swift.git")
]
```

## Usages

#### 1. Runs iTunes search API for songs

- Usage example:

```swift
KCITunesAPIQueryService.shared.searchSongs(
    withQuery: "Alex",
    limit: 10,
    offset: page * 10,
    mediaType: "podcast",
    country: "US",
    lang: "en_us"
) { [weak self] result in
    switch result {
        case .success(let songs):
        ...
        case .failure(let error):
        ...
    }
}
```

#### 2. Runs iTunes search API for albums

- Usage example:

```swift
KCITunesAPIQueryService.shared.searchAlbums(
    withQuery: "Alex",
    limit: 10,
    offset: page * 10,
    mediaType: "podcast",
    country: "US",
    lang: "en_us"
) { [weak self] result in
    switch result {
        case .success(let albums):
        ...
        case .failure(let error):
        ...
    }
}
```

#### 3. Runs iTunes search API for artists

- Usage example:

```swift
KCITunesAPIQueryService.shared.searchArtists(
        withQuery: "Alex",
    limit: 10,
    offset: page * 10,
    mediaType: "podcast",
    country: "US",
    lang: "en_us"
) { [weak self] result in
    switch result {
            case .success(let songs):
        ...
        case .failure(let error):
        ...
    }
}
```
