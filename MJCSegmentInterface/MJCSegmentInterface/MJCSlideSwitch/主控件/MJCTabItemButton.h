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

-(void)setTabItemTitlesfont:(UIFont *)tabItemTitlesfont;

-(void)setTabItemBackColor:(UIColor *)tabItemBackColor SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;

-(void)setTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor;

-(void)setTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor;

-(void)setTabItemImageNormal:(UIImage *)tabItemImageNormal;

-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected;

-(void)setTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray buttonTag:(NSUInteger)buttonTag;

-(void)setTabItemImageSelectedArray:(NSArray *)tabItemSelectedImageArray buttonTag:(NSUInteger)buttonTag;

-(void)isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame;

-(void)setTabItemBackImageNormal:(UIImage *)tabItemBackImageNormal;

-(void)setTabItemBackImageSelected:(UIImage *)tabItemBackImageSelected;

-(void)setTabItemNormalBackImageArray:(NSArray *)tabItemNormalBackImageArray buttonTag:(NSUInteger)buttonTag;

-(void)setTabItemBackImageSelectedArray:(NSArray *)tabItemSelectedBackImageArray buttonTag:(NSUInteger)buttonTag;


@end
