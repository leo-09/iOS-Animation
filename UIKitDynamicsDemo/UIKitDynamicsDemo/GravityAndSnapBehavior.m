//
//  GravityAndSnapBehavior .m
//  UIKitDynamicsDemo
//
//  Created by liyy on 16/11/23.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "GravityAndSnapBehavior.h"

@implementation GravityAndSnapBehavior

- (instancetype) initWithItem:(UIView *)view {
    self = [super init];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[view]];
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:view snapToPoint:CGPointMake(300, 140)];
    [self addChildBehavior:gravityBehavior];
    [self addChildBehavior:snapBehavior];
    
    __block CGPoint point = CGPointMake(100, 100);
    
    // UIDynamBehavior中的action属性，这个属性会再每次view改变时候出发，因此你可以根据自己需要，添加自己的特殊行为
    [self setAction:^{
        view.layer.position = CGPointMake(point.x, point.y);
        point = CGPointMake(point.x+1, point.y+1);
    }];
    
    return self;
}

@end
