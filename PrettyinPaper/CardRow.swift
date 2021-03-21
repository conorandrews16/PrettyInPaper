//
//  CardRow.swift
//  PrettyinPaper
//
//  Created by Conor Andrews on 08/03/2021.
//

import SwiftUI

struct CardRow: View {
    
    var categoryName: String
    var cards: [Card]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(self.categoryName)
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.cards) { card in
                        NavigationLink(destination: CardDetail(card: card)) {
                            CardItem(card: card)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                        }
                    }
                }
            }
        }
    }
}

struct CardRow_Previews: PreviewProvider {
    static var previews: some View {
        CardRow(categoryName: "CARD MAKING KIT", cards: cardData)
    }
}
