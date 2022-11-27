//
//  ContentView.swift
//  Icamet
//
//  Created by MacBook on 27.11.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.brown
            }
        }
    }
}

struct HelpView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
            }
        }
    }
}

struct AboutView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Карта")
                }
            
            HelpView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Help")
                }
            
            AboutView()
                .tabItem {
                    Image(systemName: "house")
                    Text("About")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
