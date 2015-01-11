//
//  SRInterface.m
//  Survive3D
//
//  Created by Jon Como on 1/11/15.
//  Copyright (c) 2015 Jon Como. All rights reserved.
//

#import "SRInterface.h"

#import "SRWorld.h"

#import "JCMath.h"

@interface SRInterface ()

@property (nonatomic, strong) SKSpriteNode *movementPad;

@end

@implementation SRInterface

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        // init
        
        _movementPad = [[SKSpriteNode alloc] initWithColor:[UIColor orangeColor] size:CGSizeMake(100, 100)];
        _movementPad.position = CGPointMake(120, 120);
        [self addChild:_movementPad];
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint position = [[touches anyObject] locationInNode:self];
    
    if ([JCMath distanceBetweenPoint:position andPoint:self.movementPad.position sorting:NO] < self.movementPad.size.width) {
        // touching Pad
        SCNVector3 difference = SCNVector3Make((position.x - self.movementPad.position.x)/10, 0, (self.movementPad.position.y - position.y)/10);
        [self.world moveCameraBy:difference];
    }
}

@end
