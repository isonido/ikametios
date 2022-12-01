//
//  ContentView.swift
//  Icamet
//
//  Created by MacBook on 27.11.2022.
//

import SwiftUI
import WebKit
import MessageUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                WebView(url: URL(string: "http://vh539762.eurodir.ru")!)
            }
        }
    }
}

struct Icamet: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Text("это удостоверение личности иностранца, проживающего в Турции.")
                
                Image("cartIkamet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(3)
                
                Text("Официальный сайт для подачи документов:")
                    .padding(1)
                
                Link("Перейти", destination: URL(string: "https://e-ikamet.goc.gov.tr")!)
                
                Spacer()
            }
            .navigationTitle("Икамет")
        }
    }
}

struct FAQ: View {
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Красным цветом выделены зоны, которые не подходят для оформления Икамет")
                
                Image("mapExample")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Text("Официальный список закрытых районов:")
                    .padding(2)
                    
                Link("Перейти", destination: URL(string: "https://www.goc.gov.tr/mahalle-kapatma-duyurusu-hk2")!)
                
                Spacer()

                Text("Нашли ошибку или есть коммерческое предложение?")
                    .padding(2)
                        
                VStack {
                    if MFMailComposeViewController.canSendMail() {
                        Button("Написать") {
                            self.isShowingMailView.toggle()
                            }
                        } else {
                            Text("sonido@mail.ru")
                            }
                        }
                        .sheet(isPresented: $isShowingMailView) {
                        MailView(isShowing: self.$isShowingMailView, result: self.$result)
                        }
                
                Spacer()
                Spacer()
            }
            .navigationTitle("FAQ")
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
                        Image(systemName: "mappin.and.ellipse")
                        Text("Карта")
                    }
                
                Icamet()
                    .tabItem {
                        Image(systemName: "doc.richtext")
                        Text("Икамет")
                    }
                
                FAQ()
                    .tabItem {
                        Image(systemName: "questionmark.square.dashed")
                        Text("FAQ")
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
