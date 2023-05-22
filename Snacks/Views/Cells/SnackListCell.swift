//
//  SnackListCell.swift
//  Snacks
//
//  Created by Dogukaim on 19.05.2023.
//

import SwiftUI

struct SnackListCell: View {
    
    let snack: Snack
    var body: some View {
        HStack{

            AsyncImage(url: URL(string:snack.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:120,height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:120,height: 90)
                    .cornerRadius(8)
            }

            
            VStack(alignment: .leading,spacing: 5){
                Text(snack.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(snack.price,specifier: "%.2F")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct SnackListCell_Previews: PreviewProvider {
    static var previews: some View {
        SnackListCell(snack: MockData.sampleSnack) 
    }
}
