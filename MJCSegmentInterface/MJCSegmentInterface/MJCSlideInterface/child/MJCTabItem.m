//
//  MJCItemCell.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/6/29.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTabItem.h"
#import "UIView+MJCClassExtension.h"

@interface MJCTabItem ()

@property (nonatomic,weak) UIImageView *imageViews;

//@property (nonatomic,weak) UILabel *titlesLable;


@property (nonatomic,assign) CGFloat topTextMargin;
@property (nonatomic,assign) CGFloat bottomTextMargin;
@property (nonatomic,assign) CGFloat leftTextMargin;
@property (nonatomic,assign) CGFloat rightTextMargin;

@property (nonatomic,assign) CGFloat topImageMargin;
@property (nonatomic,assign) CGFloat bottomImageMargin;
@property (nonatomic,assign) CGFloat leftImageMargin;
@property (nonatomic,assign) CGFloat rightImageMargin;


@end

@implementation MJCTabItem

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupUIFrame];

}

- (UIImageView*)imageViews
{
    if (!_imageViews) {
        UIImageView *imageViews = [[UIImageView alloc]init];
//        imageViews.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageViews];
        _imageViews = imageViews;
    }
    return _imageViews;
}
- (UILabel*)titlesLable
{
    if (!_titlesLable) {
        UILabel *titlesLable = [[UILabel alloc]init];
        titlesLable.textColor = [UIColor blackColor];
        titlesLable.highlightedTextColor = [UIColor grayColor];
        titlesLable.font = [UIFont systemFontOfSize:14];
        titlesLable.textAlignment = NSTextAlignmentCenter;
        [titlesLable sizeToFit];
        [self.contentView addSubview:titlesLable];
        _titlesLable = titlesLable;
    }
    return _titlesLable;
}
-(void)setupUI
{
    [self imageViews];
    [self titlesLable];
}

-(void)setImageEffectStyles:(NSUInteger)imageEffectStyles
{
    _imageEffectStyles = imageEffectStyles;
}

-(void)setTextsEdgeInsets:(UIEdgeInsets)textsEdgeInsets
{
    _textsEdgeInsets = textsEdgeInsets;
    _leftTextMargin = textsEdgeInsets.left;
    _rightTextMargin = textsEdgeInsets.right;
    _topTextMargin = textsEdgeInsets.top;
    _bottomTextMargin = textsEdgeInsets.bottom;
}
-(void)setImagesEdgeInsets:(UIEdgeInsets)imagesEdgeInsets
{
    _imagesEdgeInsets = imagesEdgeInsets;
    _leftImageMargin = imagesEdgeInsets.left;
    _rightImageMargin = imagesEdgeInsets.right;
    _topImageMargin = imagesEdgeInsets.top;
    _bottomImageMargin = imagesEdgeInsets.bottom;
}
-(void)setupUIFrame
{
    CGFloat tabItemH = self.contentView.frame.size.height;
    CGFloat tabItemW = self.contentView.frame.size.width;
    CGFloat tabItemCenterX = tabItemW/2;
    CGFloat tabItemCenterY = tabItemH/2;
    if (_imageViews.image != nil) {
        if (_imageEffectStyles == 1) {
            [_titlesLable sizeToFit];
            _titlesLable.jc_y = (CGRectGetMaxY(self.contentView.frame)-_titlesLable.jc_height)+_topTextMargin-_bottomTextMargin;
            _titlesLable.jc_centerX = tabItemCenterX +_leftTextMargin-_rightTextMargin;
            _imageViews.frame = CGRectMake(0,0,0,0);
            [_imageViews sizeToFit];//自适应内容大小
            if (_imageViews.jc_height >= tabItemH) {
                _imageViews.jc_size = CGSizeMake(tabItemH/2.5,tabItemH/2.5);
            }
            _imageViews.jc_y = CGRectGetMinY(_titlesLable.frame)-_imageViews.jc_height+_topImageMargin-_bottomImageMargin;
            _imageViews.jc_centerX = tabItemCenterX +_leftImageMargin-_rightImageMargin;
        }else{
            _imageViews.frame = CGRectMake(0,0,0,0);
            [_imageViews sizeToFit];//图片自适应大小
            if (_imageViews.jc_height >= tabItemH) {
                _imageViews.jc_size = CGSizeMake(tabItemH/2.5,tabItemH/2.5);
            }
            _imageViews.jc_centerY = tabItemCenterY+_topImageMargin-_bottomImageMargin;
            _imageViews.jc_centerX = tabItemCenterX+_leftImageMargin-_rightImageMargin;
            _titlesLable.jc_x = CGRectGetMaxX(_imageViews.frame)+_leftTextMargin-_rightTextMargin + _rightImageMargin - _leftImageMargin;
            [_titlesLable sizeToFit];
            _titlesLable.jc_centerY = tabItemCenterY+_topTextMargin-_bottomTextMargin;
        }
    }else{
        [_titlesLable sizeToFit];
        _titlesLable.jc_centerX = tabItemCenterX;
        _titlesLable.jc_centerY = tabItemCenterY;
    }
}

