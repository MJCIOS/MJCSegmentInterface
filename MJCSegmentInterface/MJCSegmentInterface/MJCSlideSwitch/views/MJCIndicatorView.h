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

@property (nonatomic,assign) CGFloat indicatorWidth;

@property (nonatomic,assign) CGFloat indicatorHeight;

@property (nonatomic,strong) UIScrollView *titlesScrollView;

@property (nonatomic,strong) UIButton *selectedTitleButton;

@property (nonatomic,assign) MJCIndicatorStyles MJCIndicatorStyle;


//@property (nonatomic,assign) CGRect indicatorFrame;

@end
