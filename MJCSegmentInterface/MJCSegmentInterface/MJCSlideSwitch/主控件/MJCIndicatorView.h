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

@property (nonatomic,assign) BOOL indicatorHidden;

@property (nonatomic,strong) UIColor *indicatorBackgroundColor;

@property (nonatomic,assign) CGRect indicatorFrame;

@property (nonatomic,assign) CGFloat indicatorWidth;

@property (nonatomic,assign) CGFloat indicatorHeight;



-(void)titlesScroll:(UIScrollView *)titlesScroll firstButton:(UIButton *)firstButton SegmentInterFaceStyle:(MJCIndicatorStyles)SegmentIndicatorStyle;

-(void)titlesView:(UIView *)titlesView firstButton:(UIButton *)firstButton SegmentInterFaceStyle:(MJCIndicatorStyles)SegmentIndicatorStyle;

@end
