//
//  ContentView.swift
//  FoodPin
//
//  Created by Artem on 02.06.2023.
//

import SwiftUI

struct RestaurantListView: View {
    var restaurantNames = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster",
                           "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino",
                           "upstate", "traif", "graham", "waffleandwolf", "fiveleaves",
                           "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var body: some View {
        List {
            ForEach(restaurantNames.indices, id: \.self) { index in
                Text(restaurantNames[index])
            }
        }
        .listStyle(.plain)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
