//
//  ContentView.swift
//  PrettyinPaper
//
//  Created by Conor Andrews on 01/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var cardListener = CardListener()
    
    var categories: [String : [Card]] {
        .init(
            grouping: cardData,
            by: {$0.category.rawValue}
        )
    }
    
    var body: some View {
        NavigationView {
            
            List(categories.keys.sorted(), id: \String.self) {
                key in
                
                CardRow(categoryName: "\(key)".uppercased(), cards: self.categories[key]!)
                    .frame(height:320)
                    .padding(.top)
                    .padding(.bottom)
            }
            
            .navigationBarTitle(Text("PrettyinPaper"))
            .navigationBarItems(leading:
                Button(action: {
                    print("log out")
                    createMenu()
                }, label: {
                    Text("Log Out")
                }), trailing:
                Button(action: {
                    print("basket")
                }, label: {
                    Image("basket")
                })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
