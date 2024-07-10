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
    
    var body: some View {
        CreditCard {
            Group {
                if flipped {
                    CreditCardBack()
                } else {
                    CreditCardFront()
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
    }
}

#Preview {
    ContentView()
}
