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

-(void)arraycount:(NSUInteger)arraycount buttonW:(CGFloat)buttonW buttonH:(CGFloat)buttonH titlesScrollView:(UIScrollView*)titlesScrollView titlesView:(UIView*)titlesView titlesArr:(NSArray *)titlesArr imageStyle:(MJCImageEffectStyles)imageStyle MJCSeMentTitleBarStyle:(MJCSeMentTitleBarStyles)MJCSeMentTitleBarStyle;



@property (nonatomic,strong) UIFont *tabItemTitlesfont;

@property (nonatomic,strong) UIColor *tabItemBackColor;

@property (nonatomic,strong) UIColor *tabItemTitleNormalColor;

@property (nonatomic,strong) UIColor *tabItemTitleSelectedColor;

@property (nonatomic,strong) UIImage *tabItemImageNormal;

@property (nonatomic,strong) UIImage *tabItemImageSelected;

@property (nonatomic,strong) UIImage *tabItemBackImageNormal;

@property (nonatomic,strong) UIImage *tabItemBackImageSelected;


-(void)setupTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray buttonTag:(NSUInteger)buttonTag;

-(void)setupTabItemImageSelectedArray:(NSArray *)tabItemSelectedImageArray buttonTag:(NSUInteger)buttonTag;

-(void)setupTabItemNormalBackImageArray:(NSArray *)tabItemNormalBackImageArray buttonTag:(NSUInteger)buttonTag;

-(void)setupTabItemBackImageSelectedArray:(NSArray *)tabItemSelectedBackImageArray buttonTag:(NSUInteger)buttonTag;


-(void)setupTabItemlayer:(CGFloat)layerCornerRadius layerMasksToBounds:(BOOL)layerMasksToBounds;

@end
