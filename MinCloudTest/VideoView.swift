//
//  VideoView.swift
//  MinCloudTest
//
//  Created by quanhua on 2019/9/24.
//  Copyright © 2019 ifanr. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            MinButton(title: "视频截图") {
                FileCase.genVideoSnapshot()
            }
            
            MinButton(title: "M3U8 视频拼接") {
                FileCase.videoConcat()
            }
            
            
            
            MinButton(title: "M3U8 视频剪辑") {
                FileCase.videoClip()
            }
            
            MinButton(title: "M3U8 时长和分片信息") {
                FileCase.videoMeta()
            }
            
            MinButton(title: "音视频的元信息") {
                FileCase.videoAudioMeta()
            }
        }
    }
}

