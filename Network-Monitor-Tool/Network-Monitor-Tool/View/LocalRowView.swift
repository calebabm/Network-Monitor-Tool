//
//  LocalRowView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/7/21.
//

import SwiftUI

struct LocalRowView: View {
    
    var localConnection: LocalConnection
    
    var body: some View {
        ZStack {
            Section {
                NavigationLink {
                    EmptyView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.offWhite)
                            .frame(width: 320, height: 80)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                        HStack {
                            Text(localConnection.state)
                                .font(.system(size: 12))
                            
                            Text(localConnection.host)
                                .font(.system(size: 12))
                            VStack {
                                ForEach(localConnection.clients, id: \.self) { client in
                                    Text(client)
                                        .font(.system(size: 12))
                                }
                            }
                            .padding()
                            Text(localConnection.time)
                                .font(.system(size: 12))
                        }.scaledToFit()
                    }.scaledToFit()
                }
            }            
        }
    }
}

struct LocalRowView_Previews: PreviewProvider {
    static var previews: some View {
        let connection = LocalConnection(time: "12:14", state: "Offline", host: "172.20.10.3", client: ["172.20.10.10", "172.20.10.11", "172.20.10.12"])
        LocalRowView(localConnection: connection)
            .previewLayout(.fixed(width: 370, height: 100))
    }
}
