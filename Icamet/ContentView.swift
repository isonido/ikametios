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
            ZStack {
                WebView(url: URL(string: "http://vh539762.eurodir.ru")!)
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
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
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
        })
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let source: String = "var meta = document.createElement('meta');" + "meta.name = 'viewport';" + "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" + "var head = document.getElementsByTagName('head')[0];" + "head.appendChild(meta);";
              let script: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
              let userContentController: WKUserContentController = WKUserContentController()
              let conf = WKWebViewConfiguration()
              conf.userContentController = userContentController
              userContentController.addUserScript(script)

        let webView = WKWebView(frame: .zero, configuration: conf)
        //webView.scrollView.pinchGestureRecognizer?.isEnabled = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
        //uiView.scrollView.pinchGestureRecognizer?.isEnabled = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
