//
//  ContentView.swift
//  SwiftGenericNetworkLayer
//
//  Created by Necati Alperen IŞIK on 10.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            NetworkManager.shared.getUser { result in
                switch result {
                case .success(let success):
                    success.forEach { user in
                        print(user.name)
                    }
                    
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
