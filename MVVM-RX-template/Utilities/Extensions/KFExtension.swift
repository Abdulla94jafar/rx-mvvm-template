//
//  KFExtension.swift
//  MVVM-RX-template
//
//  Created by Abdulla Jafar on 8/16/20
//

import Foundation
import Kingfisher


struct KFProcessor {
    static let largeImageProcessor = DownsamplingImageProcessor(
        size: CGSize(width: 1000, height: 1000)
    )
    
    
    static let smallImageProcessor = DownsamplingImageProcessor(
        size: CGSize(width: 300, height: 300)
    )
}
