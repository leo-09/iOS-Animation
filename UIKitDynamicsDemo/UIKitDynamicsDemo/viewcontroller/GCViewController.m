//
//  GCViewController.m
//  UIKitDynamicsDemo
//
//  Created by liyy on 16/11/22.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "GCViewController.h"

@interface GCViewController ()

@property (nonatomic, retain) UIView *aview;
@property (nonatomic, retain) UIDynamicAnimator *animator;

@end

@implementation GCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated {
    
    self.aview = [[UIView alloc] initWithFrame:CGRectMake(100, 30, 100, 100)];
    self.aview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.aview];
    
    // 初始化动画的持有者
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 初始化重力行为
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.aview]];
    //添加重力行为
    [self.animator addBehavior:gravityBehavior];
    
    // 初始化碰撞行为
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.aview]];
    // 指定边界为参考系的边界
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
//    [collisionBehavior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//    collisionBehavior addBoundaryWithIdentifier:(nonnull id<NSCopying>) forPath:(nonnull UIBezierPath *) //Bezier边界
//    collisionBehavior addBoundaryWithIdentifier:(nonnull id<NSCopying>) fromPoint:(CGPoint) toPoint:(CGPoint) //线边界
    // 添加碰撞行为
    [self.animator addBehavior:collisionBehavior];
}

@end
