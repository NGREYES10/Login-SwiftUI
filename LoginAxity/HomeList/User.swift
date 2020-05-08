//
//  UserListUI.swift
//  LoginAxity
//
//  Created by Narciso Reyes on 07/05/20.
//  Copyright © 2020 Narciso Reyes. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct User: View {
    
    @Binding var logeado :  Bool
    
    
    @ObservedObject var manager = listUser()
    var body: some View {
        NavigationView{
            VStack {
              List{
                  ForEach(self.manager.userList){
                      item in
                   NavigationLink(destination: DetailsView(logeado: .constant(false)))
                   {
                       VStack(alignment: .leading)
                       {
                            Text(item.first_name)
                                .font(.title)
                            .bold()
                            Text(item.last_name)
                                .font(.subheadline)
                        }
                       
                   }.navigationBarTitle("Personas", displayMode: .inline)
                    .frame(height: 50)
     
                }

               }

            }
        }
    
    }
}

struct UserListUI_Previews: PreviewProvider {
    static var previews: some View {
        User(logeado: .constant(false))
    }
}
