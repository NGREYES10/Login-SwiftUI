//
//  DetailsView.swift
//  LoginAxity
//
//  Created by Narciso Reyes on 07/05/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailsView: View {
    
   
    @Binding var logeado :  Bool
    @ObservedObject var managers = DetailsNetwork()
    
    var body: some View {
       VStack{
          List(self.managers.userDetails){
              user in
              HStack{
                  AnimatedImage(url: URL(string: user.avatar))
                  .resizable()
                  .frame(width: 70, height: 70)
                  .clipShape(Circle())
                  VStack(alignment: .leading){
                      Text(user.first_name)
                          .font(.title)
                      .bold()
                      Text(user.email)
                          .font(.subheadline)
                  }
              }
          .navigationBarTitle("Detalles", displayMode: .inline)
          }
      }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(logeado: .constant(false))
    }
}
