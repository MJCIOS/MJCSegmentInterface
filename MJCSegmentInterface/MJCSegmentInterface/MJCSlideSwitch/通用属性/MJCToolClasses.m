//
//  MJCToolClasses.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/2/22.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCToolClasses.h"

@implementation MJCToolClasses

//防止导航栏挡住的方法
+(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers rectEdge:(UIRectEdge)rectEdge;
{
    if ([controllers respondsToSelector:@selector(edgesForExtendedLayout)]) {
        controllers.edgesForExtendedLayout = rectEdge;
    }
}



@end
