//
//  MJCCommonTools.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/20.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+MJCClassExtension.h"
#import "UIButton+MJCClassExtension.h"
#import "UILabel+MJCClassExtension.h"


//RBG颜色
#define MJCRGBColor(r,g,b,alphas) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:alphas]
#define MJCScreenbound [UIScreen mainScreen].bounds
#define MJCScreenWidth [UIScreen mainScreen].bounds.size.width
#define MJCScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MJCCommonTools : NSObject

/** 图片转颜色 */
+(UIImage *)jc_imageWithColor:(UIColor *)color;
/** 通过16进制计算颜色 */
+(UIColor *)jc_colorFromHexRGB:(NSString *)inColorString;



@end
