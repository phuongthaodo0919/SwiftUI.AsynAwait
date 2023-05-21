//
//  UserListView.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/21/23.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var userListVM = UserListViewModel()
    
    var body: some View {
        List {
            ForEach(userListVM.userList, id: \.id) { item in
                UserView(user: item)
            }
        }
        .task {
            await userListVM.getUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
