//
//  MJCChildsView.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/6/29.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCChildsView.h"

@implementation MJCChildsView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.pagingEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

@end
