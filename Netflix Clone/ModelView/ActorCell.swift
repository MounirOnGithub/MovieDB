//
//  ActorCell.swift
//  Netflix Clone
//
//  Created by Mounir Khanouri on 16/11/2023.
//

import SwiftUI

struct ActorCell: View {
    let actor: Actor
    
    var body: some View {
        VStack(spacing: 12) {
            image
            name
        }
    }
    
    private var image: some View {
        AsyncImage(url: actor.pictureURL) { image in
            image
                .resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Circle()
                .foregroundColor(.cellBackground)
        }
        .frame(width: 80, height: 80)
    }
    
    private var name: some View {
        VStack(spacing: 4) {
            Text(actor.name)
                .font(.system(size: 18))
                .foregroundColor(.primaryText)
            Text(actor.characterName)
                .foregroundColor(.secondaryText)
        }
    }
}

#Preview {
    ActorCell(actor: Actor.preview)
}
