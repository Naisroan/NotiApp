//
//  DataByCategoryView.swift
//  NotiApp
//
//  Created by Ian Alexandro on 12/05/21.
//

import SwiftUI

struct DataByCategoryView: View {
    
    @Binding var IdCategory : Int
    
    var body: some View {
        GeometryReader {_ in
            
            if self.IdCategory <= 0 {
                
                Text("No ha seleccionado una categoría")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .fontWeight(.light)
                    .font(.title3)
                    .padding()
            }
            else if self.IdCategory > 0 {
                
                
            }
        }
    }
}

struct DataByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        DataByCategoryView(IdCategory: .constant(0))
    }
}
