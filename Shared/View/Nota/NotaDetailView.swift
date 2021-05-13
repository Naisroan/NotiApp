//
//  NotaDetailView.swift
//  NotiApp
//
//  Created by Ian Alexandro on 12/05/21.
//

import SwiftUI

struct NotaDetailView : View {
    
    @Binding var showNota : Bool
    @Binding var idNota : UUID?
    @Binding var nodo : Nota?
    
    @State var alertMessage : String = ""
    
    @State var titulo : String = ""
    @State var categoria : Int = 0
    @State var contenido : String = "Escribe algo! ..."
    
    @Environment(\.managedObjectContext) var cntx
    
    private func onLoad() {
        
        if nodo != nil {
            
            titulo = nodo!.titulo
            categoria = Int(nodo!.id_categoria)
            contenido = nodo!.contenido
        }
    }
    
    private func onBtnGuardarNotaClick () {
        
        alertMessage = ""
        
        if titulo == "" {
            alertMessage = "Ingrese el titulo de la nota"
            return
        }
        
        if categoria <= 0 {
            alertMessage = "Seleccione la categoría de la nota"
            return
        }
        
        if contenido == "" {
            alertMessage = "Ingrese el contenido"
            return
        }
        
        if (idNota == nil) {
            
            let aux = Nota(context: cntx)
            
            aux.id = UUID()
            aux.titulo = titulo
            aux.id_categoria = Int32(categoria)
            aux.contenido = contenido
            
        } else {
            
            nodo!.titulo = titulo
            nodo!.id_categoria = Int32(categoria)
            nodo!.contenido = contenido
        }
        
        do {
            
            try cntx.save()
            
        } catch let error as NSError {
            
            alertMessage = error.localizedDescription
            print(error.localizedDescription)
            
            return
        }
        
        // PersistentCloudKitContainer.saveContext()
        
        idNota = nil
        showNota = false
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Button("Cancelar") {
                    showNota = false
                }
                Spacer()
                Button(idNota == nil ? "Agregar Nota" : "Guardar Nota") {
                    onBtnGuardarNotaClick()
                }
            }.padding(.horizontal).padding(.bottom, 30)
            
            if self.alertMessage != "" {
                
                Text(self.alertMessage)
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
            
            Text("Ingrese el título")
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(Color("NotiAppSecondaryColor"))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
                .padding(.bottom, 10)
                        
            TextField("Titulo de la nota", text: $titulo)
                .keyboardType(.default)
                .disableAutocorrection(true)
                .padding()
                .font(.headline)
                .foregroundColor(Color.black.opacity(0.6))
                .background(Color.black.opacity(0.05))
                .cornerRadius(6)
                .border(Color.white.opacity(0.8), width: 0)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .onChange(of: titulo, perform: { value in
                    print("Titulo \(value)")
                })
            
            Text("Seleccione la categoría")
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(Color("NotiAppSecondaryColor"))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            Picker(selection: $categoria, label: Text("Categorías")) {
                Text("General").tag(1)
                Text("Tareas").tag(2)
                Text("Compras").tag(3)
                Text("Secreto").tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.bottom, 10)
            
            Text("Ingrese el contenido")
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(Color("NotiAppSecondaryColor"))
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            TextEditor(text: $contenido)
                .keyboardType(.default)
                .disableAutocorrection(true)
                .padding()
                .cornerRadius(6)
                .font(.body)
                .foregroundColor(Color.black.opacity(0.6))
                .padding(.bottom, 10)
                .onChange(of: contenido, perform: { value in
                    print("Contenido \(value)")
                })
            
            if idNota != nil {
                
                Text(idNota!.uuidString)
                    .font(.caption)
                    .fontWeight(.light)
                    .foregroundColor(Color("NotiAppSecondaryColor"))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
        }.onAppear(perform: {
            onLoad()
        })
    }
}

struct NotaDetailView_Previews: PreviewProvider {
    
    @State static var id : UUID?
    @State static var nodo : Nota?
    
    static var previews: some View {
        NotaDetailView(showNota: .constant(false), idNota: $id, nodo: $nodo)
    }
}
