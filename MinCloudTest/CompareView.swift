//
//  CompareView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/9.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct CompareView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("compare 查询").foregroundColor(Color.red).padding(.top, 20)
            MinButton(title: "number = 50") {
                CompareCase.equal()
            }
            MinButton(title: "number != 50") {
                CompareCase.notEqualTo()
            }
            MinButton(title: "number > 50") {
                CompareCase.greaterThan()
            }
            MinButton(title: "number >= 50") {
                CompareCase.greaterThanOrEqualTo()
            }
            MinButton(title: "number < 50") {
                CompareCase.lessThan()
            }
            MinButton(title: "number <= 50") {
                CompareCase.lessThanOrEqualTo()
            }
        }
    }
}

struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
