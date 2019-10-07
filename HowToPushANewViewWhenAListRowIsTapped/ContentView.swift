//
//  ContentView.swift
//  HowToPushANewViewWhenAListRowIsTapped
//
//  Created by ramil on 07/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
}

struct RestaurantView: View {
    var restaurant: Restaurant

    var body: some View {
        Text("Come and eat at \(restaurant.name)")
            .font(.largeTitle)
    }
}

struct RestaurantRow: View {
    var restaurant: Restaurant

    var body: some View {
        Text(restaurant.name)
    }
}

struct ContentView: View {
    var body: some View {
        let first = Restaurant(name: "Joe's Original")
        let restaurants = [first]

        return NavigationView {
            List(restaurants) { restaurant in
                NavigationLink(destination: RestaurantView(restaurant: restaurant)) {
                    RestaurantRow(restaurant: restaurant)
                }
            }.navigationBarTitle("Select a restaurant")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
