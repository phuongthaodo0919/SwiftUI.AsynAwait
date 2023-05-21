//
//  UserView.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/21/23.
//

import SwiftUI

struct UserView: View {
    let user: UserViewModel
    var body: some View {
        
        VStack(alignment: .leading){
            Text(user.name)
                .font(.title)
            Text(user.username)
            Text(user.email)
            Text(user.street)
            Text(user.suite)
            Text(user.city)
            Text(user.phone)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: UserViewModel(user:
                    User(id: 1, name: "Salm", username: "SalmDo", email: "wew@gmail.com", address: Address(street: "123 Burlington", suite: "Jiki", city: "FF"), phone: "1-770-736-8031 x56442")))
    }
}
