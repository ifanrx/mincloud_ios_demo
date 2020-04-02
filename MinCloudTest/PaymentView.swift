//
//  PaymentView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ScrollView {
                CreateOrderView()
                
                QueryOrderContentView()
                
            }
        }.padding(EdgeInsets(top: -44, leading: 10, bottom: 0, trailing: 10))
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
