//
//  MJCTabItemButton.h
//  MJCSegmentInterface
//
//  Created by mjc on 16/11/22.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJCTabItem : UIButton
@property (nonatomic,copy) NSString *itemText;
@property (nonatomic,assign) CGFloat itemTextFontSize;
@property (nonatomic,strong) NSArray *itemTitleNormalColorArray;
@property (nonatomic,strong) NSArray *itemTitleSelectedColorArray;
@property (nonatomic,strong) UIColor *itemTitleNormalColor;
@property (nonatomic,strong) UIColor *itemTitleSelectedColor;
@property (nonatomic,strong) UIImage *itemBackNormalImage;
@property (nonatomic,strong) UIImage *itemBackSelectedImage;
@property (nonatomic,strong) NSArray *itemNormalBackImageArray;
@property (nonatomic,strong) NSArray *itemSelectedBackImageArray;
@property (nonatomic,strong) UIImage *itemImageNormal;
@property (nonatomic,strong) UIImage *tabItemImageSelected;
@property (nonatomic,strong) NSArray *tabItemNormalImageArray;
@property (nonatomic,strong) NSArray *tabItemSelectedImageArray;
@property(nonatomic)   UIEdgeInsets itemTextsEdgeInsets;
@property(nonatomic)   UIEdgeInsets itemImagesEdgeInsets;
@property(nonatomic,assign)   CGSize itemImageSize;
@property (nonatomic,assign) NSUInteger imageEffectStyles;
@end
