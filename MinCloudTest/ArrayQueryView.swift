//
//  ArrayQueryView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct ArrayQueryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("数组 查询").foregroundColor(Color.red).padding(.top, 20)
            MinButton(title: "inList: string 的值 in [abc, edf]") {
                ArrayQueryCase.inList()
            }
            MinButton(title: "notInList: string 的值 not in [edf, jk]") {
                ArrayQueryCase.notInList()
            }
            MinButton(title: "arrayInt contain [1, 2]") {
                ArrayQueryCase.arrayContains()
            }
            MinButton(title: "arrayInt equail [1, 2, 3]") {
                ArrayQueryCase.compare()
            }
        }
    }
}

struct ArrayQueryView_Previews: PreviewProvider {
    static var previews: some View {
        ArrayQueryView()
    }
}
