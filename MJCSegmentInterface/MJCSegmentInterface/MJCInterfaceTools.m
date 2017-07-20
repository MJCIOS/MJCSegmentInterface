//
//  MJCTools.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import "MJCInterfaceTools.h"

@implementation MJCInterfaceTools

+(NSString *)setupNSStringWithNumberCount:(NSInteger)count;
{
    NSString *numberString;
    if (count == 1) {
        numberString = @"一";
    }
    if (count == 2) {
        numberString = @"二";
    }
    if (count == 3) {
        numberString = @"三";
    }
    if (count == 4) {
        numberString = @"四";
    }
    if (count == 5) {
        numberString = @"五";
    }
    if (count == 6) {
        numberString = @"六";
    }
    if (count == 7) {
        numberString = @"七";
    }
    if (count == 8) {
        numberString = @"八";
    }
    if (count == 9) {
        numberString =  @"九";
    }
    if (count == 10) {
        numberString = @"十";
    }
    return numberString;
}

+(UIViewController *)setupViewControllersStr:(NSString *)vcStr;
{
    Class class = NSClassFromString(vcStr);
    return [class new];
}

@end
