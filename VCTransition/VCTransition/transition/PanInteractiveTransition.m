//
//  SwipeUpInteractiveTransition.m
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import "PanInteractiveTransition.h"

@interface PanInteractiveTransition()

@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, strong) UIViewController *presentingVC;

@end

@implementation PanInteractiveTransition

- (void) panToDismiss:(UIViewController *)viewController {
    self.presentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
}

- (void)prepareGestureRecognizerInView:(UIView*)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

-(CGFloat)completionSpeed {
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            // 1. Mark the interacting flag. Used when supplying it in delegate.
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            // 2. 计算百分比，我们设定了向下划动400像素或以上为100%，每次手势状态变化时根据当前手势位置计算新的百分比，结果被限制在0～1之间。
            CGFloat fraction = translation.y / 400.0;
            // Limit it between 0 and 1
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.shouldComplete = (fraction > 0.5);
            
            // 更新百分比，一般通过手势识别的长度之类的来计算一个值，然后进行更新。
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 3. Gesture over. Check if the transition should happen or not
            self.interacting = NO;
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                // 报告交互取消，返回切换前的状态
                [self cancelInteractiveTransition];
            } else {
                // 报告交互完成，更新到切换后的状态
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

@end
