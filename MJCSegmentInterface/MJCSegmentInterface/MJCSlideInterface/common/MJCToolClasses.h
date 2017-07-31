//
//  MJCToolClasses.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/2/22.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//RBG颜色
#define MJCRGBColor(r,g,b,alphas) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:alphas]
#define MJCScreenbound [UIScreen mainScreen].bounds
#define MJCScreenWidth [UIScreen mainScreen].bounds.size.width
#define MJCScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MJCToolClasses : NSObject

+ (MJCToolClasses *)toolClasses;

/** 选中滚动标题居中效果的方法的效果 */
- (void)selectedTitleCenter:(UIButton *)button titlesScrollView:(UIScrollView *)titlesScrollView;

-(void)setupIndicatorViewCenterAndWidthIsAnimal:(BOOL)isChildScollAnimal indicatorStyles:(NSUInteger)indicatorStyles selectedTitleButton:(UIButton*)selectedTitleButton indicatorFrame:(CGRect)indicatorFrame indicatorView:(UIButton*)indicatorView;



@end
