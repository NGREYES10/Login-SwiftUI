//
//  Login.swift
//  LoginAxity
//
//  Created by Narciso Reyes on 07/05/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import SwiftUI

struct Login: View {
    @State private var showAlert: Bool = false
    @ObservedObject var login = LoginNet()
    @State private var email = ""
    @State private var pass = ""
    @Binding var logeado : Bool
    
 
    
    var body: some View {
        VStack{
            HStack{
                
                Text("Iniciar Sesión")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    
                
            }.background(Color.gray.opacity(0.2).padding(/*@START_MENU_TOKEN@*/.top, 1.0/*@END_MENU_TOKEN@*/))
                .frame(width: 900, height: 50)
                .offset(y: -130)
            
            HStack (alignment: .center, spacing: 30){
                Image(systemName: "person.circle")
                TextField("Email", text: self.$email)
                .frame(width: 250, height: 50)
            }.offset(y: -30)
            
            HStack(alignment: .center, spacing: 30){
                Image(systemName: "lock")
                SecureField("Password", text: self.$pass)
                    .frame(width: 250, height: 50)
            }.offset(y: -30)
                
            Button(action:{
                    self.showAlert.toggle()
                       self.login.loginDetail(email: self.email, pass: self.pass)
                        if self.login.authenticated == 1 {
                            print("Te logeaste")
                            
                            self.logeado = true
                        }else if self.login.authenticated == 2{
                             print("No login")
                                
                           }
                   }){
                    Text("Entrar")
                    .padding(50)
                    .frame(width: 300, height: 40)
                    .background(Color.black)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .offset(y: 70)
                    
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(logeado: .constant(false))
    }
}
