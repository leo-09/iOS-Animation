//
//  ModalViewController.h
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalViewController2;

#pragma protocol
@protocol ModalViewControllerDelegate <NSObject>

-(void) modalViewControllerDidClickedDismissButton:(ModalViewController2 *)viewController;

@end

@interface ModalViewController2 : UIViewController

@property (nonatomic, weak) id<ModalViewControllerDelegate> delegate;

@end
