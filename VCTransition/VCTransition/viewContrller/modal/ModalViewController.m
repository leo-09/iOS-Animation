//
//  ModalViewController.m
//  VCTransition
//
//  Created by liyy on 16/11/18.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import "ModalViewController.h"
#import "WYViewController.h"
#import "WYTransition.h"

@interface ModalViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.parentViewController.navigationItem.title = @"模态动画";
}

- (IBAction)wyBtn:(id)sender {
    WYViewController *controller = [[WYViewController alloc] initWithStoryboard];
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
//    if ([presenting isKindOfClass:[WYViewController class]]) {
        WYTransition *transition = [[WYTransition alloc] init];
        return transition;
//    } else {
//        return nil;
//    }
}

@end
