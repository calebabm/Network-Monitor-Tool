//
//  ServerRowView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/7/21.
//

import SwiftUI

struct ServerRowView: View {
    
    var serverConnection: ServerConnection
    
    var body: some View {
        Section {
            NavigationLink {
                EmptyView()
            } label: {
                HStack {
                    Text(serverConnection.url)
                        .padding()
                        .font(.system(size: 12))
                    Text(serverConnection.requestType)
                        .padding()
                        .font(.system(size: 12))
                    Text(serverConnection.status)
                        .padding()
                        .font(.system(size: 12))
                    Text(serverConnection.time)
                        .font(.system(size: 12))
                }.scaledToFit()
            }
        }
    }
}
struct ServerRowView_Previews: PreviewProvider {
    static var previews: some View {
        let connection = ServerConnection(url: "revelup.com/lucid-dream-machine", requestType: "POST", status: "404", time: "12:10")
        ServerRowView(serverConnection: connection)
            .previewLayout(.fixed(width: 370, height: 100))
    }
}
