# Gap Rush - iOS Setup Guide

This guide will walk you through setting up and running the Gap Rush project on an iOS simulator or device.

**You must be on a computer running macOS to build and run the iOS version of this game.**

---

## 1. Prerequisites

Before you begin, ensure you have the following installed on your Mac:

- **Xcode:** Install it from the Mac App Store. After installation, open it at least once to accept the license agreement and let it install its command-line tools.
- **Homebrew (Recommended):** A package manager for macOS. If you don't have it, open Terminal and run:
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

---

## 2. Install Flutter SDK

1.  **Install Flutter:** The easiest way to install Flutter on macOS is using Homebrew.
    ```bash
    brew install --cask flutter
    ```

2.  **Configure your PATH:** You need to add the Flutter SDK to your system's PATH.
    - Open your shell's configuration file (`.zshrc`, `.bash_profile`, etc.) in a text editor. If you're using the default Zsh shell, this is `.zshrc`.
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

3.  **Verify the Installation:** Run the `flutter doctor` command. This tool checks your environment and displays a report of the status of your Flutter installation.
    ```bash
    flutter doctor
    ```
    - Look for the "Xcode" and "iOS toolchain" sections. Address any issues that `flutter doctor` reports before proceeding.

---

## 3. Project Setup

The current project directory only contains the core Flutter code. You need to generate the native iOS project files.

1.  **Navigate to the Project Directory:** Open your terminal and `cd` into the `gap_rush` directory.
    ```bash
    cd path/to/your/project/gap_rush
    ```

2.  **Generate Platform Files:** Run the following command to create the `ios`, `android`, and other necessary directories.
    ```bash
    flutter create .
    ```
    *This command will analyze the existing code and build the platform-specific project files around it.*

3.  **Install Dependencies:** Once the project files are generated, install the necessary packages defined in `pubspec.yaml`.
    ```bash
    flutter pub get
    ```

---

## 4. Run the Game

1.  **Open the iOS Simulator:** Launch the iOS simulator from your terminal.
    ```bash
    open -a Simulator
    ```

2.  **Run the App:** In your terminal (still inside the `gap_rush` directory), run the game.
    ```bash
    flutter run
    ```
    - Flutter will build the app, install it on the simulator, and launch it. The first build can take a few minutes.

You should now see Gap Rush running on your iOS simulator!
