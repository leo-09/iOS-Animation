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

#import "ModalViewController2.h"
#import "BouncePresentAnimation.h"
#import "NormalDismissAnimation.h"
#import "SwipeUpInteractiveTransition.h"

@interface ModalViewController ()<UIViewControllerTransitioningDelegate,ModalViewControllerDelegate>

@property (nonatomic, strong) BouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) NormalDismissAnimation *dismissAnimation;
@property (nonatomic, strong) SwipeUpInteractiveTransition *transitionController;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.parentViewController.navigationItem.title = @"模态动画";
    
    _presentAnimation = [BouncePresentAnimation new];
    _dismissAnimation = [NormalDismissAnimation new];
    _transitionController = [SwipeUpInteractiveTransition new];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) buttonClicked:(id)sender {
    ModalViewController2 *mvc =  [[ModalViewController2 alloc] init];
    mvc.transitioningDelegate = self;
    mvc.delegate = self;
    [self.transitionController wireToViewController:mvc];
    [self presentViewController:mvc animated:YES completion:nil];
}

- (IBAction)wyBtn:(id)sender {
    WYViewController *controller = [[WYViewController alloc] initWithStoryboard];
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    if ([presented isKindOfClass:[WYViewController class]]) {
        WYTransition *transition = [[WYTransition alloc] init];
        return transition;
    } else if ([presented isKindOfClass:[ModalViewController2 class]]) {
        return self.presentAnimation;
    } else {
        return nil;
    }
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAnimation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}

@end
