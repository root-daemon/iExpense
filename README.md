# iExpense - Swift Expense Tracker

A simple iOS application built with SwiftUI for tracking personal and business expenses.

## Features

- **Add Expenses:** Easily add new expense items with a name, type (Personal or Business), and amount.
- **List Expenses:** View expenses categorized into "Personal" and "Business" sections.
- **Delete Expenses:** Swipe to delete individual expense items from the list.
- **Data Persistence:** Expenses are saved using `UserDefaults` and loaded when the app restarts.
- **Dynamic Styling:** Expense amounts are color-coded based on their value (low, medium, high).

## Core Components

- **`iExpenseApp.swift`:** The main entry point for the application.
- **`ContentView.swift`:** The primary view displaying the lists of expenses, handling navigation, and initiating the add/delete actions. Defines the `ExpenseItem` struct (data model for an expense) and the `Expenses` class (ObservableObject managing the expense items array and persistence).
- **`ExpensesView.swift`:** A view representing a single row in the expense list, displaying the item's details and applying conditional styling based on the amount.
- **`AddView.swift`:** A modal view presented for adding new expenses, containing a form for inputting the name, type, and amount.

## How It Works

1.  The `ContentView` initializes an instance of the `Expenses` class, which loads any saved expense data from `UserDefaults`.
2.  `ContentView` displays two sections in a `List`: one for personal items and one for business items, filtered from the main `items` array in the `Expenses` object.
3.  Each item in the list is rendered using `ExpensesView`, showing the name, type, and formatted amount with color coding.
4.  Tapping the "+" button in the toolbar presents the `AddView` modally.
5.  In `AddView`, the user inputs the expense details. Tapping "Save" creates a new `ExpenseItem`, appends it to the `expenses.items` array (triggering an update in `ContentView` via `@Published`), saves the updated array to `UserDefaults`, and dismisses the modal.
6.  Swiping left on an expense row in `ContentView` reveals a delete button, allowing the user to remove the item from the `expenses.items` array, which also updates `UserDefaults`.

_(Note: `TestView.swift` appears to contain experimental or learning code related to `@StateObject`, sheets, `UserDefaults`, and `Codable`, and is not part of the main application flow.)_
