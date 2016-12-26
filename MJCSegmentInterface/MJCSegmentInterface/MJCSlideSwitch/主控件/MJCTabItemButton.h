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

-(void)arraycount:(NSUInteger)arraycount buttonW:(CGFloat)buttonW buttonH:(CGFloat)buttonH scrollTitlesEnabled:(BOOL)scrollTitlesEnabled titlesScrollView:(UIScrollView*)titlesScrollView titlesView:(UIView*)titlesView titlesArr:(NSArray *)titlesArr imageStyle:(MJCImageEffectStyle)imageStyle;

-(void)setupTabItemTitlesfont:(UIFont *)tabItemTitlesfont;

-(void)setupTabItemBackColor:(UIColor *)tabItemBackColor SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;

-(void)setupTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor;

-(void)setupTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor;

-(void)setupTabItemImageNormal:(UIImage *)tabItemImageNormal;

-(void)setupTabItemImageSelected:(UIImage *)tabItemImageSelected;

-(void)setupTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray buttonTag:(NSUInteger)buttonTag;

-(void)setupTabItemImageSelectedArray:(NSArray *)tabItemSelectedImageArray buttonTag:(NSUInteger)buttonTag;

-(void)setupisTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame;

-(void)setupTabItemBackImageNormal:(UIImage *)tabItemBackImageNormal;

-(void)setupTabItemBackImageSelected:(UIImage *)tabItemBackImageSelected;

-(void)setupTabItemNormalBackImageArray:(NSArray *)tabItemNormalBackImageArray buttonTag:(NSUInteger)buttonTag;

-(void)setupTabItemBackImageSelectedArray:(NSArray *)tabItemSelectedBackImageArray buttonTag:(NSUInteger)buttonTag;


@end
