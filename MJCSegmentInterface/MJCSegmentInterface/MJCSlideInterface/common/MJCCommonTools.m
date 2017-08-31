//
//  MJCCommonTools.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/20.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCCommonTools.h"

@implementation MJCCommonTools

/**
 *  图片转换成颜色的方法
 */
+(UIImage *)jc_imageWithColor:(UIColor *)color;
{
    CGRect rect1 = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect1.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect1);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
/** 通过16进制计算颜色 */
+ (UIColor *)jc_colorFromHexRGB:(NSString *)inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}


//防止导航栏挡住的方法
+(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers rectEdge:(UIRectEdge)rectEdge;
{
    if ([controllers respondsToSelector:@selector(edgesForExtendedLayout)]) {
        controllers.edgesForExtendedLayout = rectEdge;
    }
}


@end
