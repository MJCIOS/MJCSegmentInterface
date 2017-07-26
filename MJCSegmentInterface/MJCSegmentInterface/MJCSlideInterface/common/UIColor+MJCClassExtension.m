//
//  UIColor+MJCClassExtension.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/23.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "UIColor+MJCClassExtension.h"

@implementation UIColor (MJCClassExtension)

+(NSArray *)jc_getNeedColorRgbaArr:(UIColor *)needColor;
{
    CGFloat numberOfComponents = CGColorGetNumberOfComponents(needColor.CGColor);
    NSArray *rgbaComponentsArr;
    if (numberOfComponents == 4) {
        const CGFloat *components = CGColorGetComponents(needColor.CGColor);
        rgbaComponentsArr = [NSArray arrayWithObjects:@(components[0]), @(components[1]), @(components[2]), @(components[3]), nil];
    }else if (numberOfComponents == 2){
        if (CGColorEqualToColor(needColor.CGColor, [UIColor clearColor].CGColor)) {
            rgbaComponentsArr = [NSArray arrayWithObjects:@(0.0),@(0.0),@(0.0),@(0),nil];
        }
        if (CGColorEqualToColor(needColor.CGColor, [UIColor blackColor].CGColor)) {
            rgbaComponentsArr = [NSArray arrayWithObjects:@(0),@(0), @(0), @(1),nil];
        }
        if (CGColorEqualToColor(needColor.CGColor, [UIColor whiteColor].CGColor)) {
            rgbaComponentsArr = [NSArray arrayWithObjects:@(1),@(1),@(1),@(1),nil];
        }
        if (CGColorEqualToColor(needColor.CGColor, [UIColor grayColor].CGColor)) {
            rgbaComponentsArr = [NSArray arrayWithObjects:@(0.5),@(0.5),@(0.5),@(1),nil];
        }
        if (CGColorEqualToColor(needColor.CGColor, [UIColor lightGrayColor].CGColor)) {
            rgbaComponentsArr = [NSArray arrayWithObjects:@(0.667),@(0.667),@(0.667),@(1),nil];
        }
        if (CGColorEqualToColor(needColor.CGColor, [UIColor darkGrayColor].CGColor)) {
            rgbaComponentsArr = [NSArray arrayWithObjects:@(0.333),@(0.333),@(0.333),@(1),nil];
        }
    }
    return rgbaComponentsArr;
}
+(NSArray *)jc_gradientRGBAWith:(NSArray *)normalColorRgbaArr selectedColorRGBA:(NSArray*)selectedColorRgbaArr
{
    NSArray *gradientRGBAArr;
    if (normalColorRgbaArr && selectedColorRgbaArr) {
        CGFloat deltaR = [normalColorRgbaArr[0] floatValue] - [selectedColorRgbaArr[0] floatValue];
        CGFloat deltaG = [normalColorRgbaArr[1] floatValue] - [selectedColorRgbaArr[1] floatValue];
        CGFloat deltaB = [normalColorRgbaArr[2] floatValue] - [selectedColorRgbaArr[2] floatValue];
        CGFloat deltaA = [normalColorRgbaArr[3] floatValue] - [selectedColorRgbaArr[3] floatValue];
        gradientRGBAArr = [NSArray arrayWithObjects:@(deltaR), @(deltaG), @(deltaB), @(deltaA), nil];
    }
    return gradientRGBAArr;
}

+(UIColor *)oldColorWithSelectedColorRGBA:(NSArray*)selectedColorRGBA deltaRGBA:(NSArray*)deltaRGBA scale:(CGFloat)scale
{
    return [UIColor colorWithRed:[selectedColorRGBA[0] floatValue] + [deltaRGBA[0] floatValue] * scale green:[selectedColorRGBA[1] floatValue] + [deltaRGBA[1] floatValue] * scale blue:[selectedColorRGBA[2] floatValue] + [deltaRGBA[2] floatValue] * scale alpha:[selectedColorRGBA[3] floatValue] + [deltaRGBA[3] floatValue] * scale];
}
+(UIColor *)newColorWithNormalColorRGBARGBA:(NSArray*)normalColorRGBA deltaRGBA:(NSArray*)deltaRGBA scale:(CGFloat)scale
{
    return [UIColor colorWithRed:[normalColorRGBA[0] floatValue] - [deltaRGBA[0] floatValue] * scale green:[normalColorRGBA[1] floatValue] - [deltaRGBA[1] floatValue] * scale blue:[normalColorRGBA[2] floatValue] - [deltaRGBA[2] floatValue] * scale alpha:[normalColorRGBA[3] floatValue] - [deltaRGBA[3] floatValue] * scale];
}


@end
