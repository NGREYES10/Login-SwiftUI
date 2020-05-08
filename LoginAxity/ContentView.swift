//
//  ContentView.swift
//  LoginAxity
//
//  Created by Narciso Reyes on 07/05/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var logeado = false
    var body: some View {
        return Group{
            if  logeado {
                User(logeado: self.$logeado)
            }else{
                Login(logeado: self.$logeado)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