-(void)setItemText:(NSString *)itemText
{
    _itemText = itemText;
    _titlesLable.text = itemText;
}
-(void)setItemTextFontSize:(CGFloat)itemTextFontSize
{
    _itemTextFontSize = itemTextFontSize;
    
    if (itemTextFontSize) {
        _titlesLable.font = [UIFont systemFontOfSize:itemTextFontSize];
        [self setNeedsLayout];
    }
}
-(void)setItemTitleNormalColor:(UIColor *)itemTitleNormalColor
{
    _itemTitleNormalColor = itemTitleNormalColor;
    
    if (itemTitleNormalColor) {
        _titlesLable.textColor = itemTitleNormalColor;
    }
}
-(void)setItemTitleSelectedColor:(UIColor *)itemTitleSelectedColor
{
    _itemTitleSelectedColor = itemTitleSelectedColor;
    if (itemTitleSelectedColor) {
        _titlesLable.highlightedTextColor = itemTitleSelectedColor;
    }
}
-(void)setItemBackNormalImage:(UIImage *)itemBackNormalImage
{
    _itemBackNormalImage = itemBackNormalImage;
    self.backgroundView = [[UIImageView alloc]initWithImage:itemBackNormalImage];
}
-(void)setItemBackSelectedImage:(UIImage *)itemBackSelectedImage
{
    _itemBackSelectedImage = itemBackSelectedImage;
    self.selectedBackgroundView = [[UIImageView alloc]initWithImage:itemBackSelectedImage];
}

-(void)setItemImageNormal:(UIImage *)itemImageNormal
{
    _itemImageNormal = itemImageNormal;
    if (itemImageNormal) {
        _imageViews.image = itemImageNormal;
    }
    //    [self layoutIfNeeded];
    //    [self setNeedsLayout];
}
-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    _tabItemImageSelected = tabItemImageSelected;
    
    _imageViews.highlightedImage = tabItemImageSelected;
}
-(void)setTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray
{
    _tabItemNormalImageArray =tabItemNormalImageArray;
    
    if (self.tag >= tabItemNormalImageArray.count) {
//        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",tabItemNormalImageArray.count,self.tag+1);
    }else{
        _imageViews.image = [UIImage imageNamed:tabItemNormalImageArray[self.tag]];
    }
}
-(void)setTabItemSelectedImageArray:(NSArray *)tabItemSelectedImageArray
{
    _tabItemSelectedImageArray = tabItemSelectedImageArray;
    if (self.tag >= tabItemSelectedImageArray.count) {
//        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",tabItemSelectedImageArray.count,self.tag+1);
    }else{
        _imageViews.highlightedImage = [UIImage imageNamed:tabItemSelectedImageArray[self.tag]];
    }
}
-(void)setItemNormalBackImageArray:(NSArray *)itemNormalBackImageArray
{
    _itemNormalBackImageArray = itemNormalBackImageArray;
    if (self.tag >= itemNormalBackImageArray.count) {
//        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",itemNormalBackImageArray.count,self.tag+1);
    }else{
        self.backgroundView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:itemNormalBackImageArray[self.tag]]];
    }
}
-(void)setItemSelectedBackImageArray:(NSArray *)itemSelectedBackImageArray
{
    _itemSelectedBackImageArray = itemSelectedBackImageArray;
    if (self.tag >= itemSelectedBackImageArray.count) {
//        NSLog(@"你的数组中的图片不够:图片count:%ld张 tabItem:%ld个",itemSelectedBackImageArray.count,self.tag+1);
    }else{
        self.selectedBackgroundView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:itemSelectedBackImageArray[self.tag]]];
    }
}

//此方法也能用,但我不想用
//-(void)setItemBackNormalDifferentImage:(NSString *)itemBackNormalDifferentImage
//{
//    _itemBackNormalDifferentImage = itemBackNormalDifferentImage;
//    
//    if (itemBackNormalDifferentImage) {
//        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:itemBackNormalDifferentImage]];
//    }else{
//        self.backgroundView = [[UIImageView alloc]initWithImage:_itemBackNormalImage];
//    }
//}
//-(void)setItemBackSelectedDifferentImage:(NSString *)itemBackSelectedDifferentImage
//{
//    _itemBackSelectedDifferentImage= itemBackSelectedDifferentImage;
//    if (itemBackSelectedDifferentImage) {
//        self.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:itemBackSelectedDifferentImage]];
//    }else{
//        self.selectedBackgroundView = [[UIImageView alloc]initWithImage:_itemBackSelectedImage];
//    }
//}


@end
