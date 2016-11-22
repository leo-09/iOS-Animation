//
//  ViewController.m
//  AnimationDemo
//
//  Created by liyy on 16/11/21.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollisionBehaviorDelegate>

@property (nonatomic, retain) UIView *aview;
@property (nonatomic, retain) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.aview = [[UIView alloc] initWithFrame:CGRectMake(100, 30, 100, 100)];
    self.aview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.aview];
    
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[self.aview]];
    [animator addBehavior:gravityBeahvior];
    
    //    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.aview]];
    // --- 碰撞边界范围 ---
    // translatesReferenceBoundsIntoBoundary将整个参照view（也就是self.view）的边框作为碰撞边界
    //    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    //    [collisionBehavior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(0, 0, 30, 0)];
    //    collisionBehavior addBoundaryWithIdentifier:<#(nonnull id<NSCopying>)#> forPath:<#(nonnull UIBezierPath *)#>
    //    collisionBehavior addBoundaryWithIdentifier:<#(nonnull id<NSCopying>)#> fromPoint:<#(CGPoint)#> toPoint:<#(CGPoint)#>
    // --- 碰撞边界范围 ---
    //    [animator addBehavior:collisionBehavior];
    //    collisionBehavior.collisionDelegate = self;
    
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.aview attachedToAnchor:CGPointMake(100, 200)];
    [animator addBehavior:attachmentBehavior];
    
    //需要保持变量
    self.animator = animator;
}

#pragma UICollisionBehaviorDelegate

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p {
    
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 {
    
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier atPoint:(CGPoint)p {
    
}

- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
