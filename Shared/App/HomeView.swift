//
//  HomeView.swift
//  NotiApp
//
//  Created by Ian Alexandro on 11/05/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var showMenuIndex : Int = 0
    @State var _showNota : Bool = false
    
    private let _KEY = "USER_DATA"
    
    var body: some View {
        VStack {
            TopBar(selectedMenuIndex: self.$showMenuIndex, showNota: self.$_showNota)
            
            GeometryReader {_ in
                VStack {
                    
                    if self.showMenuIndex == 0 {
                        
                        Text("General")
                    }
                    else if self.showMenuIndex == 1 {
                    
                        Text("Tareas")
                        
                    }
                    else if self.showMenuIndex == 2 {
                        
                        Text("Compras")
                        
                    }
                    else if self.showMenuIndex == 3 {
                        
                        
                        
                    }
                }
            }
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .fullScreenCover(isPresented: $_showNota, onDismiss: {
            _showNota = false
        }, content: {
            DetailNota(showNota: $_showNota, id: .constant(0))
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopBar : View {
    
    @Binding var selectedMenuIndex : Int
    @Binding var showNota : Bool
        
    var body: some View {
    
        VStack(spacing: 20) {
            
            HStack {
                Text("NotiApp").font(.system(size: 20)).fontWeight(.semibold).foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    
                    showNota = true
                    print ("showNota: \(showNota)")
                }) {
                    
                    HStack {
                        Image(systemName: "plus").font(.headline).foregroundColor(.white)
                        Text("Añadir nota")
                            .foregroundColor(.white)
                    }
                }
            }
            
            HStack {
                
                Button(action: {
                    
                    self.selectedMenuIndex = 0
                    
                }) {
                    Text("General").fontWeight(.semibold).foregroundColor(.white).opacity(self.selectedMenuIndex == 0 ? 1 : 0.6)
                }
                
                Spacer(minLength: 8)
                
                Button(action: {
                    
                    self.selectedMenuIndex = 1
                    
                }) {
                    Text("Tareas").fontWeight(.semibold).foregroundColor(.white).opacity(self.selectedMenuIndex == 1 ? 1 : 0.6)
                }
                
                Spacer(minLength: 8)
                
                Button(action: {
                    
                    self.selectedMenuIndex = 2
                    
                }) {
                    Text("Compras").fontWeight(.semibold).foregroundColor(.white).opacity(self.selectedMenuIndex == 2 ? 1 : 0.6)
                }
                
                Spacer(minLength: 8)
                
                Button(action: {
                    
                    self.selectedMenuIndex = 3
                    
                }) {
                    Text("Secreto").fontWeight(.semibold).foregroundColor(.white).opacity(self.selectedMenuIndex == 3 ? 1 : 0.6)
                }
            }.padding(.top)
        }
            .padding()
            // .padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 10)
            .padding(.top, 30)
            .background(Color("NotiAppColor"))
            // .shadow(color: Color.black, radius: 3)
    }
}

struct DetailNota : View {
    
    @Binding var showNota : Bool
    @Binding var id : Int
    
    @State var titulo : String = ""
    @State var categoria : Int = 0
    @State var contenido : String = "Escribe algo! ..."
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Button("Cancelar") {
                    showNota = false
                }
                Spacer()
                Button(id > 0 ? "Guardar Nota" : "Agregar Nota") {
                    showNota = false
                }
            }.padding(.horizontal).padding(.bottom, 30)
            
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
                .foregroundColor(Color.black.opacity(0.6))                .background(Color.black.opacity(0.05))
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
            
            Spacer()
        }
    }
}
