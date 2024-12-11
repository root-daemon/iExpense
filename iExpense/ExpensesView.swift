//
//
// ExpensesView.swift
// iExpense
//
// Created by Solygambas on 09/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ExpensesView: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .foregroundColor(item.amount <= 10 ?.littleExpenseColor:
                    item.amount <= 100 ? .normalExpenseColor : .hugeExpenseColor)
        }
        .accessibilityElement()
        .accessibilityLabel("\(item.name) \(item.amount)")
        .accessibilityHint(item.type)
    }
}
// Change 3: Sun Apr 27 13:38:05 IST 2025
// Change 4: Sun Apr 27 13:38:06 IST 2025
// Change 8: Sun Apr 27 13:38:09 IST 2025
// Change 11: Sun Apr 27 13:38:10 IST 2025
// Change 13: Sun Apr 27 13:38:10 IST 2025
// Change 18: Sun Apr 27 13:38:14 IST 2025
// Change 24: Sun Apr 27 13:38:17 IST 2025
// Change 28: Sun Apr 27 13:38:21 IST 2025
// Change 29: Sun Apr 27 13:38:21 IST 2025
// Change 31: Sun Apr 27 13:38:22 IST 2025
// Change 33: Sun Apr 27 13:38:22 IST 2025
// Change 35: Sun Apr 27 13:38:23 IST 2025
// Change 36: Sun Apr 27 13:38:24 IST 2025
// Change 37: Sun Apr 27 13:38:24 IST 2025
// Change 39: Sun Apr 27 13:38:26 IST 2025
// Change 43: Sun Apr 27 13:38:28 IST 2025
// Change 45: Sun Apr 27 13:38:30 IST 2025
// Change 49: Sun Apr 27 13:38:32 IST 2025
// Change 59: Sun Apr 27 13:38:40 IST 2025
// Change 63: Sun Apr 27 13:38:41 IST 2025
// Change 68: Sun Apr 27 13:38:44 IST 2025
// Change 72: Sun Apr 27 13:38:45 IST 2025
// Change 74: Sun Apr 27 13:38:48 IST 2025
// Change 6: Sun Apr 27 13:42:38 IST 2025
// Change 14: Sun Apr 27 13:42:41 IST 2025
// Change 20: Sun Apr 27 13:42:44 IST 2025
// Change 21: Sun Apr 27 13:42:45 IST 2025
// Change 26: Sun Apr 27 13:42:48 IST 2025
// Change 31: Sun Apr 27 13:42:50 IST 2025
// Change 44: Sun Apr 27 13:42:57 IST 2025
// Change 50: Sun Apr 27 13:43:02 IST 2025
// Change 52: Sun Apr 27 13:43:02 IST 2025
// Change 54: Sun Apr 27 13:43:03 IST 2025
// Change 58: Sun Apr 27 13:43:07 IST 2025
// Change 63: Sun Apr 27 13:43:10 IST 2025
// Change 64: Sun Apr 27 13:43:11 IST 2025
// Change 69: Sun Apr 27 13:43:13 IST 2025
// Change 70: Sun Apr 27 13:43:14 IST 2025
// Change 72: Sun Apr 27 13:43:16 IST 2025
// Change 74: Sun Apr 27 13:43:17 IST 2025
// Change 2: Sun Apr 27 13:45:14 IST 2025
// Change 10: Sun Apr 27 13:45:18 IST 2025
// Change 11: Sun Apr 27 13:45:19 IST 2025
// Change 13: Sun Apr 27 13:45:20 IST 2025
// Change 14: Sun Apr 27 13:45:21 IST 2025
// Change 15: Sun Apr 27 13:45:22 IST 2025
// Change 16: Sun Apr 27 13:45:23 IST 2025
// Change 19: Sun Apr 27 13:45:24 IST 2025
// Change 24: Sun Apr 27 13:45:28 IST 2025
// Change 30: Sun Apr 27 13:45:33 IST 2025
// Change 31: Sun Apr 27 13:45:34 IST 2025
// Change 34: Sun Apr 27 13:45:37 IST 2025
// Change 38: Sun Apr 27 13:45:40 IST 2025
// Change 44: Sun Apr 27 13:45:42 IST 2025
// Change 50: Sun Apr 27 13:45:46 IST 2025
// Change 53: Sun Apr 27 13:45:47 IST 2025
// Change 54: Sun Apr 27 13:45:48 IST 2025
// Change 60: Sun Apr 27 13:45:51 IST 2025
// Change 7: Sun Apr 27 13:45:59 IST 2025
// Change 9: Sun Apr 27 13:45:59 IST 2025
// Change 12: Sun Apr 27 13:46:01 IST 2025
// Change 17: Sun Apr 27 13:46:05 IST 2025
// Change 18: Sun Apr 27 13:46:07 IST 2025
// Change 21: Sun Apr 27 13:46:09 IST 2025
// Change 31: Sun Apr 27 13:46:15 IST 2025
// Change 36: Sun Apr 27 13:46:16 IST 2025
// Change 40: Sun Apr 27 13:46:20 IST 2025
// Change 41: Sun Apr 27 13:46:21 IST 2025
// Change 49: Sun Apr 27 13:46:23 IST 2025
// Change 50: Sun Apr 27 13:46:23 IST 2025
// Change 54: Sun Apr 27 13:46:24 IST 2025
// Change 59: Sun Apr 27 13:46:25 IST 2025
// Change 62: Sun Apr 27 13:46:27 IST 2025
// Change 65: Sun Apr 27 13:46:29 IST 2025
// Change 70: Sun Apr 27 13:46:31 IST 2025
// Change 72: Sun Apr 27 13:46:32 IST 2025
// Change 4: Sun Apr 27 13:47:39 IST 2025
// Change 15: Sun Apr 27 13:47:46 IST 2025
// Change 16: Sun Apr 27 13:47:46 IST 2025
// Change 21: Sun Apr 27 13:47:50 IST 2025
