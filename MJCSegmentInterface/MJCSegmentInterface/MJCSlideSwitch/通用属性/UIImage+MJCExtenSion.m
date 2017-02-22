//
//  UIImage+MJCExtenSion.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/2/22.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "UIImage+MJCExtenSion.h"

@implementation UIImage (MJCExtenSion)

/**
 *  图片转换成颜色的方法
 */
+(instancetype)mjc_imageWithColor:(UIColor *)color;
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


@end
