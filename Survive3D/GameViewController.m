//
//  GameViewController.m
//  Survive3D
//
//  Created by Jon Como on 1/11/15.
//  Copyright (c) 2015 Jon Como. All rights reserved.
//

#import "GameViewController.h"

#import "SRWorld.h"
#import "SRInterface.h"

@interface GameViewController ()

@property (nonatomic, strong) SRWorld *scene;
@property (nonatomic, strong) SRInterface *interface;
@property (nonatomic, strong) SCNNode *cameraNode;

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // create a new scene
    self.scene = [SRWorld new];
    
    // retrieve the SCNView
    SCNView *scnView = (SCNView *)self.view;
    
    // set the scene to the view
    scnView.scene = self.scene;
    
    // set interface
    self.interface = [[SRInterface alloc] initWithSize:self.view.bounds.size];
    self.interface.world = self.scene;
    scnView.overlaySKScene = self.interface;
        
    // show statistics such as fps and timing information
    scnView.showsStatistics = YES;

    // configure the view
    scnView.backgroundColor = [UIColor whiteColor];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
