//
//  Globals.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/6.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import SwiftUI

class GlobalStore: ObservableObject {
    static let store = GlobalStore()
    var result: Any?
    var error: NSError?
    
    @Published var showMessage: Bool = false
}

func showMessageAlert() -> Alert {
    let resultObject = GlobalStore.store.result as AnyObject
    var message = ""
    if let error = GlobalStore.store.error {
        message = error.localizedDescription
    } else if let description = resultObject.description {
        message = description
    }
    return Alert(title: Text("结果"), message: Text(message), dismissButton: .cancel())
}

func setResult(_ result: Any?, error: NSError?) {
    GlobalStore.store.result = result
    GlobalStore.store.error = error
    GlobalStore.store.showMessage.toggle()
}

struct MinButton: View {
    @EnvironmentObject private var store: GlobalStore
    
    var title: String
    var width: CGFloat = UIScreen.main.bounds.width - 20
    var background = Color.green
    var callback: () -> Void
    
    var body: some View {
        Button(action: {
            self.callback()
        }) { Text(title).foregroundColor(Color.black) }
            .frame(width: self.width, height: 44)
            .background(background)
            .alert(isPresented: $store.showMessage) { () -> Alert in
                return showMessageAlert()
        }
    }
}
