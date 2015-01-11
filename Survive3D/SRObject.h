//
//  SRObject.h
//  Survive3D
//
//  Created by Jon Como on 1/11/15.
//  Copyright (c) 2015 Jon Como. All rights reserved.
//

#import <SceneKit/SceneKit.h>

extern const CGFloat SRObjectSize;

@interface SRObject : SCNNode

-(instancetype)initWithTexture:(id)texture;

@end
