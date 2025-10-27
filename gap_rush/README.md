# Gap Rush - iOS Setup Guide

This guide will walk you through setting up and running the Gap Rush project on an iOS simulator or device.

**You must be on a computer running macOS to build and run the iOS version of this game.**

---

## Easy Setup (Recommended)

A setup script is included to automate the entire process.

1.  **Navigate to the Project Directory:** Open your terminal and `cd` into the `gap_rush` directory.
    ```bash
    cd path/to/your/project/gap_rush
    ```

2.  **Run the Script:** Execute the setup script.
    ```bash
    ./setup_and_run_ios.sh
    ```
The script will check your environment, install any missing tools (like Homebrew and Flutter), generate the necessary project files, install dependencies, and launch the game on the iOS Simulator.

---

## Manual Setup

If you prefer to set up the project manually, follow the steps below.

### 1. Prerequisites

Before you begin, ensure you have the following installed on your Mac:

- **Xcode:** Install it from the Mac App Store. After installation, open it at least once to accept the license agreement and let it install its command-line tools.
- **Homebrew (Recommended):** A package manager for macOS. If you don't have it, open Terminal and run:
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

### 2. Install Flutter SDK

1.  **Install Flutter:** The easiest way to install Flutter on macOS is using Homebrew.
    ```bash
    brew install --cask flutter
    ```

2.  **Configure your PATH:** You need to add the Flutter SDK to your system's PATH.
    - Open your shell's configuration file (`.zshrc`, `.bash_profile`, etc.) in a text editor.
      ```bash
      open ~/.zshrc
      ```
    - Add the following line to the end of the file:
      ```bash
      export PATH="$PATH":"$(brew --prefix)/flutter/bin"
      ```
    - Save the file and close the editor. Then, refresh your shell by running:
      ```bash
      source ~/.zshrc
      ```

3.  **Verify the Installation:** Run the `flutter doctor` command.
    ```bash
    flutter doctor
    ```
    - Address any issues that `flutter doctor` reports before proceeding.

### 3. Project Setup

1.  **Navigate to the Project Directory:** `cd` into the `gap_rush` directory.
    ```bash
    cd path/to/your/project/gap_rush
    ```

2.  **Generate Platform Files:** Run the following command to create the `ios` and `android` directories.
    ```bash
    flutter create .
    ```

3.  **Install Dependencies:** Install the packages defined in `pubspec.yaml`.
    ```bash
    flutter pub get
    ```

### 4. Run the Game

1.  **Open the iOS Simulator:**
    ```bash
    open -a Simulator
    ```

2.  **Run the App:**
    ```bash
    flutter run
    ```

You should now see Gap Rush running on your iOS simulator!
