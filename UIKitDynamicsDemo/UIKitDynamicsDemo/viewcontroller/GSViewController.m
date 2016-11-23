//
//  GSViewController.m
//  UIKitDynamicsDemo
//
//  Created by liyy on 16/11/22.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "GSViewController.h"

@interface GSViewController ()

@property (nonatomic, retain) UIView *aview;
@property (nonatomic, retain) UIDynamicAnimator *animator;

@end

@implementation GSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    
    self.aview = [[UIView alloc] initWithFrame:CGRectMake(0, 60, 10, 10)];
    self.aview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.aview];
    
    // 吸附点
    UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(200, 300, 20, 20)];
    pointView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:pointView];
    
    // 初始化动画的持有者
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    //初始化重力行为
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.aview]];
    //添加重力行为
    [self.animator addBehavior:gravityBehavior];
    
    // 0.5秒后启动吸附力
    dispatch_after(500, dispatch_get_main_queue(), ^{
        // 初始化吸附力行为
        UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:self.aview snapToPoint:CGPointMake(200, 300)];
        snapBehavior.damping = 50;
        [self.animator addBehavior:snapBehavior];
    });
    
}

@end
