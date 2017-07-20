//
//  MJCItemCell.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/6/29.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MJCSegmentInterface;
@interface MJCTabItem : UICollectionViewCell
/** 标题数据 */
@property (nonatomic,copy) NSString *itemText;
/** item文字大小 */
@property (nonatomic,assign) CGFloat itemTextFontSize;
/** tabItemtitle普通状态颜色 */
@property (nonatomic,strong) UIColor *itemTitleNormalColor;
/** tabItemtitle点击状态下文字颜色 */
@property (nonatomic,strong) UIColor *itemTitleSelectedColor;

/** 普通状态下背景图片 */
@property (nonatomic,strong) UIImage *itemBackNormalImage;
/** 点击状态下背景图片 */
@property (nonatomic,strong) UIImage *itemBackSelectedImage;
//* 普通状态下背景图片数组 
@property (nonatomic,strong) NSArray *itemNormalBackImageArray;
//* 点击状态下背景图片数组 
@property (nonatomic,strong) NSArray *itemSelectedBackImageArray;

/** 普通状态下图片 */
@property (nonatomic,strong) UIImage *itemImageNormal;
/** 点击状态下图片 */
@property (nonatomic,strong) UIImage *tabItemImageSelected;
/** 普通状态下图片数组 */
@property (nonatomic,strong) NSArray *tabItemNormalImageArray;
/** 点击状态下图片数组 */
@property (nonatomic,strong) NSArray *tabItemSelectedImageArray;

//标题文字的内边距
@property(nonatomic)   UIEdgeInsets textsEdgeInsets;
//标题图片的内边距
@property(nonatomic)   UIEdgeInsets imagesEdgeInsets;

@property (nonatomic,weak) UILabel *titlesLable;

@property (nonatomic,assign) NSUInteger imageEffectStyles;


///** 普通状态下不同的图片 */
//@property (nonatomic,copy) NSString *itemBackNormalDifferentImage;
///** 点击状态下不同的图片 */
//@property (nonatomic,copy) NSString *itemBackSelectedDifferentImage;


@end
