//
//  CreditCard.swift
//  CreditCard
//
//  Created by admin on 10/07/2024.
//

import SwiftUI

struct CreditCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct CreditCardFront: View {
    var body: some View {
        VStack(content: {
            Text("FRONT").foregroundColor(.white)
        }).frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)).cornerRadius(10)
    }
}

struct CreditCardBack: View {
    var body: some View {
        VStack(content: {
            Text("BACK").foregroundColor(.white)
        }).frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .leading, endPoint: .trailing)).cornerRadius(10)
    }
}

#Preview {
    CreditCard {
        CreditCardFront()
    }
}
