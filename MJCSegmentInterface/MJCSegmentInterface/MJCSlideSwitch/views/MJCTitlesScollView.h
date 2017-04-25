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

@property (nonatomic,strong) UIColor *titlesScrollColor;

@property (nonatomic,assign) CGRect titlesScrollFrame;

@property (nonatomic,strong) UIView *mainViews;

@end
