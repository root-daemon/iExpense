//
//  ContentView.swift
//  iExpense
//
// Created by Solygambas on 09/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal"}
    }
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business"}
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

extension Color {
    static let littleExpenseColor = Color("expenseSmallColor")
    static let normalExpenseColor =
    Color("expenseStandardColor")
    static let hugeExpenseColor = Color("expenseHighColor")
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Personal")) {
                    ForEach(expenses.personalItems) { item in
                        ExpensesView(item: item)
                    }
                    .onDelete(perform: removeItems)
                }
                Section(header: Text("Business")) {
                    ForEach(expenses.businessItems) { item in
                        ExpensesView(item: item)
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// Change 1: Sun Apr 27 13:38:03 IST 2025
// Change 2: Sun Apr 27 13:38:04 IST 2025
// Change 7: Sun Apr 27 13:38:08 IST 2025
// Change 9: Sun Apr 27 13:38:09 IST 2025
// Change 10: Sun Apr 27 13:38:09 IST 2025
// Change 14: Sun Apr 27 13:38:11 IST 2025
// Change 15: Sun Apr 27 13:38:11 IST 2025
// Change 16: Sun Apr 27 13:38:12 IST 2025
// Change 19: Sun Apr 27 13:38:14 IST 2025
// Change 40: Sun Apr 27 13:38:26 IST 2025
// Change 41: Sun Apr 27 13:38:26 IST 2025
// Change 44: Sun Apr 27 13:38:29 IST 2025
// Change 48: Sun Apr 27 13:38:31 IST 2025
// Change 50: Sun Apr 27 13:38:34 IST 2025
// Change 54: Sun Apr 27 13:38:37 IST 2025
// Change 56: Sun Apr 27 13:38:38 IST 2025
// Change 65: Sun Apr 27 13:38:42 IST 2025
// Change 69: Sun Apr 27 13:38:44 IST 2025
// Change 1: Sun Apr 27 13:42:34 IST 2025
// Change 5: Sun Apr 27 13:42:37 IST 2025
// Change 8: Sun Apr 27 13:42:38 IST 2025
// Change 9: Sun Apr 27 13:42:39 IST 2025
// Change 10: Sun Apr 27 13:42:39 IST 2025
// Change 11: Sun Apr 27 13:42:39 IST 2025
// Change 12: Sun Apr 27 13:42:39 IST 2025
// Change 13: Sun Apr 27 13:42:40 IST 2025
// Change 16: Sun Apr 27 13:42:42 IST 2025
// Change 22: Sun Apr 27 13:42:46 IST 2025
// Change 28: Sun Apr 27 13:42:48 IST 2025
// Change 33: Sun Apr 27 13:42:51 IST 2025
// Change 36: Sun Apr 27 13:42:52 IST 2025
// Change 37: Sun Apr 27 13:42:53 IST 2025
// Change 39: Sun Apr 27 13:42:54 IST 2025
// Change 41: Sun Apr 27 13:42:55 IST 2025
// Change 42: Sun Apr 27 13:42:55 IST 2025
// Change 43: Sun Apr 27 13:42:56 IST 2025
// Change 47: Sun Apr 27 13:43:00 IST 2025
// Change 48: Sun Apr 27 13:43:01 IST 2025
// Change 53: Sun Apr 27 13:43:03 IST 2025
// Change 57: Sun Apr 27 13:43:06 IST 2025
// Change 71: Sun Apr 27 13:43:15 IST 2025
// Change 4: Sun Apr 27 13:45:15 IST 2025
// Change 7: Sun Apr 27 13:45:17 IST 2025
// Change 8: Sun Apr 27 13:45:18 IST 2025
// Change 9: Sun Apr 27 13:45:18 IST 2025
// Change 17: Sun Apr 27 13:45:24 IST 2025
// Change 28: Sun Apr 27 13:45:32 IST 2025
// Change 33: Sun Apr 27 13:45:36 IST 2025
// Change 36: Sun Apr 27 13:45:38 IST 2025
// Change 39: Sun Apr 27 13:45:40 IST 2025
// Change 40: Sun Apr 27 13:45:40 IST 2025
// Change 42: Sun Apr 27 13:45:41 IST 2025
// Change 46: Sun Apr 27 13:45:44 IST 2025
// Change 52: Sun Apr 27 13:45:47 IST 2025
// Change 56: Sun Apr 27 13:45:50 IST 2025
// Change 59: Sun Apr 27 13:45:51 IST 2025
// Change 11: Sun Apr 27 13:46:00 IST 2025
// Change 13: Sun Apr 27 13:46:02 IST 2025
// Change 20: Sun Apr 27 13:46:09 IST 2025
// Change 23: Sun Apr 27 13:46:09 IST 2025
// Change 24: Sun Apr 27 13:46:10 IST 2025
// Change 25: Sun Apr 27 13:46:11 IST 2025
// Change 26: Sun Apr 27 13:46:11 IST 2025
// Change 33: Sun Apr 27 13:46:15 IST 2025
// Change 38: Sun Apr 27 13:46:18 IST 2025
// Change 39: Sun Apr 27 13:46:19 IST 2025
// Change 44: Sun Apr 27 13:46:23 IST 2025
// Change 45: Sun Apr 27 13:46:23 IST 2025
// Change 53: Sun Apr 27 13:46:24 IST 2025
// Change 55: Sun Apr 27 13:46:24 IST 2025
// Change 57: Sun Apr 27 13:46:24 IST 2025
// Change 66: Sun Apr 27 13:46:30 IST 2025
// Change 69: Sun Apr 27 13:46:31 IST 2025
// Change 75: Sun Apr 27 13:46:32 IST 2025
// Change 3: Sun Apr 27 13:47:39 IST 2025
// Change 5: Sun Apr 27 13:47:40 IST 2025
// Change 8: Sun Apr 27 13:47:41 IST 2025
// Change 10: Sun Apr 27 13:47:42 IST 2025
// Change 20: Sun Apr 27 13:47:49 IST 2025
// Change 24: Sun Apr 27 13:47:53 IST 2025
// Change 29: Sun Apr 27 13:47:57 IST 2025
// Change 30: Sun Apr 27 13:47:57 IST 2025
// Change 32: Sun Apr 27 13:47:58 IST 2025
// Change 33: Sun Apr 27 13:47:58 IST 2025
// Change 35: Sun Apr 27 13:48:00 IST 2025
// Change 36: Sun Apr 27 13:48:01 IST 2025
// Change 41: Sun Apr 27 13:48:04 IST 2025
// Change 45: Sun Apr 27 13:48:06 IST 2025
// Change 47: Sun Apr 27 13:48:08 IST 2025
// Change 51: Sun Apr 27 13:48:09 IST 2025
// Change 52: Sun Apr 27 13:48:09 IST 2025
// Change 56: Sun Apr 27 13:48:11 IST 2025
// Change 61: Sun Apr 27 13:48:13 IST 2025
