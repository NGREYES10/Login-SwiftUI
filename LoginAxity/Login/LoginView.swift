//
//  Login.swift
//  LoginAxity
//
//  Created by Narciso Reyes on 07/05/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import SwiftUI

struct Login: View {
    
    @ObservedObject var login = LoginNet()
    @State private var email = ""
    @State private var pass = ""
    @Binding var logeado : Bool
    
    
    
    var body: some View {
        VStack{
                   TextField("Email", text: self.$email)
                   SecureField("Password", text: self.$pass)
                   Button(action:{
                       self.login.loginDetail(email: self.email, pass: self.pass)
                        if self.login.authenticated == 1 {
                            print("Entro")
                            self.logeado = true
                        }else if self.login.authenticated == 2{
                               print("Error no entro")
                           }
                   }){
                       Text("Entrar")
                   }
               }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(logeado: .constant(false))
    }
}
