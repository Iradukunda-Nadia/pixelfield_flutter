# pixelfield_flutter

Bottle Collection App

A Flutter app that allows users to browse detailed wine bottle information, view tasting notes and 
history, and manage their personal collection. Built as part of a technical test to showcase skills in state management, custom UI, and working with dynamic data.

Tech Highlights

State Management
flutter_bloc: Used for clean separation of business logic and UI. Provides scalability and testability for features like managing user collections, connectivity status, and more.

Packages Used

google_fonts	Used for custom fonts.
flutter_bloc	For state management .
connectivity_plus	listen to changes in network status.
shared_preferences	Used to store data locally.
flutter_svg	rendering of svg icons. 

Folder Structure

lib/
├── components/          # Reusable UI widgets
├── data/
│   └── models/          # Bottle model definition
├── pages/               # app ui screens
├── blocs/               # Bloc files
└── main.dart            # App entry point

Setup & Run

Clone the repository
Run flutter pub get
Launch with flutter run
Ensure you have Flutter installed and configured. Minimum SDK: Flutter 3.10+

Test Notes(for future implementation)

This project was completed within the constraints of a technical test. Some features (like 
persistent notes and editable history) can be improved on. Offline caching and global state 
handling are 
partially implemented and would be built out with further iterations.