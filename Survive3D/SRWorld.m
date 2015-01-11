//
//  SRWorld.m
//  Survive3D
//
//  Created by Jon Como on 1/11/15.
//  Copyright (c) 2015 Jon Como. All rights reserved.
//

#import "SRWorld.h"

@import SpriteKit;

@interface SRWorld ()

@property (nonatomic, strong) SCNNode *cameraNode;


@end

@implementation SRWorld

-(instancetype)init {
    if (self = [super init]) {
        // init
        
        // create and add a camera to the scene
        self.cameraNode = [SCNNode node];
        self.cameraNode.camera = [SCNCamera camera];
        self.cameraNode.camera.xFov = 10;
        self.cameraNode.camera.yFov = 10;
        [self.rootNode addChildNode:self.cameraNode];
        
        // place the camera
        self.cameraNode.position = SCNVector3Make(0, 40, 40);
        self.cameraNode.rotation = SCNVector4Make(1, 0, 0, -M_2_PI);
        
        // create and add a light to the scene
        SCNNode *lightNode = [SCNNode node];
        lightNode.light = [SCNLight light];
        lightNode.light.type = SCNLightTypeAmbient;
        lightNode.position = SCNVector3Make(0, 10, 10);
        [self.rootNode addChildNode:lightNode];
        
        [self makeGround];
    }
    
    return self;
}

- (void)makeGround {
    for (int x = -10; x<10; x++) {
        for (int z = -10; z<10; z++) {
            SKTexture *tex = [SKTexture textureWithImageNamed:@[@"tile", @"water"][arc4random()%2]];
            tex.filteringMode = SKTextureFilteringNearest;
            
            
            SCNNode *planeNode = [SCNNode nodeWithGeometry:[SCNPlane planeWithWidth:2 height:2]];
            planeNode.position = SCNVector3Make(x * 2, 0, z * 2);
            planeNode.rotation = SCNVector4Make(1, 0, 0, -M_PI_2);
            planeNode.geometry.firstMaterial.diffuse.contents = tex;
            [self.rootNode addChildNode:planeNode];
            
            
        }
    }
}

-(void)moveCameraBy:(SCNVector3)vector3 {
    self.cameraNode.position = SCNVector3Make(self.cameraNode.position.x + vector3.x, self.cameraNode.position.y + vector3.y, self.cameraNode.position.z + vector3.z);
}

@end
