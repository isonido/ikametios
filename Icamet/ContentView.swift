//
//  ContentView.swift
//  Icamet
//
//  Created by MacBook on 27.11.2022.
//

import SwiftUI
import WebKit

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                WebView(url: URL(string: "http://vh539762.eurodir.ru")!).frame(height: 500.0)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.3), radius: 20.0, x: 5, y: 5)
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
    @State private var showWebView = false
    //private let urlString: String = "http://vh539762.eurodir.ru"
    
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

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
