//
//  ContentView.swift
//  ExampleLibraryProject
//
//  Created by EdgardVS on 25/11/22.
//

import SwiftUI
import MyLibraryLearningExample

struct ContentView: View {
    
    @ObservedObject var vm = ContentViewModel()
    @State var toogle: Bool = false
    var body: some View {

        VStack {
            if (toogle) {
                MyLibraryLearningExample.SynologyImage(path: "/odsappdev/test2.jpeg", placeHolder: UIImage(systemName: "eye")!).frame(width: 200, height: 250)
            }
           
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Library testing")
            
            Button("descargar") {
                toogle = true
            }
        }
        .padding()
    }
}



