//
// Copyright (c) 2022 Yassir S.P.A. All rights reserved.
//

import SwiftUI
import YassirUI

typealias OnShortcutEmit = ((Shortcut) -> Void)?

struct ServiceView: View {
    
    @ObservedObject var viewModel: ServiceViewModel
    var action: OnShortcutEmit = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<viewModel.shortcuts.count, id: \.self) { row in
                HStack(alignment: .top, spacing: 16) {
                    ForEach(viewModel.shortcuts[row]) { shortcut in
                        ShortcutView(shortcut: shortcut)
                            .frame(width: 120, height: 96)
                            .onTapGesture {
                                action?(shortcut)
                            }
                    }
                    Spacer()
                }
                .padding(0)
            }
            .padding(.top, 16)
        }
    }
    
    func onEmit(perform action: OnShortcutEmit) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}

