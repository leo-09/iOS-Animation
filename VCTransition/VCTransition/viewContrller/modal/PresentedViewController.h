//
//  PresentedViewController.h
//  VCTransition
//
//  Created by liyy on 16/11/23.
//  Copyright © 2016年 hihome. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PresentedViewController;
@protocol PresentViewControllerDelegate <NSObject>
-(void) modalViewControllerDidClickedDismissButton:(PresentedViewController *)vc;
@end

@interface PresentedViewController : UIViewController

- (instancetype) initWithStoryboard;

@property (nonatomic, weak) id<PresentViewControllerDelegate> delegate;

@end
