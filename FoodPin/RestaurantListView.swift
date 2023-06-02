//
//  ContentView.swift
//  FoodPin
//
//  Created by Artem on 02.06.2023.
//

import SwiftUI

struct RestaurantListView: View {
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster","forkee","posatelier","bourkestreetbakery", "haigh", "palomino", "upstate","traif", "graham","waffleandwolf","fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong","Sydney", "Sydney", "Sydney","New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian/ Causual Drink", "French", "Bakery", "Bakery","Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    
    var body: some View {
        List {
            ForEach(restaurantNames.indices, id: \.self) { index in
                FullImageRow(isFavorite: $restaurantIsFavorites[index], imageName: restaurantImages[index], name: restaurantNames[index], type: restaurantTypes[index], location: restaurantLocations[index])
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
        
        RestaurantListView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Restaurant List View (Dark)")
    }
}

struct FullImageRow: View {
    @State private var  showOptions = false
    @State private var showEror = false
    @Binding var isFavorite: Bool
    var imageName: String
    var name : String
    var type : String
    var location: String
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(20)
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(.title2,design: .rounded))
                    Text(type)
                        .font(.system(.body,design: .rounded))
                    Text(location)
                        .font(.system(.body,design: .rounded))
                        .foregroundColor(.gray)
                }
                if isFavorite {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        
                }
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
                Button("Reserve a table") {
                    self.showEror.toggle()
                }
                
                Button("Mark as favorite") {
                    self.showEror.toggle()
                }
            
                Button("Mark as favorite 2") {
                    self.isFavorite.toggle()
                }
                Button("Are you Daldon?") {
                    self.showEror.toggle()
                }
               
        }
        .alert("Not available for Daldons!", isPresented: $showEror) {
            Button("OK") {}
        } message: {
            Text("Sorry, but you are great Daldoon! Please retry later.")
        }
    }
}
