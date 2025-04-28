# bizblitz-mobile-ui
Mobile UI

Overview

The mobile-ui is a SwiftUI-based mobile application designed to interact with the backend services such as login-api, review-api, and bff-api. It allows users to search for businesses, log in, view business details, and submit reviews. I utilized YelpAPI and google resources to create a project to showcase architectural design from backend, storage, internal and external api consolidation into a backend-for-frontend to ensure the client and backend are safely separated.

This project demonstrates API integration with the Yelp Fusion API. It fetches restaurant data based on user queries.

> Powered by Yelp.

This project is for educational purposes only and not intended for commercial use.


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

