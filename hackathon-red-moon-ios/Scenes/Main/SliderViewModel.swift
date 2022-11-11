//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import Foundation

public class SliderViewModel: ObservableObject {

    @Published var slider: Slider

    public init(slider: Slider) {
        self.slider = slider
    }
}
