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
        VStack(alignment: .leading, content: {
            HStack(alignment: .top, content: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.white)
                Spacer()
                Text("VISA")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            })
            
            Spacer()
            
            Text("**** **** **** 2864")
                .foregroundColor(.white)
                .font(.system(size: 32))
                .fontWeight(.bold)
            Spacer()
            
            HStack {
                VStack(alignment: .leading, content: {
                    Text("CARD HOLDER")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text("LE TRONG BINH")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                })
                
                Spacer()
                
                VStack {
                    Text("EXPIRES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    Text("02/23")
                        .font(.caption)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
            }
            
        }).frame(width: 300, height: 200)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)).cornerRadius(10)
    }
}

struct CreditCardBack: View {
    var body: some View {
        VStack(content: {
            Rectangle()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 20)
                .padding([.top])
            
            Spacer()
            
            HStack {
                Text("123").foregroundColor(.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                    ).padding(5)
                    .frame(width: 100, height: 20)
                    .background(.white)
                
                Spacer()
            }.padding()
        }).frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .leading, endPoint: .trailing)).cornerRadius(10)
    }
}

#Preview {
    CreditCard {
        CreditCard {
            CreditCardBack()
        }
    }
}
