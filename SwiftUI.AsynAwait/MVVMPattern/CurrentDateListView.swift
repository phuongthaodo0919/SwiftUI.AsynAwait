//
//  CurrentDateListView.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/20/23.
//

import SwiftUI

struct CurrentDateListView: View {
    @ObservedObject var currentDateListVM = CurrentDateListViewModel()
    
    var body: some View {
        NavigationView {
            List(currentDateListVM.currentDates, id: \.id) { item in
                Text("\(item.date)")
            }.listStyle(.plain)
            
                .navigationTitle("Dates with MVVM")
                .navigationBarItems(trailing: Button(action: {
                    Task.init(operation: {
                        await currentDateListVM.populateDates()
                    })
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                })
                )
                .task {
                    await currentDateListVM.populateDates()
                }
        }
    }
}

struct CurrentDateListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentDateListView()
    }
}
