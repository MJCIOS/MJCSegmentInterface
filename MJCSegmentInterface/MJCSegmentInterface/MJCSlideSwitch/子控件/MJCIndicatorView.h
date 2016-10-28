//
//  MJCIndicatorView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCIndicatorView : UIView




-(void)setIndicatorViewHidden:(BOOL)indicatorViewHidden;

//设置位置
-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame indicatorWidth:(CGFloat)indicatorWidth titlesView:(UIView *)titlesView firstTitleButton:(UIButton *)firstTitleButton SegmentInterFaceStyle:(MJCSegmentIndicatorStyle)SegmentIndicatorStyle;

//设置底部指示器的颜色
-(void)setIndicatorColor:(UIColor *)indicatorColor firstTitleButton:(UIButton*)firstTitleButton;


@end
