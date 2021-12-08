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
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.offWhite)
                        .frame(width: 320, height: 80)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                        .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
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
}
struct ServerRowView_Previews: PreviewProvider {
    static var previews: some View {
        let connection = ServerConnection(url: "revelup.com/lucid-dream-machine", requestType: "POST", status: "404", time: "12:10")
        ServerRowView(serverConnection: connection)
            .previewLayout(.fixed(width: 370, height: 100))
    }
}
