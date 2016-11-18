//
//  WYTransition.m
//  VCTransition
//
//  Created by liyy on 16/11/18.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import "WYTransition.h"

@implementation WYTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 1. Get controllers from transition context
    // 获得的fromVC是MainViewController，而不是ModalViewController
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Add toVC's view to containerView
    UIView* containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 3. Add a perspective transform
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -0.002;
    [containerView.layer setSublayerTransform:transform];
    
    // 4. Set init frame for toVC
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromVC];
    toVC.view.frame = initialFrame;
    toVC.view.layer.transform = [self rotate: M_PI_2];
    
    // animate
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateKeyframesWithDuration:duration delay:0.0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration: 0.5 animations:^{
            fromVC.view.layer.transform = [self rotate: - M_PI_2];
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration: 0.5 animations:^{
            toVC.view.layer.transform =  [self rotate: 0];
        }];
    } completion:^(BOOL finished) {
        // 旋转的view需要再转回来
        fromVC.view.layer.transform = [self rotate: 0];
        // 向这个context报告切换已经完成
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

- (CATransform3D) rotate:(CGFloat) angle {
    return  CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0);
}

@end
