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
        Section {
            NavigationLink {
                EmptyView()
            } label: {
                HStack {
                    VStack{
                        Text("State")
                            .font(.system(size: 14))
                        Text(localConnection.state)
                            .font(.system(size: 12))
                    }
                    VStack {
                        Text("Host")
                            .font(.system(size: 14))
                        Text(localConnection.host)
                            .font(.system(size: 12))
                    }.frame(maxWidth: .infinity)
                    VStack {
                        Text("Clients")
                            .font(.system(size: 14))
                        ForEach(localConnection.clients, id: \.self) { client in
                            Text(client)
                                .font(.system(size: 12))
                        }
                    }.frame(maxWidth: .infinity)
                    VStack {
                        Text("Time")
                            .font(.system(size: 14))
                        Text(localConnection.time)
                            .font(.system(size: 12))
                    }
                }.scaledToFill()
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
