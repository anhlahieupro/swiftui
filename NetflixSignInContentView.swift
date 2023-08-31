import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        let padding = EdgeInsets(top: 0,
                                 leading: 20,
                                 bottom: 0,
                                 trailing: 20)
        
        let red = Color(UIColor(red: 229 / 255,
                                green: 9 / 255,
                                blue: 20 / 255,
                                alpha: 1))
        
        
        NavigationView {
            VStack {
                
                VStack {
                    TextField("",
                              text: $email,
                              prompt: Text("Email or phone number")
                        .foregroundColor(.gray))
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .frame(height: 60)
                    .padding(padding)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(5)
                }
                .padding(padding)
                
                Spacer().frame(height: 25)
                
                
                VStack {
                    SecureField("",
                                text: $password,
                                prompt: Text("Password")
                        .foregroundColor(.gray))
                    .foregroundColor(.white)
                    .accentColor(.white)
                    .frame(height: 60)
                    .padding(padding)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(5)
                }
                .padding(padding)
                
                Spacer().frame(height: 25)
                
                
                VStack {
                    Button("**Sign In**") {
                        
                    }
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .padding(padding)
                    .background(red)
                    .cornerRadius(5)
                }
                .padding(padding)
                
                Spacer().frame(height: 10)
                
                
                Button("Recover Password") {
                    
                }
                .font(.body)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: 60)
                
                Spacer().frame(height: 10)
                
                
                Text(
                "Sign in is protected by Google reCAPTCHA to ensure you're not a bot. Learn more."
                )
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(padding)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black.opacity(0.9))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem {
                    HStack {
                        
                        Spacer()
                            .frame(width: 75)
                        
                        Image("netflix")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 30)
                        
                        Button("**Help**") {
                            
                        }
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(width: 75)
                        
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.preferredColorScheme(.dark)
    }
}
