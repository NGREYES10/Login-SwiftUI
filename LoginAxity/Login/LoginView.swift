//
//  Login.swift
//  LoginAxity
//
//  Created by Narciso Reyes on 07/05/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable{
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}


struct Login: View {
    
    @State private var showAlert: Bool = false
    @ObservedObject var login = LoginNet()
    @State private var email = ""
    @State private var pass = ""
    @Binding var logeado : Bool
    
    var alert: Alert {
        Alert(title: Text("ALERTA"), message: Text("Tu correo y/o contraseña no estan en nuestra base de datos favor de validar nuevamente"), dismissButton: .default(Text("Aceptar")
            ))
    }
    
    var body: some View {
        
        ZStack{
            
            Image("demo")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VisualEffectView(effect:UIBlurEffect(style: .regular))
            
            
            VStack{
               VStack{
                Image("mano")
                   Text("Iniciar Sesión")
                       .font(.largeTitle)
                       .fontWeight(.light)
                       .foregroundColor(.black)
               }.offset(y: 60)
                   
               HStack (alignment: .center, spacing: 30){
                   Image(systemName: "envelope.fill")
                   TextField("Email", text: self.$email)
                   .frame(width: 250, height: 50)
               }.offset(y: 100)
               
               HStack(alignment: .center, spacing: 30){
                   Image(systemName: "lock.fill")
                   SecureField("Password", text: self.$pass)
                       .frame(width: 250, height: 50)
                   
               }.offset(y: 100)
               
               Button(action:{
                   self.login.loginDetail(email: self.email, pass: self.pass)
                           if self.login.authenticated == 1 {
                            self.logeado = true
                               print("Datos correctos has iniciado sesión")
                               
                           }else if self.login.authenticated == 2{
                                print("Usuario y/o contraseña invalidos")
                                self.showAlert.toggle()
                              }
                }){
                       Text("Entrar")
                       .frame(width: 300, height: 40)
               } .padding(50)
                  .frame(width: 300, height: 40)
                  .background(Color.black)
                  .cornerRadius(10)
                  .foregroundColor(.white)
                  .offset(y: 200)
           .padding()
           Spacer()
            }
        
        }.alert(isPresented: self.$showAlert, content: {self.alert})
    }
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(logeado: .constant(false))
    }
}
