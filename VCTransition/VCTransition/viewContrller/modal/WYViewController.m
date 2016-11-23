//
//  WYViewController.m
//  VCTransition
//
//  Created by liyy on 16/11/18.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import "WYViewController.h"
#import "PresentedViewController.h"
#import "RotationPresentAnimation.h"
#import "RotationDismissAnimation.h"
#import "PanInteractiveTransition.h"

@interface WYViewController()<UIViewControllerTransitioningDelegate, PresentViewControllerDelegate>

@property (nonatomic, strong) PanInteractiveTransition * pit;
@property (nonatomic, strong) RotationDismissAnimation * dismissAnimation;

@end

@implementation WYViewController

- (instancetype) initWithStoryboard {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WYViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pit = [[PanInteractiveTransition alloc] init];
    _dismissAnimation = [[RotationDismissAnimation alloc] init];
}

- (IBAction)nextVC:(id)sender {
    PresentedViewController *controller = [[PresentedViewController alloc] initWithStoryboard];
    controller.transitioningDelegate = self;
    controller.delegate = self;
    [self.pit panToDismiss:controller];
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)modalViewControllerDidClickedDismissButton:(PresentedViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    RotationPresentAnimation *transition = [[RotationPresentAnimation alloc] init];
    return transition;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return _dismissAnimation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.pit.interacting ? self.pit : nil;
}

@end
