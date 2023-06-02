//
//  ContentView.swift
//  FoodPin
//
//  Created by Artem on 02.06.2023.
//

import SwiftUI

struct RestaurantListView: View {
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
  /*  var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster","forkee","posatelier","bourkestreetbakery", "haigh", "palomino", "upstate","traif", "graham","waffleandwolf","fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong","Sydney", "Sydney", "Sydney","New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian/ Causual Drink", "French", "Bakery", "Bakery","Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee &Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"] */
    
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isFavorite: false,isSuper: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:"homei", isFavorite: false,isSuper: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false,isSuper: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false,isSuper: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false,isSuper: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee", isFavorite: false,isSuper: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false,isSuper: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false,isSuper: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh", isFavorite: false,isSuper: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino", isFavorite: false,isSuper: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false,isSuper: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false,isSuper: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham", isFavorite:false,isSuper: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf", isFavorite: false,isSuper: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false,isSuper: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false,isSuper: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false,isSuper: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false,isSuper: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false,isSuper: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false,isSuper: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask", isFavorite: false,isSuper: false)
    ]
    var body: some View {
        List {
            ForEach(restaurants.indices, id: \.self) { index in
                FullImageRow(restaurant: $restaurants[index])
                    .swipeActions(edge: .leading, allowsFullSwipe: false, content : {
                        Button {
                            
                        } label: {
                            Image(systemName: "cloud.drizzle.fill")
                        }
                        .tint(.blue)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "carrot.fill")
                                .resizable(resizingMode: .tile)
                                .foregroundColor(.orange)
                            
                        }
                        .tint(.orange)
                    })
                    /*.swipeActions(edge: .trailing, allowsFullSwipe: false, content : {
                        Button {
                            
                        } label: {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        .tint(.blue)
                    }) */
            }
           .onDelete(perform: { indexSet in
                restaurants.remove(atOffsets: indexSet)
            }) 
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
    @State private var showEror2 = false
    @State private var show3 = false
    @State private var show4 = false
    /* var imageName: String
     var name : String
     var type : String
     var location: String
     @Binding var isFavorite: Bool*/
    @Binding var restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(20)
            HStack {
                VStack(alignment: .leading) {
                    Text(restaurant.name)
                        .font(.system(.title2,design: .rounded))
                    Text(restaurant.type)
                        .font(.system(.body,design: .rounded))
                    Text(restaurant.location)
                        .font(.system(.body,design: .rounded))
                        .foregroundColor(.gray)
                }
                .contextMenu {
                    Button (action: {
                        self.showEror.toggle()
                    }) {
                        HStack{
                            Text("Call us, Daldonus!")
                            Image(systemName: "phone")
                        }
                    }
                    Button (action: {
                        self.show4.toggle()
                    }) {
                        HStack{
                            Text("Share")
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }
                
                if restaurant.isFavorite && restaurant.isSuper {
                    Spacer()
                
                    Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    
                } else {
                    if restaurant.isFavorite {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        
                    }
                    if restaurant.isSuper {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                    }
                }
            }
        }
            .onTapGesture {
                showOptions.toggle()
            }
            .confirmationDialog("What do you want to do?", isPresented: $showOptions, titleVisibility: .visible) {
                Button("Reserve a table") {
                    self.showEror.toggle()
                    if restaurant.isFavorite && restaurant.isSuper {
                        self.show3 = true
                    }
                }
                Button(restaurant.isSuper ? "I don't like it anymore!" : "Mark as favorite") {
                    self.restaurant.isSuper.toggle()
                }
                
                Button(restaurant.isFavorite ? "Delete from favorites" : "Mark as favorite 2") {
                    self.restaurant.isFavorite.toggle()
                }
                Button("Are you Daldon?") {
                    self.showEror2.toggle()
                }
                
            }
          .alert(restaurant.isFavorite && restaurant.isSuper ? "Welcome!": "Not available for Daldons!", isPresented: $showEror) {
                Button("OK") {}
            } message: {
                Text(restaurant.isFavorite && restaurant.isSuper ? "You are not a Daldon! Congratulations!" : "Sorry, but you are great Daldoon! Please retry later.")
            }
            .alert(show3 ? "NO!" : "YES!", isPresented: $showEror2) {
                Button("OK") {}
            } message: {
                Text( show3 ? "You are great person!" : "You definetly 100% Daldonierius!")
            }
            .sheet(isPresented: $show4) {
                let defaultText = "Just checking in at \(restaurant.name)"
                
                if let imageToShare = UIImage(named: restaurant.image) {
                    ActivityView(activityItems: [defaultText, imageToShare])
                } else {
                    ActivityView(activityItems: [defaultText])
                }
            }
        }
    }

