//
//  CardDetail.swift
//  PrettyinPaper
//
//  Created by Conor Andrews on 15/03/2021.
//

import SwiftUI

struct CardDetail: View {
    @State private var showingAlert = false
    var card: Card
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack(alignment: .bottom) {
                Image(card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .frame(height: 80)
                    .foregroundColor(.black)
                    .opacity(0.35)
                    .blur(radius: 10)
                
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(card.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                }
                // End of HStack
            }
            // End of ZStack
                .listRowInsets(EdgeInsets())
            
            Text(card.description)
                .foregroundColor(.primary)
                .font(.body)
                .lineLimit(5)
                .padding()
            
            HStack {
                Spacer()
                OrderButton(showAlert: $showingAlert, card: card)
                Spacer()
            }
            .padding(.top, 50)
        }
        // End of ScrollView
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Added to basket!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: cardData.first!)
    }
}

struct OrderButton: View {
    @Binding var showAlert: Bool
    var card: Card
    var body: some View {
        Button(action: {
            self.showAlert.toggle()
        }) {
            Text("Add to basket")
        }
        .frame(width: 200, height: 50)
        .foregroundColor(.white)
        .font(.headline)
        .background(Color.blue)
        .cornerRadius(10)
    }
}
