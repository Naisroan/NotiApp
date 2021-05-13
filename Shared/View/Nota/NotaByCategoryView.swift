//
//  DataByCategoryView.swift
//  NotiApp
//
//  Created by Ian Alexandro on 12/05/21.
//

import SwiftUI

struct NotaByCategoryView: View {
    
    @FetchRequest(entity: Nota.entity(), sortDescriptors: [NSSortDescriptor(keyPath:\ Nota.titulo, ascending: true)]) var list : FetchedResults<Nota>
    
    @Binding var id_categoria : Int
    @Binding var id_nota : UUID?
    @Binding var show_nota : Bool
    @Binding var nota : Nota?
    
    var body: some View {
        GeometryReader {_ in
            
            if self.id_categoria <= 0 {
                
                Text("No ha seleccionado una categoría")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .fontWeight(.light)
                    .font(.title3)
                    .padding()
            }
            else if self.id_categoria > 0 {
                
                NavigationView {
                    
                    List {
                        
                        if (!self.list.isEmpty) {
                            
                            ForEach (self.list) { nodo in
                                
                                if nodo.id_categoria == self.id_categoria {
                                    
                                    Button(action: {
                                        
                                        id_nota = nodo.id
                                        nota = nodo
                                        show_nota = true
                                        
                                        print ("Nota ID: \(nodo.id)")
                                        
                                    }, label: {
                                        NotaItemView(titulo: nodo.titulo, contenido: nodo.contenido)
                                    })
                                }
                            }
                        } else {
                            Text("No han sido creado notas por esta categoria")
                                .foregroundColor(.blue)
                        }
                        
                    }
                    .navigationBarTitle("Notas")
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .padding(.trailing)
                }
                .padding(.all, 0.0)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .navigationBarHidden(true)
            }
        }
    }
}

struct NotaByCategoryView_Previews: PreviewProvider {
    
    @State static var id_nota : UUID?
    @State static var nota : Nota?
    
    static var previews: some View {
        NotaByCategoryView(id_categoria: .constant(1), id_nota: $id_nota, show_nota: .constant(false), nota: $nota)
    }
}
