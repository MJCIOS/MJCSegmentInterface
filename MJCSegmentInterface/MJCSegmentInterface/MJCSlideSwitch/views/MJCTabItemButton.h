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

-(void) buttonW:(CGFloat)buttonW buttonH:(CGFloat)buttonH titlesScrollView:(UIScrollView*)titlesScrollView buttonTag:(NSInteger)buttonTag;

@property (nonatomic,assign) MJCImageEffectStyles imageStyle;

@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) UIFont *tabItemTitlesfont;
@property (nonatomic,strong) UIColor *tabItemBackColor;
@property (nonatomic,strong) UIColor *tabItemTitleNormalColor;
@property (nonatomic,strong) UIColor *tabItemTitleSelectedColor;
@property (nonatomic,strong) UIImage *tabItemImageNormal;
@property (nonatomic,strong) UIImage *tabItemImageSelected;
@property (nonatomic,strong) UIImage *tabItemBackImageNormal;
@property (nonatomic,strong) UIImage *tabItemBackImageSelected;
@property (nonatomic,strong) NSArray *tabItemNormalImageArray;
@property (nonatomic,strong) NSArray *tabItemSelectedImageArray;
@property (nonatomic,strong) NSArray *tabItemNormalBackImageArray;
@property (nonatomic,strong) NSArray *tabItemSelectedBackImageArray;

-(void)setuptabItemTitlesFont:(CGFloat)titlesMaxFont tabItemTitlesfont:(UIFont *)tabItemTitlesfont;

@end
