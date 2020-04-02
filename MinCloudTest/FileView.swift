//
//  FileView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/11.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct FileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ScrollView {
                FileOperationView()
                
                FileQueryContentView()
                
                FileCategoryView()
                
                VideoView().padding(.top, 5)
            }
        }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationBarTitle("文件")
    }
}

struct FileView_Previews: PreviewProvider {
    static var previews: some View {
        FileView()
    }
}
