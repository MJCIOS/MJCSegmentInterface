//
//  MJCCommonTools.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/20.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//RBG颜色
#define MJCRandomColor MJCRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255),1.0)
#define MJCRGBColor(r,g,b,alphas) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:alphas]
#define MJCScreenbound [UIScreen mainScreen].bounds
#define MJCScreenWidth [UIScreen mainScreen].bounds.size.width
#define MJCScreenHeight [UIScreen mainScreen].bounds.size.height

#define MJCiPhone4s CGSizeMake(320.f, 480.f)
#define MJCiPhone5s CGSizeMake(320.f, 568.f)
#define MJCiPhone6s CGSizeMake(375.f, 667.f)
#define MJCiPhone7p CGSizeMake(414.f, 736.f)

#define iPhone4Height (480.f)
#define iPhone4Width (320.f)
#define iPhone5Height (568.f)
#define iPhone5Width (320.f)
#define iPhone6Height (667.f)
#define iPhone6Width (375.f)
#define iPhone6PlusHeight (736.f)
#define iPhone6PlusWidth (414.f)

#define i5scalsH ((iPhone5Height / iPhone6Height))
#define i6scalsH ((iPhone6Height / iPhone6Height))
#define plusScalsH ((iPhone6PlusHeight / iPhone6Height))

#define i5scalsW ((iPhone5Width / iPhone6Width))
#define i6scalsW ((iPhone6Width / iPhone6Width))
#define plusScalsW ((iPhone6PlusWidth / iPhone6Width))

#define MJCWeakSelf __weak typeof(self) weakSelf = self
#define MJCStrongSelf __strong typeof(self) strongSelf = self

@interface MJCCommonTools : NSObject

/** 图片转颜色 */
+(UIImage *)jc_imageWithColor:(UIColor *)color;
/** 通过16进制计算颜色 */
+(UIColor *)jc_colorFromHexRGB:(NSString *)inColorString;
/** 有导航栏或者tabbar时,保证标题栏不会被覆盖 */
+(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers rectEdge:(UIRectEdge)rectEdge;


@end
