//
//  GAViewController.m
//  UIKitDynamicsDemo
//
//  Created by liyy on 16/11/22.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "GAViewController.h"

@interface GAViewController ()

@property (nonatomic, retain) UIView *aview;
@property (nonatomic, retain) UIDynamicAnimator *animator;

@end

@implementation GAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    
    self.aview = [[UIView alloc] initWithFrame:CGRectMake(100, 30, 50, 50)];
    self.aview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.aview];
    
    // 初始化动画的持有者
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    // 初始化重力行为
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.aview]];
    // 添加重力行为
    [self.animator addBehavior:gravityBehavior];
    
    // 初始化连接行为
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.aview attachedToAnchor:CGPointMake(170, 230)];
    // 设置行为
    [self.animator addBehavior:attachmentBehavior];
    // 把点画出来
    UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(165, 225, 10, 10)];
    pointView.backgroundColor = [UIColor redColor];
    [self.view addSubview:pointView];
}


@end
