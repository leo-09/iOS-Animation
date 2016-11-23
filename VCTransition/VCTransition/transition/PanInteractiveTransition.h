//
//  PanInteractiveTransition.h
//  VCTransition
//
//  Created by liyy on 16/11/23.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanInteractiveTransition : UIPercentDrivenInteractiveTransition

@property(nonatomic,assign) BOOL interacting;

- (void) panToDismiss:(UIViewController *) vc;

@end
