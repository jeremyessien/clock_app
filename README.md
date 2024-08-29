Clock App
Overview
The Clock App is a Flutter-based application designed to display and manage time-related information. It includes features such as:

A digital clock showing both local time and UTC time.
Information about the next leap year.
Display of lunar cycles, including the previous and next full moon dates.
Features
Digital Clock: Displays local time and UTC time, updating every 100 milliseconds.
Leap Year Information: Shows the year of the next leap year based on the current year.
Lunar Cycle Display: Provides information about the previous and next full moon dates in the format "Month Date".
Analog Clock: An analog clock display is also included.
Installation
To get started with the Clock App, follow these steps:

Clone the Repository:

git clone https://github.com/your-username/clock-app.git
Navigate to the Project Directory:

cd clock-app
Install Dependencies: Ensure you have Flutter installed. Run:

flutter pub get
Usage
Run the Application: Use the following command to run the app on an emulator or connected device:


flutter run
Explore Features:

Digital Clock: View the current local time and UTC time.
Leap Year Information: Check the next leap year displayed on the screen.
Lunar Cycle Display: See the dates for the previous and next full moon.
Code Overview
DigitalClockProvider
Manages the digital clock's state with:

currentTime: Local time.
currentTimeUtc: UTC time.
Updates every 100 milliseconds.
LeapYearClockProvider
Calculates and provides information about the next leap year.

ClockBody
The main widget that integrates:

Digital Clock: Shows time information.
Leap Year Info: Displays next leap year.
Lunar Cycle Info: Displays moon phases.
Contributing
Contributions are welcome! If you have suggestions, improvements, or bug fixes, please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature/YourFeature).
Commit your changes (git commit -am 'Add new feature').
Push to the branch (git push origin feature/YourFeature).
Create a new Pull Request.


Contact
For any questions or inquiries, please reach out to your-jeremyessien@gmail.com.



