//
//  DriveService.swift
//  ExampleLibraryProject
//
//  Created by EdgardVS on 25/11/22.
//

import Foundation
import Alamofire

class DriveService{
static let shared = DriveService()

func loginToDrive(user: String, password: String,baseURL: String, completion: @escaping (LoginResponseDrive) ->()){
    
    if UserDefaults.standard.string(forKey: "sid") != nil && UserDefaults.standard.string(forKey: "did") != nil{
        
        print("Credenciales existen")
        return
    }
    
    let fullUrl = "https://apidrive.ulima.edu.pe/drive/webapi/auth.cgi?api=SYNO.API.Auth&version=3&method=login&account=\(user)&passwd=\(password)&session=FileStation&format=cookie"
    
    AF.request(fullUrl, method: .get).responseDecodable(of: LoginResponseDrive.self) { response in
        if let data = response.value {
            completion(data)
        }
    }
    
}
}
