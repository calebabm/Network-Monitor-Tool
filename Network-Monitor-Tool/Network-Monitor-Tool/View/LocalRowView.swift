//
//  LocalRowView.swift
//  Network-Monitor-Tool
//
//  Created by Caleb Meurer on 12/7/21.
//

import SwiftUI

struct LocalRowView: View {
    
    var localConnection: LocalConnection
    @State var tapped = false
    
    var body: some View {
        ZStack {
            if tapped {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.offWhite)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 4)
                                      .blur(radius: 4)
                                      .offset(x: 2, y: 2)
                                      .mask(RoundedRectangle(cornerRadius: 25)
                                                .fill(LinearGradient(Color.black, Color.clear)))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white, lineWidth: 4)
                                        .blur(radius: 4)
                                        .offset(x: -2, y: -2)
                                        .mask(RoundedRectangle(cornerRadius: 25)
                                                .fill(LinearGradient(Color.clear, Color.black)))
                    )
                    .frame(width: 350, height: 80)
                    .onTapGesture {
                        tapped.toggle()
                    }
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.offWhite)
                    .frame(width: 350, height: 80)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 10, y: 10)
                    .shadow(color: Color.white.opacity(0.4), radius: 5, x: -5, y: -5)
                    .onTapGesture {
                        tapped.toggle()
                    }
            }
            Section {
                NavigationLink(isActive: $tapped) {
                    EmptyView()
                } label: {
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
                            Text(localConnection.time)
                                .font(.system(size: 12))
                        }
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
