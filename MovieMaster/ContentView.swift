import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var loginBtnDisabled: Bool = true

    
    var body: some View {
        ZStack {
            BackgroundImageView()
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Text("User:")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.leading)
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.trailing)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onChange(of: username) { newValue in
                            let filtered = newValue.filter { $0.isLetter || $0.isNumber }
                            if filtered != newValue {
                                self.username = filtered
                            }
                        }
                    
                }
                
                HStack {
                    Text("Password:")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.leading)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.trailing)
                }
                .padding()
                        .background(Color.clear)
                        .padding(.leading)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Invalid Credentials"), message: Text("Please enter a valid username and password."), dismissButton: .default(Text("OK")))
                        }
                Button(action: {
                                if isValidCredentials() {
                                    // Perform login logic
                                } else {
                                    showAlert = true
                                }
                            }) {
                                Text("Login")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
            }
            .padding()
        }
        .background(Color.clear)
    }
    
    func isValidCredentials() -> Bool {
        if username != "renanmd" || password != "123abc" {
            return false
        }
            return !username.isEmpty && !password.isEmpty
        }
}

struct BackgroundImageView: View {
    var body: some View {
        Image("MovieBackgroundDalle")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
