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

@property (nonatomic,assign) BOOL bottomHidden;

@property (nonatomic,assign) CGRect bottomFrame;

@property (nonatomic,assign) CGFloat bottomHeight;

@property (nonatomic,strong) UIScrollView * titlesScrollView;

@property (nonatomic,strong) UIView *titlesView;


@end
