//
//  MJCTabItemButton.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/11/22.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTabItem.h"
#import "UIView+MJCClassExtension.h"

static CGFloat const tenMargin = 15;

@interface MJCTabItem()

@property (nonatomic,assign) CGFloat topTextMargin;
@property (nonatomic,assign) CGFloat bottomTextMargin;
@property (nonatomic,assign) CGFloat leftTextMargin;
@property (nonatomic,assign) CGFloat rightTextMargin;

@property (nonatomic,assign) CGFloat topImageMargin;
@property (nonatomic,assign) CGFloat bottomImageMargin;
@property (nonatomic,assign) CGFloat leftImageMargin;
@property (nonatomic,assign) CGFloat rightImageMargin;

@property (nonatomic,assign) CGFloat imageViewW;
@property (nonatomic,assign) CGFloat imageViewH;

@end

@implementation MJCTabItem

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self setupUIFrame];
}

-(void)setupUIFrame
{
    CGFloat tabItemH = self.frame.size.height;
    CGFloat tabItemW = self.frame.size.width;
    CGFloat tabItemCenterX = tabItemW/2;
    CGFloat tabItemCenterY = tabItemH/2;
    if (self.imageView.image != nil) {
        if (_imageEffectStyles == 1) {
            [self.titleLabel sizeToFit];
            self.titleLabel.jc_y = (tabItemH-self.titleLabel.jc_height)+_topTextMargin-_bottomTextMargin;
            self.titleLabel.jc_centerX = tabItemCenterX +_leftTextMargin-_rightTextMargin;
            self.imageView.frame = CGRectMake(0,0,0,0);
            [self.imageView sizeToFit];
            if (_itemImageSize.width == 0 || _itemImageSize.height == 0 ) {
                self.imageView.jc_size = CGSizeMake(self.imageView.jc_size.width, self.imageView.jc_size.height);
            }else{
                self.imageView.jc_size = CGSizeMake(_imageViewW,_imageViewH); }
            self.imageView.jc_centerY = tabItemCenterY+_topImageMargin-_bottomImageMargin;
            self.imageView.jc_centerX = tabItemCenterX +_leftImageMargin-_rightImageMargin;
        }else if (_imageEffectStyles == 0) {
            [self.titleLabel sizeToFit];
            self.titleLabel.jc_centerY = tabItemCenterY+_topTextMargin-_bottomTextMargin;
            self.titleLabel.jc_centerX = tabItemCenterX +_leftTextMargin-_rightTextMargin+tenMargin;
            if (_itemImageSize.width == 0 || _itemImageSize.height == 0 ) {
                self.imageView.jc_size = CGSizeMake(self.imageView.jc_size.width, self.imageView.jc_size.height);
            }else{
                self.imageView.jc_size = CGSizeMake(_imageViewW,_imageViewH); }
            self.imageView.jc_centerX = tabItemCenterX +_leftImageMargin-_rightImageMargin-tenMargin;
            self.imageView.jc_centerY = tabItemCenterY+_topImageMargin-_bottomImageMargin;
        }else{
            [self.titleLabel sizeToFit];
            self.titleLabel.jc_centerY = tabItemCenterY+_topTextMargin-_bottomTextMargin;
            self.titleLabel.jc_centerX = tabItemCenterX +_leftTextMargin-_rightTextMargin;
            if (_itemImageSize.width == 0 || _itemImageSize.height == 0 ) {
                self.imageView.jc_size = CGSizeMake(self.imageView.jc_size.width, self.imageView.jc_size.height);
            }else{
                self.imageView.jc_size = CGSizeMake(_imageViewW,_imageViewH); }
            self.imageView.jc_centerX = tabItemCenterX +_leftImageMargin-_rightImageMargin;
            self.imageView.jc_centerY = tabItemCenterY+_topImageMargin-_bottomImageMargin;
        }
    }else{
        [self.titleLabel sizeToFit];
//        self.titleLabel.frame = CGRectMake(tabItemCenterX, tabItemCenterY, self.titleLabel.jc_width, self.titleLabel.jc_height);
        self.titleLabel.jc_centerX = tabItemCenterX;
        self.titleLabel.jc_centerY = tabItemCenterY;
    }
}

-(void)setImageEffectStyles:(NSUInteger)imageEffectStyles
{
    _imageEffectStyles = imageEffectStyles;
}

-(void)setItemImageSize:(CGSize)itemImageSize
{
    _itemImageSize = itemImageSize;
    _imageViewW  = _itemImageSize.width;
    _imageViewH = _itemImageSize.height;
}
-(void)setItemTextsEdgeInsets:(UIEdgeInsets)itemTextsEdgeInsets
{
    _itemTextsEdgeInsets = itemTextsEdgeInsets;
    _leftTextMargin = itemTextsEdgeInsets.left;
    _rightTextMargin = itemTextsEdgeInsets.right;
    _topTextMargin = itemTextsEdgeInsets.top;
    _bottomTextMargin = itemTextsEdgeInsets.bottom;
}
-(void)setItemImagesEdgeInsets:(UIEdgeInsets)itemImagesEdgeInsets
{
    _itemImagesEdgeInsets = itemImagesEdgeInsets;
    _leftImageMargin = itemImagesEdgeInsets.left;
    _rightImageMargin = itemImagesEdgeInsets.right;
    _topImageMargin = itemImagesEdgeInsets.top;
    _bottomImageMargin = itemImagesEdgeInsets.bottom;
}

