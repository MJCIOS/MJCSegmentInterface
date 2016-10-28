//
//  MJCBottomView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCBottomView : UIView


/** 背景色 */
@property (nonatomic,strong) UIColor *bottomBackgroundColor;


/** 设置是否隐藏显示 */
-(void)setBottomHidden:(BOOL)bottomHidden SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;


/** 设置底部横线的frame */
-(void)isBottomFrame:(BOOL)isBottomFrame setBottomFrame:(CGRect)setBottomFrame bottomHegiht:(CGFloat)bottomHegiht titlesView:(UIView *)titlesView;


@end
