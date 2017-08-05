//
//  MJCTools.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import "MJCInterfaceTools.h"

@implementation MJCInterfaceTools

+(UIViewController *)setupViewControllersStr:(NSString *)vcStr;
{
    Class class = NSClassFromString(vcStr);
    return [class new];
}

@end
