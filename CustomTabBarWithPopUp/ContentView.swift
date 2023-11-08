//
//  ContentView.swift
//  CustomTabBarWithPopUp
//
//  Created by Andy Kruch on 08.11.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @ObservedObject var router = ViewRouter()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                
                Spacer()
                
                router.view
                
                Spacer()
                
                HStack {
                    TabIcon(viewModel: .home, router: router)
                    TabIcon(viewModel: .search, router: router)
                    
                    TabMenuIcon(showMenu: $showMenu)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                    
                    TabIcon(viewModel: .notifications, router: router)
                    TabIcon(viewModel: .account, router: router)
                }
                .frame(height: UIScreen.main.bounds.height / 8)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray5))
                
            }
             
            if showMenu {
                 PopUpMenu()
                     .padding(.bottom, 144)
             }
        }
         .ignoresSafeArea()
         .preferredColorScheme(.dark)
    }
}

struct TabMenuIcon: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: -42) {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 66, height: 66)
                    .shadow(radius: 4)
                
                Image(systemName: showMenu ? "chevron.down.circle.fill" : "chevron.up.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(.systemBlue))
                    //.rotationEffect(Angle(degrees: showMenu ? 180 : 0)) анимация поворота
            }
            .offset(y: -50)
            
            Text("Services")
                .foregroundColor(.white)
                .font(.headline)
        }
        
        
    }
}


struct TabIcon: View {
    let viewModel: TabBarViewModel
    @ObservedObject var router: ViewRouter
    
    var body: some View {
        VStack {
            Button {
                router.currentItem = viewModel
            } label: {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame( width: 20, height: 20)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
            }
            Text(viewModel.title)
                .foregroundColor(.white)
                .font(.footnote)
        }
        
    }
}

#Preview {
    ContentView(router: ViewRouter())
}
