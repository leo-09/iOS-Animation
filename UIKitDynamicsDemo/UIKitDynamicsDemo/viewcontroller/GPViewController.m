//
//  GPViewController.m
//  UIKitDynamicsDemo
//
//  Created by liyy on 16/11/22.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "GPViewController.h"

@interface GPViewController ()

@property (nonatomic, retain) UIView *aview;
@property (nonatomic, retain) UIDynamicAnimator *animator;

@end

@implementation GPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    
    self.aview = [[UIView alloc] initWithFrame:CGRectMake(100, 30, 100, 100)];
    self.aview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.aview];
    
    // 初始化动画的持有者
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 初始化重力行为
    UIGravityBehavior *gravityzBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.aview]];
    // 添加重力行为
    [self.animator addBehavior:gravityzBehavior];
    
    // 初始化推力行为：UIPushBehaviorModeContinuous:持续给力 UIPushBehaviorModeInstantaneous:瞬间给力
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.aview] mode:UIPushBehaviorModeInstantaneous];
    // 推力速度
    pushBehavior.magnitude = 3;
    // 推力方向
    pushBehavior.angle = [self pointToAngle:CGPointMake(200, 200)];
    // 设置行为
    [self.animator addBehavior:pushBehavior];
    
    // 碰撞行为
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.aview]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
}

// 根据给定点和view中心点计算角度
- (CGFloat) pointToAngle:(CGPoint)p {
    CGPoint o = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    return atan2(p.y-o.y, p.x-o.x);
}

@end
