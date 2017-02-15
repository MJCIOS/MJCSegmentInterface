//
//  MJCTitlesView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCTitlesView : UIView

@property (nonatomic,strong) UIColor *titlesViewColor;

@property (nonatomic,assign) CGRect titlesViewFrame;


@property (nonatomic,strong) UIView *mainViews;


//-(void)addSubviews:(UIView *)mainViews SegmentInterfaceStyle:(MJCTitlesInterfaceStyles)SegmentInterfaceStyle;


@end
