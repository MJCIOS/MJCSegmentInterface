//
//  MJCRightView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCRightView : UIView


/** 背景色 */
@property (nonatomic,strong) UIColor *rightBackgroundColor;

-(void)setRightHeght:(CGFloat)rightHeght titlesButton:(UIButton *)titlesButton;

//设置头部横线是否隐藏
-(void)setRightViewHidden:(BOOL)rightViewHidden setRightViewShow:(BOOL)rightViewShow inter:(NSUInteger)inter titlesArr:(NSArray *)titlesArr
 SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;



@end
