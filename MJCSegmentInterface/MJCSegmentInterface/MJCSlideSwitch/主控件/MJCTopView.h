//
//  MJCTopView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCTopView : UIView


@property (nonatomic,strong) UIColor *topBackgroundColor;


-(void)settopHidden:(BOOL)topHidden;

-(void)isTopFrame:(BOOL)isTopFrame settopFrame:(CGRect)topFrame topHegiht:(CGFloat)topHegiht titlesView:(UIView *)titlesView;

-(void)isTopFrame:(BOOL)isTopFrame settopFrame:(CGRect)topFrame topHegiht:(CGFloat)topHegiht titlesScroll:(UIScrollView *)titlesScroll;


@end
