//
//  ContentView.swift
//  CreditCard
//
//  Created by admin on 10/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var degree: Double = 0
    @State private var flipped: Bool = false

    @State private var name: String = ""
    @State private var expires: String = ""
    @State private var cvv: String = ""
    
    var body: some View {
        CreditCard {
            Group {
                if flipped {
                    CreditCardBack(cvv: cvv)
                } else {
                    CreditCardFront(name: name, expire: expires)
                }
            }
        }.rotation3DEffect(
            .degrees(degree),
            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
        ).onTapGesture {
            withAnimation {
                degree += 180
                flipped.toggle()
            }
        }
        
        TextField(text: $name) {
            Text("Name")
        }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.top, .leading, .trailing])
        
        TextField(text: $expires) {
            Text("Expiration")
        }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.top, .leading, .trailing])
        
        TextField("CVV", text: $cvv.max(3)) { editingChanged in
            withAnimation {
                degree += 180
                flipped.toggle()
            }
        }onCommit: {
        }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.leading, .trailing])
        
        
    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(limit))
            }
        }
        return self
    }
}

#Preview {
    ContentView()
}
