//
//  NotaItemView.swift
//  NotiApp
//
//  Created by Ian Alexandro on 12/05/21.
//

import SwiftUI

struct NotaItemView: View {
    
    var id : UUID?
    var titulo : String
    var contenido : String
    
    var body: some View {
        
        VStack (alignment: .leading, spacing: 5.0) {
            Text(titulo)
                .font(.title)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(contenido)
                .font(.body)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }.padding()
        // .background(Color.black.opacity(0.05))
        .foregroundColor(Color.black.opacity(0.6))
        .cornerRadius(6)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NotaItemView_Previews: PreviewProvider {
    static var previews: some View {
        NotaItemView(id: UUID(), titulo: "Test", contenido: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam auctor orci interdum ante ultrices, vitae elementum quam iaculis. Proin ornare pretium blandit. Nam ultricies magna eu mi ullamcorper vestibulum. Nam a congue est. Maecenas in risus ipsum. Suspendisse in odio neque. Vestibulum enim leo, finibus at massa ut, suscipit imperdiet nibh. Suspendisse a orci lacus.")
    }
}
