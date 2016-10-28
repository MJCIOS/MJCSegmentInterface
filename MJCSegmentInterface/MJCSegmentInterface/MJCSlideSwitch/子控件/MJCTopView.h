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


/** 背景色 */
@property (nonatomic,strong) UIColor *topBackgroundColor;



-(void)settopHidden:(BOOL)topHidden SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;

//设置底部横线的frame
-(void)isTopFrame:(BOOL)isTopFrame settopFrame:(CGRect)topFrame topHegiht:(CGFloat)topHegiht titlesView:(UIView *)titlesView;


@end
