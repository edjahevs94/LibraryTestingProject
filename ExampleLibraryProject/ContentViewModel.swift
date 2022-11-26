//
//  ContentViewModel.swift
//  ExampleLibraryProject
//
//  Created by EdgardVS on 25/11/22.
//

import Foundation
import MyLibraryLearningExample

class ContentViewModel: ObservableObject {
    
    @Published var crentialsLoaded: Bool = false
    
    init() {
        getCredentials()
        //MyLibraryLearningExample.getCredentials(MyLibraryLearningExample())(user: "ODSDEV", password: "FZcMKH23")
        
      
    }
    func getCredentials() {
        DriveService.shared.loginToDrive(user: "ODSDEV", password: "FZcMKH23", baseURL: "") { response in
            print("login realizado: \(response.success)")
            let did = response.data.did
            let sid = response.data.sid
            UserDefaults.standard.set(did, forKey: "did")
            UserDefaults.standard.set(sid, forKey: "sid")
        }
    }
    
}
