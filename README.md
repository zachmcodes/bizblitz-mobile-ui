# bizblitz-mobile-ui
Mobile UI

Overview

The mobile-ui is a SwiftUI-based mobile application designed to interact with the backend services such as login-api, review-api, and bff-api. It allows users to search for businesses, log in, view business details, and submit reviews.

Features

    •    User authentication.
    •    Business search and display.
    •    Submit and view reviews.
    •    Interaction with the backend via bff-api.

Installation

    1.    Prerequisites:
    •    Xcode installed on macOS.
    •    Swift 5.0+.
    2.    Setup:
    •    Clone the repository:
    git clone https://github.com/yourusername/mobile-ui.git
    •    Open the project in Xcode:
    open mobile-ui.xcodeproj
    •    Install dependencies (if any):
    pod install
    •    Configure your Info.plist to include necessary keys, such as API URLs.
    •    Build and run the application on the simulator or a physical device.

Usage

    •    Upon launching, users can log in or register.
    •    After authentication, users can search for businesses, view details, and submit reviews.
    •    Reviews and business data are fetched through the bff-api.

Testing

    •    Unit tests are written using XCTest.
    •    To run the tests:
    cmd + U    

