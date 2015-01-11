//
//  SRObject.m
//  Survive3D
//
//  Created by Jon Como on 1/11/15.
//  Copyright (c) 2015 Jon Como. All rights reserved.
//

#import "SRObject.h"

const CGFloat SRObjectSize = 4;

@implementation SRObject

-(instancetype)initWithTexture:(id)texture {
    if (self = [super init]) {
        //init
        SCNPlane *plane = [SCNPlane planeWithWidth:SRObjectSize height:SRObjectSize];
        plane.firstMaterial.diffuse.contents = texture;
        self.geometry = plane;
    }
    
    return self;
}

@end
