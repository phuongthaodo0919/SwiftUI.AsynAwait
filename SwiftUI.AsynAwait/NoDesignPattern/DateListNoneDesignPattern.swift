//
//  DateList.swift
//  SwiftUI.AsynAwait
//
//  Created by Salmdo on 5/20/23.
//

import SwiftUI

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}


struct DateListNoneDesignPattern: View {
    
    @State private var currentDates: [CurrentDate] = []
    
    private func getDate() async throws -> CurrentDate? {
        guard let url = URL(string: "https://current-date.glitch.me/current-date") else {
            fatalError("Url is incorrect")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try? JSONDecoder().decode(CurrentDate.self, from: data)
    }
    
    private func populateDates() async {
        do {
            guard let currentDate = try await getDate() else { return }
            
            currentDates.append(currentDate)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List(currentDates) { item in
                Text("\(item.date)")
            }.listStyle(.plain)
            
                .navigationTitle("Dates")
                .navigationBarItems(trailing: Button(action: {
                    Task.init(operation: {
                        await populateDates()
                    })
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                })
                )
                .task {
                    await populateDates()
                }
        }
    }
}

struct DateList_Previews: PreviewProvider {
    static var previews: some View {
        DateListNoneDesignPattern()
    }
}
