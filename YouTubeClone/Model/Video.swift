//
//  Video.swift
//  YouTubeClone
//
//  Created by Michael Miles on 2/4/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

class Video : NSObject {
    
    var thumbnailImageName : String?
    var title : String?
    var channel : Channel?
    
}

class Channel : NSObject {
    
    var name : String?
    var profileImageName : String?
    
}
