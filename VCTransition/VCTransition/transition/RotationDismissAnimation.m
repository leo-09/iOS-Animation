//
//  RotationDismissAnimation.m
//  VCTransition
//
//  Created by liyy on 16/11/23.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import "RotationDismissAnimation.h"

@implementation RotationDismissAnimation

- (NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
     // 某个VC的初始位置，可以用来做动画的计算。
    CGRect initRect = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalRect = CGRectOffset(initRect, 0, [UIScreen mainScreen].bounds.size.height);
    
    [[transitionContext containerView] addSubview:toVC.view];
    [[transitionContext containerView] sendSubviewToBack:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.4f initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.view.frame = finalRect;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

@end
