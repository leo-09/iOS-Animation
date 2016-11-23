//
//  GViewController.m
//  UIKitDynamicsDemo
//
//  Created by liyy on 16/11/22.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "GViewController.h"

@interface GViewController ()

@property (nonatomic, retain) UIView *aview;
@property (nonatomic, retain) UIDynamicAnimator *animator;

@end

@implementation GViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.aview = [[UIView alloc] initWithFrame:CGRectMake(100, 30, 100, 100)];
    self.aview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.aview];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[self.aview]];
    [animator addBehavior:gravityBeahvior];
    
    //需要保持变量
    self.animator = animator;
}

@end
