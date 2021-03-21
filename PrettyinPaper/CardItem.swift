//
//  CardItem.swift
//  PrettyinPaper
//
//  Created by Conor Andrews on 08/03/2021.
//

import SwiftUI

struct CardItem: View {
    
    var card: Card
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            Image(card.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(10)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(card.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                Text(card.description)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                    .frame(height: 40)
            }
        }
    }
}

struct CardItem_Previews: PreviewProvider {
    static var previews: some View {
        CardItem(card: cardData[0])
    }
}
