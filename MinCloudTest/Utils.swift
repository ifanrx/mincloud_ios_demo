//
//  Utils.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/23.
//  Copyright © 2019 ifanr. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit
  
struct AdaptsToSoftwareKeyboard: ViewModifier {
      
    @State var currentHeight: CGFloat = 0
  
  
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width, height: currentHeight).animation(.easeOut(duration: 0.25))
            .onAppear(perform: subscribeToKeyboardChanges)
    }
  
    //MARK: - Keyboard Height
    private let keyboardHeightOnOpening = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map { $0.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect }
        .map { $0.height }
      
    private let keyboardHeightOnHiding = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map {_ in return CGFloat(0) }
      
    //MARK: - Subscriber to Keyboard's changes
      
    private func subscribeToKeyboardChanges() {
          
        _ = Publishers.Merge(keyboardHeightOnOpening, keyboardHeightOnHiding)
            .subscribe(on: RunLoop.main)
            .sink { height in
                if self.currentHeight == 0 || height == 0 {
                    self.currentHeight = height
                }
                self.currentHeight = height
                print("height: \(height)")
        }
    }
}

