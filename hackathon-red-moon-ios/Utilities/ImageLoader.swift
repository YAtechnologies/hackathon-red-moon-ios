//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import UIKit
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage = UIImage()

    init(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
    
}
