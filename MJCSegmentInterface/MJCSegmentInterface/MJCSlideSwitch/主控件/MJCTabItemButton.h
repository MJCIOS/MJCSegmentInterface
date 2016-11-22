//
//  MJCTabItemButton.h
//  MJCSegmentInterface
//
//  Created by mjc on 16/11/22.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJCSegmentInterface.h"

@interface MJCTabItemButton : UIButton

-(void)arraycount:(NSUInteger)arraycount buttonW:(CGFloat)buttonW buttonH:(CGFloat)buttonH scrollTitlesEnabled:(BOOL)scrollTitlesEnabled titlesScrollView:(UIScrollView*)titlesScrollView titlesView:(UIView*)titlesView isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame tabItemTitlesfont:(UIFont*)tabItemTitlesfont SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle tabItemBackColor:(UIColor*)tabItemBackColor tabItemTitleNormalColor:(UIColor*)tabItemTitleNormalColor tabItemTitleSelectedColor:(UIColor*)tabItemTitleSelectedColor tabItemImageNormal:(UIImage*)tabItemImageNormal tabItemImageSelected:(UIImage *)tabItemImageSelected tabItemNormalImageArray:(NSArray *)tabItemNormalImageArray tabItemImageSelectedArray:(NSArray *)tabItemSelectedImageArray;


@end
