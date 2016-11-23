//
//  RotationPresentAnimation.m
//  VCTransition
//
//  Created by liyy on 16/11/23.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import "RotationPresentAnimation.h"

@implementation RotationPresentAnimation

//返回动画的时间
- (NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8f;
}

//在进行切换的时候将调用该方法，我们对于切换时的UIView的设置和动画都在这个方法中完成。
- (void) animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // to ViewController
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 得到切换结束时某个VC应在的frame。
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, 0, [UIScreen mainScreen].bounds.size.height);
    
    // 将toVC的view添加到containerView中；
    [[transitionContext containerView] addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        // 向这个context报告切换已经完成
        [transitionContext completeTransition:YES];
    }];
}

@end
