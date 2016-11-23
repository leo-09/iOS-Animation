//
//  PresentedViewController.m
//  VCTransition
//
//  Created by liyy on 16/11/23.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController

- (instancetype) initWithStoryboard {
    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PresentedViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)dismiss:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDidClickedDismissButton:)]) {
        [self.delegate modalViewControllerDidClickedDismissButton:self];
    }
}

@end
