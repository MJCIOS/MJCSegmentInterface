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


-(void)isChildFrame:(BOOL)isChildFrame setChildFrame:(CGRect)childFrame SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;


@end
