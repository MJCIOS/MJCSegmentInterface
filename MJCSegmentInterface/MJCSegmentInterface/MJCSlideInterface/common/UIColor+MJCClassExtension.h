//
//  UIColor+MJCClassExtension.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/23.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MJCClassExtension)

+(NSArray *)jc_getNeedColorRgbaArr:(UIColor *)needColor;
+(NSArray *)jc_gradientRGBAWith:(NSArray *)normalColorRgbaArr selectedColorRGBA:(NSArray*)selectedColorRgbaArr;
+(UIColor *)oldColorWithSelectedColorRGBA:(NSArray*)selectedColorRGBA deltaRGBA:(NSArray*)deltaRGBA scale:(CGFloat)scale;
+(UIColor *)newColorWithNormalColorRGBARGBA:(NSArray*)normalColorRGBA deltaRGBA:(NSArray*)deltaRGBA scale:(CGFloat)scale;

@end
