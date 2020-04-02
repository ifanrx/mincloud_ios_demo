//
//  ContentView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ScrollView {
                                
                ContentGetView()
                
                ContentQueryView()
                
                ContentCategoryView()
                
                Text("").frame(width: UIScreen.main.bounds.width - 20, height: 300)
                
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationBarTitle("ios_group")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
