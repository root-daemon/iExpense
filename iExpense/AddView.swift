//
//
// AddView.swift
// iExpense
//
// Created by Solygambas on 09/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
// Change 6: Sun Apr 27 13:38:08 IST 2025
// Change 17: Sun Apr 27 13:38:13 IST 2025
// Change 23: Sun Apr 27 13:38:16 IST 2025
// Change 25: Sun Apr 27 13:38:18 IST 2025
// Change 30: Sun Apr 27 13:38:22 IST 2025
// Change 32: Sun Apr 27 13:38:22 IST 2025
// Change 34: Sun Apr 27 13:38:22 IST 2025
// Change 38: Sun Apr 27 13:38:25 IST 2025
// Change 46: Sun Apr 27 13:38:30 IST 2025
// Change 51: Sun Apr 27 13:38:35 IST 2025
// Change 52: Sun Apr 27 13:38:36 IST 2025
// Change 62: Sun Apr 27 13:38:40 IST 2025
// Change 67: Sun Apr 27 13:38:43 IST 2025
// Change 70: Sun Apr 27 13:38:44 IST 2025
// Change 73: Sun Apr 27 13:38:46 IST 2025
// Change 4: Sun Apr 27 13:42:36 IST 2025
// Change 7: Sun Apr 27 13:42:38 IST 2025
// Change 15: Sun Apr 27 13:42:42 IST 2025
// Change 23: Sun Apr 27 13:42:47 IST 2025
// Change 25: Sun Apr 27 13:42:47 IST 2025
// Change 27: Sun Apr 27 13:42:48 IST 2025
// Change 30: Sun Apr 27 13:42:50 IST 2025
// Change 32: Sun Apr 27 13:42:51 IST 2025
// Change 40: Sun Apr 27 13:42:55 IST 2025
// Change 46: Sun Apr 27 13:42:59 IST 2025
// Change 51: Sun Apr 27 13:43:02 IST 2025
// Change 55: Sun Apr 27 13:43:04 IST 2025
// Change 56: Sun Apr 27 13:43:05 IST 2025
// Change 59: Sun Apr 27 13:43:07 IST 2025
// Change 61: Sun Apr 27 13:43:08 IST 2025
// Change 65: Sun Apr 27 13:43:11 IST 2025
// Change 66: Sun Apr 27 13:43:11 IST 2025
// Change 67: Sun Apr 27 13:43:11 IST 2025
// Change 73: Sun Apr 27 13:43:16 IST 2025
// Change 3: Sun Apr 27 13:45:15 IST 2025
// Change 25: Sun Apr 27 13:45:29 IST 2025
// Change 27: Sun Apr 27 13:45:31 IST 2025
// Change 29: Sun Apr 27 13:45:33 IST 2025
// Change 32: Sun Apr 27 13:45:35 IST 2025
// Change 37: Sun Apr 27 13:45:39 IST 2025
// Change 41: Sun Apr 27 13:45:40 IST 2025
// Change 43: Sun Apr 27 13:45:42 IST 2025
// Change 45: Sun Apr 27 13:45:42 IST 2025
// Change 58: Sun Apr 27 13:45:51 IST 2025
// Change 2: Sun Apr 27 13:45:58 IST 2025
// Change 8: Sun Apr 27 13:45:59 IST 2025
// Change 14: Sun Apr 27 13:46:03 IST 2025
// Change 19: Sun Apr 27 13:46:08 IST 2025
// Change 27: Sun Apr 27 13:46:11 IST 2025
// Change 28: Sun Apr 27 13:46:12 IST 2025
// Change 43: Sun Apr 27 13:46:23 IST 2025
// Change 46: Sun Apr 27 13:46:23 IST 2025
// Change 56: Sun Apr 27 13:46:24 IST 2025
// Change 63: Sun Apr 27 13:46:28 IST 2025
// Change 67: Sun Apr 27 13:46:30 IST 2025
// Change 71: Sun Apr 27 13:46:32 IST 2025
// Change 2: Sun Apr 27 13:47:38 IST 2025
// Change 7: Sun Apr 27 13:47:40 IST 2025
// Change 9: Sun Apr 27 13:47:42 IST 2025
// Change 18: Sun Apr 27 13:47:48 IST 2025
// Change 23: Sun Apr 27 13:47:52 IST 2025
// Change 37: Sun Apr 27 13:48:01 IST 2025
// Change 43: Sun Apr 27 13:48:05 IST 2025
// Change 48: Sun Apr 27 13:48:08 IST 2025
// Change 49: Sun Apr 27 13:48:08 IST 2025
// Change 53: Sun Apr 27 13:48:10 IST 2025
// Change 58: Sun Apr 27 13:48:11 IST 2025
// Change 62: Sun Apr 27 13:48:14 IST 2025
// Change 65: Sun Apr 27 13:48:14 IST 2025