-(void)setItemText:(NSString *)itemText
{
    _itemText = itemText;
    [self setTitle:itemText forState:UIControlStateNormal];
}
-(void)setItemTextFontSize:(CGFloat)itemTextFontSize
{
    _itemTextFontSize = itemTextFontSize;
    
    if (itemTextFontSize) {
        self.titleLabel.font = [UIFont systemFontOfSize:itemTextFontSize];
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}
-(void)setItemTitleNormalColor:(UIColor *)itemTitleNormalColor
{
    _itemTitleNormalColor = itemTitleNormalColor;
    if (itemTitleNormalColor) {
        [self setTitleColor:itemTitleNormalColor forState:UIControlStateNormal];
    }
}
-(void)setItemTitleSelectedColor:(UIColor *)itemTitleSelectedColor
{
    _itemTitleSelectedColor = itemTitleSelectedColor;
    if (itemTitleSelectedColor) {
        [self setTitleColor:itemTitleSelectedColor forState:UIControlStateSelected];
    }
}
-(void)setItemBackNormalImage:(UIImage *)itemBackNormalImage
{
    _itemBackNormalImage = itemBackNormalImage;
    [self setBackgroundImage:itemBackNormalImage forState:UIControlStateNormal];
}
-(void)setItemBackSelectedImage:(UIImage *)itemBackSelectedImage
{
    _itemBackSelectedImage = itemBackSelectedImage;
    [self setBackgroundImage:itemBackSelectedImage forState:UIControlStateSelected];
}

-(void)setItemImageNormal:(UIImage *)itemImageNormal
{
    _itemImageNormal = itemImageNormal;
    [self setImage:itemImageNormal forState:UIControlStateNormal];
}
-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    _tabItemImageSelected = tabItemImageSelected;
    [self setImage:tabItemImageSelected forState:UIControlStateSelected];
}
-(void)setTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray
{
    _tabItemNormalImageArray =tabItemNormalImageArray;
    if (self.tag >= tabItemNormalImageArray.count) {
        //        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",tabItemNormalImageArray.count,self.tag+1);
    }else{
        [self setImage:[UIImage imageNamed:tabItemNormalImageArray[self.tag]] forState:UIControlStateNormal];
    }
}
-(void)setTabItemSelectedImageArray:(NSArray *)tabItemSelectedImageArray
{
    _tabItemSelectedImageArray = tabItemSelectedImageArray;
    if (self.tag >= tabItemSelectedImageArray.count) {
        //        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",tabItemSelectedImageArray.count,self.tag+1);
    }else{
        [self setImage:[UIImage imageNamed:tabItemSelectedImageArray[self.tag]] forState:UIControlStateSelected];
    }
}
-(void)setItemNormalBackImageArray:(NSArray *)itemNormalBackImageArray
{
    _itemNormalBackImageArray = itemNormalBackImageArray;
    if (self.tag >= itemNormalBackImageArray.count) {
        //        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",itemNormalBackImageArray.count,self.tag+1);
    }else{
        [self setBackgroundImage:[UIImage imageNamed:itemNormalBackImageArray[self.tag]] forState:UIControlStateNormal];
    }
}
-(void)setItemSelectedBackImageArray:(NSArray *)itemSelectedBackImageArray
{
    _itemSelectedBackImageArray = itemSelectedBackImageArray;
    if (self.tag >= itemSelectedBackImageArray.count) {
        //        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",itemSelectedBackImageArray.count,self.tag+1);
    }else{
        [self setBackgroundImage:[UIImage imageNamed:itemSelectedBackImageArray[self.tag]] forState:UIControlStateSelected];
    }
}

-(void)setItemTitleNormalColorArray:(NSArray *)itemTitleNormalColorArray
{
    _itemTitleNormalColorArray = itemTitleNormalColorArray;
    
    if (self.tag >= itemTitleNormalColorArray.count) {
        //        NSLog(@"你的数组中的颜色不够:颜色count:%ld张 tabItem:%ld个",itemTitleSelectedColorArray.count,self.tag+1);
    }else{
        [self setTitleColor:itemTitleNormalColorArray[self.tag] forState:UIControlStateNormal];
    }
}
-(void)setItemTitleSelectedColorArray:(NSArray *)itemTitleSelectedColorArray
{
    _itemTitleSelectedColorArray = itemTitleSelectedColorArray;
    if (self.tag >= itemTitleSelectedColorArray.count) {
        //        NSLog(@"你的数组中的颜色不够:颜色count:%ld张 tabItem:%ld个",itemTitleSelectedColorArray.count,self.tag+1);
    }else{
        [self setTitleColor:itemTitleSelectedColorArray[self.tag] forState:UIControlStateSelected];
    }
}


-(void)setHighlighted:(BOOL)highlighted
{
    
}

@end
