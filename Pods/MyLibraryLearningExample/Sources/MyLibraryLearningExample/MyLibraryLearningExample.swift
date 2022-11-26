import SwiftUI

public struct MyLibraryLearningExample {
    
    public init() {
        
    }
    public func getCredentials(user: String, password: String){
        
        Service.shared.login(user: user, password: password) { response in
            //print("login realizado: \(response.success)")
            
            let did = response.data.did
            let sid = response.data.sid
            UserDefaults.standard.set(did, forKey: "did")
            UserDefaults.standard.set(sid, forKey: "sid")
            
        }
    }
    
    
    
    
    public struct SynologyImage: View {
        
        @ObservedObject var vm: ViewModel
        @State var path: String
        @State var placeHolder: UIImage
        
        public init(path: String, placeHolder: UIImage) {
            self._placeHolder = State(initialValue: placeHolder)
            self._path = State(initialValue: path)
            self._vm = ObservedObject(wrappedValue: ViewModel(photoPath: path))
        }
        
        public var body: some View {
            if !(vm.loading) {
                Image(uiImage: vm.imageC ?? placeHolder)
                .resizable()
            } else {
                ProgressView()
            }
          
            
        }
    }

    public struct MainTextField: View {

       
        
        @State var placeholder: String
       
        @Binding var text: String
        
        public init(placeholder: String, text: Binding<String>) {
            self._placeholder = State(initialValue: placeholder)
           
            self._text = text
        }
        
        public var body: some View {
        
            HStack {
                Image(systemName: "person").foregroundColor(.blue)
                TextField(placeholder, text: $text)
                    .font(.system(size: 20 ,weight: .bold, design: .default))
                    .foregroundColor(.blue)
            }.padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 2))
        }
    }

}
