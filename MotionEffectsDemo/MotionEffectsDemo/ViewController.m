//
//  ViewController.m
//  MotionEffectsDemo
//
//  Created by liyy on 16/11/23.
//  Copyright © 2016年 liyy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, retain) UIImageView *bg;
@property (nonatomic, retain) UIImageView *yurt1;
@property (nonatomic, retain) UIImageView *yurt2;
@property (nonatomic, retain) UIImageView *ship;
@property (nonatomic, retain) UIImageView *text;
@property (nonatomic, retain) UIImageView *octact;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.width = self.view.frame.size.width;
    self.height = self.view.frame.size.height;
    
    [self scenery];
    
    [self motionEffects];
}

//布置舞台
- (void) scenery {
    //bg 背景
    self.bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg"]];
    [self sceneryElementWithFrame:CGRectMake(-100, -100, _width+200, _height+200) imageView:self.bg];
    
    //yurt 蒙古包
    self.yurt1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yurt1"]];
    self.yurt2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yurt2"]];
    [self sceneryElementWithFrame:CGRectMake(_width-250, _height/2-100, 200, 75) imageView:_yurt1];
    [self sceneryElementWithFrame:CGRectMake(_width-140, _height/2-150, 120, 50) imageView:_yurt1];
    
    //ship 飞船
    self.ship = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ship"]];
    [self sceneryElementWithFrame:CGRectMake(_width/3, _height/2, _width/3*2, _width/3) imageView:_ship];
    
    //text 文字
    self.text = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text"]];
    [self sceneryElementWithFrame:CGRectMake(20, _height/3*2, _width/3, _width/3) imageView:_text];
    
    //octocat 章鱼猫
    self.octact = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"octocat"]];
    [self sceneryElementWithFrame:CGRectMake(_width/2-_width/6+40, _height/3*2, _width/3, _width/3*1.2) imageView:_octact];
}

//初始化场景元素
- (void) sceneryElementWithFrame:(CGRect)frame imageView:(UIImageView *)iv {
    iv.frame = frame;
    [self.view addSubview:iv];
}

#pragma motionEffects 效果

//bg 背景 //yurt 蒙古包 //ship 飞船 //text 文字 //octocat 章鱼猫
- (void) motionEffects {
    [self addInterpolatingMotionEffect:100 target:_bg];
    [self addInterpolatingMotionEffect:120 target:_yurt2];
    [self addInterpolatingMotionEffect:160 target:_yurt1];
    [self addInterpolatingMotionEffect:480 target:_ship];
    [self addInterpolatingMotionEffect:20 target:_octact];
    [self addInterpolatingMotionEffect:50 target:_text];
}

//添加Interpolation motion effect的工具方法
- (void) addInterpolatingMotionEffect:(int) scope target:(UIImageView *)target {
    
    //初始化一个 水平方向的 UIInterpolatingMotionEffect
    UIInterpolatingMotionEffect * x_interpolation = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    //最大最小值设置
    x_interpolation.minimumRelativeValue = [NSNumber numberWithInt:-scope];
    x_interpolation.maximumRelativeValue = [NSNumber numberWithInt:scope];
    
    //初始化一个 垂直方向的 UIInterpolatingMotionEffect
    UIInterpolatingMotionEffect *y_interpolation = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    //最大最小值设置
    y_interpolation.minimumRelativeValue = [NSNumber numberWithInt:-scope/2];
    y_interpolation.maximumRelativeValue = [NSNumber numberWithInt:scope/2];
    
    //建立一个MotionEffectGroup,并把水平和垂直两种效果
    UIMotionEffectGroup * effectGroup = [[UIMotionEffectGroup alloc] init];
    effectGroup.motionEffects = @[x_interpolation, y_interpolation];
    
    //将MotionEffe绑定到UI元素上
    [target addMotionEffect:effectGroup];
}

@end
