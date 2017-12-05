//
//  MJCCommontools.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/20.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCCommonTools.h"
#import "sys/utsname.h"

#define MJCiPhone4sB CGSizeMake(320.f, 480.f)
#define MJCiPhoneSEB CGSizeMake(320.f, 568.f)
#define MJCiPhone7B CGSizeMake(375.f, 667.f)
#define MJCiPhone7pB CGSizeMake(414.f, 736.f)


@implementation MJCCommontools

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

//获取手机型号
+ (NSString *)deviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    //iPhone
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone5";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone6Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone6sPlus";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone7";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone7Plus";
    return deviceString;
}

+ (BOOL )isIphone7Bounds;
{
    int iphonesW =  MJCScreenbound.size.width;
    int iphonesH =  MJCScreenbound.size.height;
    int iphone7W =  MJCiPhone7B.width;
    int iphone7H =  MJCiPhone7B.height;
    if (iphonesW == iphone7W && iphonesH == iphone7H) {
        return YES;
    }
    return NO;
}
+ (BOOL )isIphoneSEBounds;
{
    int iphonesW =  MJCScreenbound.size.width;
    int iphonesH =  MJCScreenbound.size.height;
    int iphone5cW =  MJCiPhoneSEB.width;
    int iphone5cH =  MJCiPhoneSEB.height;
    if (iphonesW == iphone5cW && iphonesH == iphone5cH) {
        return YES;
    }
    return NO;
}
+ (BOOL )isIphonePlusBounds;
{
    int iphonesW =  MJCScreenbound.size.width;
    int iphonesH =  MJCScreenbound.size.height;
    int iphonePlusW =  MJCiPhone7pB.width;
    int iphonePlusH =  MJCiPhone7pB.height;
    if (iphonesW == iphonePlusW && iphonesH == iphonePlusH) {
        return YES;
    }
    return NO;
}

+ (BOOL )isFalseFit;
{
    NSString   *deviceVersion =    [self deviceVersion];
    if ([deviceVersion isEqualToString:@"iPhone6sPlus"] || [deviceVersion isEqualToString:@"iPhone6s"] || [deviceVersion isEqualToString:@"iPhone6"] || [deviceVersion isEqualToString:@"iPhone6Plus"]) {
        int iphonesW =  MJCScreenbound.size.width;
        int iphonesH =  MJCScreenbound.size.height;
        int iphone5sW =  MJCiPhoneSEB.width;
        int iphone5sH =  MJCiPhoneSEB.height;
        if (iphonesW == iphone5sW && iphonesH == iphone5sH) {
            return YES;
        }
    }
    return NO;
}


@end
