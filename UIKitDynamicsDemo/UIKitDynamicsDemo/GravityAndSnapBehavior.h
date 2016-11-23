//
//  GravityAndSnapBehavior .h
//  UIKitDynamicsDemo
//
//  Created by liyy on 16/11/23.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    自定义重力和吸力子行为
 */
@interface GravityAndSnapBehavior : UIDynamicBehavior

- (instancetype) initWithItem:(UIView *)view;

@end
