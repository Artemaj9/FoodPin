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
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier",                                      "bourkestreetbakery", "haigh", "palomino", "upstate",
                            "traif", "graham", "waffleandwolf",
                            "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    
    var body: some View {
        List {
            ForEach(restaurantNames.indices, id: \.self) { index in
                HStack(alignment: .top, spacing: 20) {
                    Image(restaurantImages[index])
                        .resizable()
                        .frame(width: 120, height: 118)
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Text(restaurantNames[index])
                            .font(.system(.title2,design: .rounded))
                        Text("Type")
                            .font(.system(.body,design: .rounded))
                        Text("Location")
                            .font(.system(.body,design: .rounded))
                            .foregroundColor(.gray)
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
