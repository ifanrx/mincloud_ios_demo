//
//  GeoView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/10.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct GeoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                
                Text("数据表：ios_community_geo").foregroundColor(Color.red)
                Text("ifanr 所在小区")
                MinButton(title: "include 查询") {
                    GeoCase.include()
                }
                
            Text("数据表：ios_hotel_geo").foregroundColor(Color.red).padding(.top, 20)
                Text("ifanr 1 公里以内的酒店")
                MinButton(title: "withinCircle 查询") {
                    GeoCase.withinCircle()
                }
                
                Text("300m < ifanr < 1000m 的酒店")
                MinButton(title: "withinRegion 查询") {
                    GeoCase.withinRegion()
                }
                
                Text("TIT 内的酒店")
                MinButton(title: "within 查询") {
                    GeoCase.within()
                }
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationBarTitle("GEO")
    }
}

struct GeoView_Previews: PreviewProvider {
    static var previews: some View {
        GeoView()
    }
}
