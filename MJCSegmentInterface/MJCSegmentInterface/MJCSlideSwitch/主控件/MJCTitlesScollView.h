//
//  MJCTitlesScollView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/11/21.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCTitlesScollView : UIScrollView


//设置标题颜色
-(void)setTitlesScrollViewColor:(UIColor *)titlesScrollViewColor SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;

//设置frame
-(void)isTitlesScrollViewframe:(BOOL)isTitlesScrollViewframe titlesViewframe:(CGRect)titlesScrollViewframe;



@end
