//
//  MJCItemCell.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/6/29.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTabItem.h"
#import "UIView+interFaceExtenSion.h"

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
    
    if (_imageViews.image != nil) {//有图片的情况下
        if (_imageEffectStyles == 1) {//图片与文字类型是上下位置的情况
            [_titlesLable sizeToFit];//文字自适应内容宽度高度
            _titlesLable.mjc_y = (CGRectGetMaxY(self.contentView.frame)-_titlesLable.mjc_height)+_topTextMargin-_bottomTextMargin;//文字的Y值,外加上间距和底部间距
            //文字它的centerX ,外加左间距和右间距
            _titlesLable.mjc_centerX = tabItemCenterX +_leftTextMargin-_rightTextMargin;
            _imageViews.frame = CGRectMake(0,0,0,0);
            [_imageViews sizeToFit];//自适应内容大小
            if (_imageViews.mjc_height >= tabItemH) {//防止图片太大,限制它的宽度大小
                _imageViews.mjc_size = CGSizeMake(tabItemH/2.5,tabItemH/2.5);
            }
            //设置图片的Y值,外加顶部间距和底部间距
            _imageViews.mjc_y = CGRectGetMinY(_titlesLable.frame)-_imageViews.mjc_height+_topImageMargin-_bottomImageMargin;
            //设置图片的centerX与左间距和右间距
            _imageViews.mjc_centerX = tabItemCenterX +_leftImageMargin-_rightImageMargin;
        
        }else{//图片与文字类型是左右位置的情况
            _imageViews.frame = CGRectMake(0,0,0,0);
            [_imageViews sizeToFit];//图片自适应大小
            if (_imageViews.mjc_height >= tabItemH) {
                _imageViews.mjc_size = CGSizeMake(tabItemH/2.5,tabItemH/2.5);
            }
            //图片的centerY与图片上间距与底部间距
            _imageViews.mjc_centerY = tabItemCenterY+_topImageMargin-_bottomImageMargin;
            //图片的centerX与图片左间距与右间距
            _imageViews.mjc_centerX = tabItemCenterX+_leftImageMargin-_rightImageMargin;
            //titlesLable的x,如果不加上,减去图片的左右间距的话,会导致titlesLable一直随着image移动,导致图片没间距了
            _titlesLable.mjc_x = CGRectGetMaxX(_imageViews.frame)+_leftTextMargin-_rightTextMargin + _rightImageMargin - _leftImageMargin;
            [_titlesLable sizeToFit];
            _titlesLable.mjc_centerY = tabItemCenterY+_topTextMargin-_bottomTextMargin;
        }
    }else{//没图片的情况下
        [_titlesLable sizeToFit];
        _titlesLable.mjc_centerX = tabItemCenterX;
        _titlesLable.mjc_centerY = tabItemCenterY;
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
