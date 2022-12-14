//
//  ViewModel.swift
//  MyLibraryLearningExample
//
//  Created by EdgardVS on 24/11/22.
//

import Foundation


public class ViewModel: ObservableObject {
    var imageCache  = ImageCache.getImageCache()
    @Published var imageC: UIImage?
    @Published var loading: Bool = true
    
    init(photoPath: String) {
        
        if photoPath.contains("jpeg") || photoPath.contains("png") || photoPath.contains("jpg") {
            if loadImageFromCache(path: photoPath) {
                print("usando cache sin llamar al servicio")
                loading = false
                return
            }
            print("nueva imagen llamando al servicio")
            getImage(path: photoPath)
        } else {
            imageC = UIImage(named: "trofeo")
            loading = false
        }
    }
  
    
    func getImage(path: String) {
        Service.shared.download(path: path) { response , loading  in
            guard let loadedImage = UIImage(data: response) else {
                return
            }
            
            self.imageC = loadedImage
            self.loading = false
            self.imageCache.set(forKey: path, image: loadedImage)
        }
            
    }
    
    func loadImageFromCache(path: String) -> Bool {
        
            guard let cacheImage = imageCache.get(forKey: path) else {
                
                return false
            }
            
            imageC = cacheImage
            return true
        }
    
    
    
    
}
