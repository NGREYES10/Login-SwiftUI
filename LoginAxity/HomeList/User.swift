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
    @ObservedObject var manager = DetailsNetwork()
    var body: some View {
        NavigationView{
            VStack{
                List(self.manager.userList){
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
                    
                    .navigationBarTitle("UserList", displayMode: .inline)
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
