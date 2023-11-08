//
//  PopUpMenu.swift
//  CustomTabBarWithPopUp
//
//  Created by Andy Kruch on 08.11.23.
//

import SwiftUI

struct PopUpMenu: View {
    var body: some View {
        HStack(spacing: 24) {
            Spacer()
            
            ForEach(MenuViewModel.allCases, id: \.self) { item in
                MenuItem(viewModel: item)
            }
            
            Spacer()
        }
    }
}

enum MenuViewModel: Int, CaseIterable {
    case share
    case save
    case add
    case download
    
    var imageName: String {
        switch self {
        case .share: return "paperplane.fill"
        case .save: return "bookmark.fill"
        case .add: return "plus.rectangle.fill.on.rectangle.fill"
        case .download: return "square.and.arrow.down.fill"
        }
    }
    
    var title: String {
        switch self {
        case .share:
            return "Share"
        case .save:
            return "Save"
        case .add:
            return "Add"
        case .download:
            return "Download"
            
        }
    }
}


struct MenuItem: View {
    let viewModel: MenuViewModel
    let dimension: CGFloat = 48
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ZStack {
                Circle()
                    .foregroundColor(Color(.systemBlue))
                    .frame(width: dimension, height: dimension)
                    .shadow(radius: 4)
                
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(12)
                    .frame(width: dimension, height: dimension)
                    .foregroundColor(Color(.white))

            }
            
            Text(viewModel.title)
                .foregroundColor(.white)
                .font(.footnote)
        }
    }
}


struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMenu()
    }
}
