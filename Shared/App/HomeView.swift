//
//  HomeView.swift
//  NotiApp
//
//  Created by Ian Alexandro on 11/05/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var showMenuIndex : Int = 1
    @State var _showNota : Bool = false
    
    @State var idNota : UUID? = nil
    @State var nota : Nota? = nil
    
    var body: some View {
        VStack {
            TopBar(selectedMenuIndex: self.$showMenuIndex, showNota: self.$_showNota, id_nota: self.$idNota, nota: self.$nota)
            GeometryReader{
                _ in
                VStack {
                    if self.showMenuIndex == 4 {
                        
                        SecretoView(id_nota: self.$idNota, nota: $nota, show_nota: self.$_showNota)
                        
                    } else {
                        
                        NotaByCategoryView(id_categoria: $showMenuIndex, id_nota: $idNota, show_nota: $_showNota, nota: $nota)
                    }
                }
            }
            Spacer()
        }.edgesIgnoringSafeArea(.top)
        .fullScreenCover(isPresented: $_showNota, content: {
            NotaDetailView(showNota: $_showNota, idNota: $idNota, nodo: $nota)
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
    @Binding var id_nota : UUID?
    @Binding var nota : Nota?
        
    var body: some View {
    
        VStack(spacing: 20) {
            
            HStack {
                Text("NotiApp").font(.system(size: 20)).fontWeight(.semibold).foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    
                    id_nota = nil
                    nota = nil
                    
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
                    
                    self.selectedMenuIndex = 1
                    
                }) {
                    Text("General").fontWeight(.semibold).foregroundColor(.white).opacity(self.selectedMenuIndex == 1 ? 1 : 0.6)
                }
                
                Spacer(minLength: 8)
                
                Button(action: {
                    
                    self.selectedMenuIndex = 2
                    
                }) {
                    Text("Tareas").fontWeight(.semibold).foregroundColor(.white).opacity(self.selectedMenuIndex == 2 ? 1 : 0.6)
                }
                
                Spacer(minLength: 8)
                
                Button(action: {
                    
                    self.selectedMenuIndex = 3
                    
                }) {
                    Text("Compras").fontWeight(.semibold).foregroundColor(.white).opacity(self.selectedMenuIndex == 3 ? 1 : 0.6)
                }
                
                Spacer(minLength: 8)
                
                Button(action: {
                    
                    self.selectedMenuIndex = 4
                    
                }) {
                    Text("Secreto").fontWeight(.semibold).foregroundColor(.white).opacity(self.selectedMenuIndex == 4 ? 1 : 0.6)
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
