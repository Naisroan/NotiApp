//
//  LoginView.swift
//  NotiApp
//
//  Created by Ian Alexandro on 10/05/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var usuario : String = ""
    @State var password : String = ""
    
    var body: some View {
        Color("NotiAppColor").ignoresSafeArea().overlay(
            ZStack {
                VStack(spacing: 0.0) {
                    VStack {
                        Text("Iniciar Sesión")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 40.0)
                        Text("Bienvenido a NotiApp")
                            .font(.title2)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10)
                        Text("Ingrese sus credenciales para cargar sus notas")
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 30)
                    Spacer()
                    VStack {
                        TextField("Ingrese su usuario", text: $usuario)
                            .keyboardType(.default)
                            .disableAutocorrection(true)
                            .padding()
                            .font(.headline)
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(6)
                            .border(Color.white.opacity(0.8), width: 0)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            .onChange(of: usuario, perform: { value in
                                print("Usuario \(value)")
                            })
                        SecureField("Ingrese su contraseña", text: $password)
                            .keyboardType(.default)
                            .disableAutocorrection(true)
                            .padding()
                            .font(.headline)
                            .foregroundColor(.black)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(6)
                            .border(Color.white.opacity(0.8), width: 0)
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                            .onChange(of: password, perform: { value in
                                print("Contraseña \(value)")
                            })
                        Button(action: {
                            
                        }, label: {
                            Text("Continuar")
                                .padding()
                        })
                        .background(Color("NotiAppSecondaryColor"))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                        .padding(.bottom, 10)
                    }
                    .padding(.bottom, 100)
                    Spacer()
                }
            }
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            
    }
}
