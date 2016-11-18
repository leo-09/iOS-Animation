//
//  WYViewController.m
//  VCTransition
//
//  Created by liyy on 16/11/18.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import "WYViewController.h"

@implementation WYViewController

- (instancetype) initWithStoryboard {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WYViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//#pragma UIViewControllerTransitioningDelegate
//- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
//    
//    
//    WYTransition *transition = [[WYTransition alloc] init];
//    return transition;
//}

@end
