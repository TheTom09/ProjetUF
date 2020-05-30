//
//  Cell.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI

struct TextCell: View {
  let title: String
  @Binding var value: String
  var editable: Bool = true
  var body: some View {
    HStack {
      Text(title)
      if editable {
        TextField(title, text: $value)
          .multilineTextAlignment(.trailing)
      } else {
        Spacer()
        Text(value)
      }
    }
  }
}
struct IntCell: View {
  let title: String
  @Binding var value: Int?
  var suffix: String = ""
  var editable: Bool = true
  @State private var errorString = ""
  @State private var error = false
  let allowEmpty: Bool
  
  init(title: String, value: Binding<Int>, suffix: String = "", editable: Bool = true) {
    self.init(title: title, value: Binding(get: { () -> Int? in
      value.wrappedValue
    }, set: {
      value.wrappedValue = $0 ?? 0
    }), suffix: suffix, editable: editable, allowEmpty: false)
  }
  
  init(title: String, value: Binding<Int?>, suffix: String = "", editable: Bool = true) {
    self.init(title: title, value: value, suffix: suffix, editable: editable, allowEmpty: true)
  }
  
  private init(title: String, value: Binding<Int?>, suffix: String, editable: Bool, allowEmpty: Bool) {
    self.title = title
    self._value = value
    self.suffix = suffix
    self.editable = editable
    self.allowEmpty = allowEmpty
  }
  
  var stringValue: String {
    self.value.flatMap { String($0) } ?? ""
  }
  
  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      Text(title)
      Spacer()
      if editable {
        TextField(title, text: Binding(get: {
          self.error ? self.errorString : self.stringValue
        }, set: { new in
          if new.isEmpty && self.allowEmpty {
            self.value = nil
            self.error = false
          } else if let value = Int(new) {
            self.value = value
            self.error = false
          } else {
            self.errorString = new
            self.error = true
          }
        })).keyboardType(.numberPad)
          .foregroundColor(error ? .red : Color(.label))
        .multilineTextAlignment(.trailing)
      } else {
        Text(self.stringValue)
      }
      Text(suffix)
    }
  }
}
struct EnumCell<Value>: View where Value: CaseIterable, Value: Hashable, Value: CustomStringConvertible, Value.AllCases.Index == Int {
  let title: String
  @Binding var value: [Value]
  var editable: Bool
  private var multi: Bool
  @State private var popover = false
  
  init(title: String, value: Binding<[Value]>, editable: Bool = true) {
    self.title = title
    self._value = value
    self.editable = editable
    self.multi = true
  }
  
  init(title: String, value: Binding<Value>, editable: Bool = true) {
    self.title = title
    self._value = Binding(get: { [value.wrappedValue] }, set: { value.wrappedValue = $0.last! })
    self.editable = editable
    self.multi = false
  }
  
  var body: some View {
    TextCell(title: title, value: .constant(value.map({ $0.description }).joined(separator: ", ")), editable: false)
      .onTapGesture {
        if self.editable {
          self.popover = true
        }
    }
      .sheet(isPresented: $popover) {
        NavigationView {
          List(0..<Value.allCases.count) { index in
              HStack {
                Text(Value.allCases[index].description)
                Spacer()
                if self.value.contains(Value.allCases[index]) {
                  Image(systemName: "checkmark.circle.fill")
                }
              }.onTapGesture {
                if !self.value.contains(Value.allCases[index]) {
                  self.value.append(Value.allCases[index])
                  if !self.multi && self.value.count > 1 {
                    self.value.removeFirst()
                  }
                } else if self.multi {
                  self.value.removeAll(where: { $0 == Value.allCases[index] })
                }
            }
          }.navigationBarTitle(self.title)
            .navigationBarItems(trailing: Button(action: {
              self.popover = false
            }, label: {
              Text("OK")
            }))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
  }
}

struct DateCell: View {
  let title: String
  @Binding var date: Date
  var isEditable: Bool = true
  
  var body: some View {
    HStack {
      if isEditable {
        DatePicker(selection: $date, displayedComponents: .date, label: { Text(self.title) })
          .datePickerStyle(WheelDatePickerStyle())
      } else {
        Text(self.title)
        Spacer()
        Text(DateFormatter.localizedString(from: self.date, dateStyle: .long, timeStyle: .none))
      }
    }
  }
}
