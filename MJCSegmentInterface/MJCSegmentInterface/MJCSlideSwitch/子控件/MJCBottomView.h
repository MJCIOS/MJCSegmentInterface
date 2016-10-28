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

@property (nonatomic,strong) UIColor *bottomBackgroundColor;

-(void)setBottomHidden:(BOOL)bottomHidden SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;
-(void)isBottomFrame:(BOOL)isBottomFrame setBottomFrame:(CGRect)setBottomFrame bottomHegiht:(CGFloat)bottomHegiht titlesView:(UIView *)titlesView;


@end
