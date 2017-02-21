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

@property (nonatomic,assign) BOOL topHidden;

@property (nonatomic,assign) CGRect topFrame;

@property (nonatomic,assign) CGFloat topHeight;

@property (nonatomic,strong) UIScrollView * titlesScrollView;


@end
