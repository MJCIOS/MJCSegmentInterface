//
//  MJCtools.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//RBG颜色
#define MJCRGBColor(r,g,b,alphas) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:alphas]
#define MJCScreenbound [UIScreen mainScreen].bounds
#define MJCScreenWidth [UIScreen mainScreen].bounds.size.width
#define MJCScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MJCInterfacetools : NSObject
+(UIViewController *)setupViewControllersStr:(NSString *)vcStr;
@end
