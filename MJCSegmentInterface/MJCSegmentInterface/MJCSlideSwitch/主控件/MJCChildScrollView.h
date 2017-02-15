//
//  MJCChildScrollView.h
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/26.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCChildScrollView : UIScrollView

-(void)setupChildFrame:(CGRect)childFrame titlesViewFrame:(CGRect)titlesViewFrame titlesScrollFrame:(CGRect)titlesScrollFrame MJCSeMentTitleBarStyle:(MJCSeMentTitleBarStyles)MJCSeMentTitleBarStyle;

@property (nonatomic,assign) CGRect childFrame;

@end
