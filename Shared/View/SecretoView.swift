//
//  SecretoView.swift
//  NotiApp
//
//  Created by Ian Alexandro on 12/05/21.
//

import SwiftUI

struct SecretoView: View {
    
    @Binding var id_nota : UUID?
    @Binding var nota : Nota?
    @Binding var show_nota : Bool
    
    @State var isNew = false
    @State var password : String = ""
    @State var new_password : String = ""
    @State var confirm_password : String = ""
    @State var alertMessage : String = ""
    @State var isValidPassword : Bool = false
    @State var isChangePassword : Bool = false
    
    private func onLoad() {
        
        // UserDefaults.standard.removeObject(forKey: AppSettings.USER_SECRET_PASSWORD_KEY)
        // UserDefaults.standard.synchronize()
        
        let pass = UserDefaults.standard.string(forKey: AppSettings.USER_SECRET_PASSWORD_KEY)
        
        self.isNew = pass == nil || pass == ""
        
        print(isNew ? "" : pass!)
    }
    
    private func onBtnGuardarClick () {
        
        alertMessage = ""
        
        if isChangePassword {
            
            if password == "" {
                alertMessage = "Ingrese su contraseña anterior"
                return
            }
            
            let pass = UserDefaults.standard.string(forKey: AppSettings.USER_SECRET_PASSWORD_KEY)

            if pass != password {
                alertMessage = "La contraseña anterior no coincide"
                return
            }
        }
        
        if new_password == "" {
            alertMessage = "Ingrese su contraseña nueva"
            return
        }
        
        if new_password != confirm_password {
            alertMessage = "Las contraseñas no coinciden"
            return
        }
        
        UserDefaults.standard.setValue(new_password, forKey: AppSettings.USER_SECRET_PASSWORD_KEY)
        UserDefaults.standard.synchronize()
        
        isNew = false
        isChangePassword = false
        new_password = ""
        confirm_password = ""
        password = ""
        
        print("Contraseña \(new_password) ha sido guardada")
    }
    
    private func onBtnAccederClick () {
        
        alertMessage = ""
        
        if password == "" {
            alertMessage = "Ingrese su contraseña maestra"
            return
        }
        
        let pass = UserDefaults.standard.string(forKey: AppSettings.USER_SECRET_PASSWORD_KEY)
        
        if password != pass {
            alertMessage = "Contraseña incorrecta"
            return
        }
        
        isNew = false
        isValidPassword = true
        
        print("Contraseña \(password) valida")
    }
    
    private func onBtnCambiarContrasenaClick () {
        
        alertMessage = ""
        password = ""
        new_password = ""
        confirm_password = ""
        isValidPassword = false
        isChangePassword = true
    }
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            if isNew || isChangePassword
            {
                if isChangePassword {
                    
                    Text("Ingrese su contraseña maestra")
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color("NotiAppSecondaryColor"))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                                
                    SecureField("Contraseña maestra", text: $password)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .padding()
                        .font(.headline)
                        .foregroundColor(Color.black.opacity(0.6))                .background(Color.black.opacity(0.05))
                        .cornerRadius(6)
                        .border(Color.white.opacity(0.8), width: 0)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        .onChange(of: password, perform: { value in
                            print("Contraseña maestra \(value)")
                        })
                }
                
                Text("Ingrese su contraseña nueva")
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(Color("NotiAppSecondaryColor"))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                            
                SecureField("Contraseña nueva", text: $new_password)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                    .padding()
                    .font(.headline)
                    .foregroundColor(Color.black.opacity(0.6))                .background(Color.black.opacity(0.05))
                    .cornerRadius(6)
                    .border(Color.white.opacity(0.8), width: 0)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    .onChange(of: new_password, perform: { value in
                        print("Contraseña nueva \(value)")
                    })
                
                Text("Confirme su contraseña nueva")
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(Color("NotiAppSecondaryColor"))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                            
                SecureField("Confirme su contraseña", text: $confirm_password)
                    .keyboardType(.default)
                    .disableAutocorrection(true)
                    .padding()
                    .font(.headline)
                    .foregroundColor(Color.black.opacity(0.6))                .background(Color.black.opacity(0.05))
                    .cornerRadius(6)
                    .border(Color.white.opacity(0.8), width: 0)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    .onChange(of: confirm_password, perform: { value in
                        print("Confirmar contraseña \(value)")
                    })
                
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
                
                Button(action: {
                    onBtnGuardarClick()
                }, label: {
                    Text("Guardar")
                        .padding()
                        .frame(maxWidth: .infinity)
                })
                .background(Color("NotiAppSecondaryColor"))
                .foregroundColor(.white)
                .cornerRadius(6)
                .padding(.bottom, 10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            else
            {
                if !self.isValidPassword {
                    
                    Text("Ingrese su contraseña maestra")
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color("NotiAppSecondaryColor"))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                                
                    SecureField("Contraseña maestra", text: $password)
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
                        .onChange(of: password, perform: { value in
                            print("Contraseña maestra \(value)")
                        })
                    
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
                    
                    Button(action: {
                        onBtnAccederClick()
                    }, label: {
                        Text("Acceder")
                            .padding()
                            .frame(maxWidth: .infinity)
                    })
                    .background(Color("NotiAppSecondaryColor"))
                    .foregroundColor(.white)
                    .cornerRadius(6)
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                else {
                    
                    HStack {
                        Spacer()
                        Button("Cambiar contraseña maestra") {
                            onBtnCambiarContrasenaClick()
                        }
                    }.padding(.horizontal).padding(.bottom, 30)
                    
                    NotaByCategoryView(id_categoria: .constant(4), id_nota: self.$id_nota, show_nota: self.$show_nota, nota: self.$nota)
                    
                }
            }
            
            Spacer()
        }.onAppear(perform: {
            onLoad()
        })
        .padding(.top)
    }
}

struct SecretoView_Previews: PreviewProvider {
    
    @State static var id : UUID?
    @State static var nota : Nota?
    
    static var previews: some View {
        SecretoView(id_nota: $id, nota: $nota, show_nota: .constant(false))
    }
}
