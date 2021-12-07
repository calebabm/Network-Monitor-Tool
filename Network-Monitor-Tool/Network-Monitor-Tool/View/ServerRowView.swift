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
                    VStack{
                        Text("URL")
                            .font(.system(size: 14))
                        Text(serverConnection.url)
                            .font(.system(size: 12))
                    }
                    VStack {
                        Text("Request Type")
                            .font(.system(size: 14))
                        Text(serverConnection.requestType)
                            .font(.system(size: 12))
                    }
                    VStack {
                        Text("Status")
                            .font(.system(size: 14))
                        Text(serverConnection.status)
                                .font(.system(size: 12))
                    }
                    VStack {
                        Text("Time")
                            .font(.system(size: 14))
                        Text(serverConnection.timeStamp)
                            .font(.system(size: 12))
                    }
                }
            }
        }
    }
}
struct ServerRowView_Previews: PreviewProvider {
    static var previews: some View {
        let connection = ServerConnection(url: "revelup.com", timeStamp: "12:10", requestType: "POST", status: "404")
        ServerRowView(serverConnection: connection)
            .previewLayout(.fixed(width: 370, height: 100))
    }
}
