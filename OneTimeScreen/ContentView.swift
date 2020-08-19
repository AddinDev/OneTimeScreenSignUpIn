//
//  ContentView.swift
//  precobaan
//
//  Created by addjn on 19/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var needToLogin = UserDefaults.standard.bool(forKey: "isLogin")
    var body: some View {
        
        ZStack {
            LoginView(needToLogin: $needToLogin)
                .opacity(needToLogin ? 0 : 1)
            
            Test(needToLogin: $needToLogin)
                .opacity(needToLogin ? 1 : 0)
            
        }
        .onAppear {
            print(self.needToLogin)
        }
    }
}

struct Test: View {
    @Binding var needToLogin: Bool
    var body: some View {
        Button("Logout") {
            self.needToLogin.toggle()
        }
    }
}

struct LoginView: View {

    @Binding var needToLogin: Bool
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            TextField("enter email", text: $email)
            TextField("pass", text: $password)

            Button(action: {
                withAnimation {
                    self.needToLogin.toggle()
                    UserDefaults.standard.set(self.needToLogin, forKey: "isLogin")
                    print(self.needToLogin)
                }

            }) {
                Text("Log in!")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
