//
//  DetailView.swift
//  DetailView
//
//  Created by Marc Aupont on 8/7/21.
//

import SwiftUI

struct DetailView: View {
    
    var breakingBadCharacter: BreakingBadCharacter
    var body: some View {
        AsyncImage(url: breakingBadCharacter.img) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 50)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
