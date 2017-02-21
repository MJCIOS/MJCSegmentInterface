//
//  MJCTabItemButton.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/11/22.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCTabItemButton.h"
#import "UIView+MJCExtenSion.h"


@interface MJCTabItemButton()

/** buttonW */
@property (nonatomic,assign) CGFloat btnW;
@property (nonatomic,assign) CGFloat btnH;

@property (nonatomic,assign) CGFloat btnX;

@property (nonatomic,assign) MJCImageEffectStyles imageEffectStyle;

@end


@implementation MJCTabItemButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeCenter;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_imageEffectStyle == MJCImageUpDownStyle) {
        
        self.imageView.mjc_y = 3;
        self.imageView.mjc_centerX = self.mjc_width / 2;
        
        self.titleLabel.mjc_x = 0;
        self.titleLabel.mjc_y = self.imageView.mjc_bottom;
        [self.titleLabel sizeToFit];
        self.titleLabel.mjc_centerX = self.imageView.mjc_centerX;
        
        return;
    }
}

-(void)setTabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    _tabItemTitlesfont = tabItemTitlesfont;
    self.titleLabel.font = tabItemTitlesfont;
}

-(void)setTabItemBackColor:(UIColor *)tabItemBackColor
{
    _tabItemBackColor = tabItemBackColor;
    
    self.backgroundColor = tabItemBackColor;
}

-(void)setTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor
{
    _tabItemTitleNormalColor = tabItemTitleNormalColor;
    [self setTitleColor:tabItemTitleNormalColor forState:UIControlStateNormal];
}
-(void)setTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor
{
    _tabItemTitleSelectedColor = tabItemTitleSelectedColor;
    [self setTitleColor:tabItemTitleSelectedColor forState:UIControlStateSelected];
}

-(void)setTabItemImageNormal:(UIImage *)tabItemImageNormal
{
    _tabItemImageNormal = tabItemImageNormal;
    
    [self setImage:tabItemImageNormal forState:UIControlStateNormal];
}

-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    _tabItemImageSelected = tabItemImageSelected;
    
    [self setImage:tabItemImageSelected forState:UIControlStateSelected];
}

-(void)setTabItemBackImageNormal:(UIImage *)tabItemBackImageNormal
{
    _tabItemBackImageNormal = tabItemBackImageNormal;
    
    [self setBackgroundImage:tabItemBackImageNormal forState:UIControlStateNormal];
}

-(void)setTabItemBackImageSelected:(UIImage *)tabItemBackImageSelected
{
    _tabItemBackImageSelected = tabItemBackImageSelected;
    
    [self setBackgroundImage:tabItemBackImageSelected forState:UIControlStateSelected];
}



-(void)arraycount:(NSUInteger)arraycount buttonW:(CGFloat)buttonW buttonH:(CGFloat)buttonH titlesScrollView:(UIScrollView*)titlesScrollView titlesArr:(NSArray *)titlesArr imageStyle:(MJCImageEffectStyles)imageStyle
{
    _imageEffectStyle = imageStyle;
    
    self.btnX = arraycount * buttonW;
    self.btnW = buttonW;
    self.btnH = buttonH;
    self.tag = arraycount;
    
    self.frame = CGRectMake(self.btnX, 0,self.btnW, self.btnH);
    
    [self setTitle:titlesArr[arraycount] forState:UIControlStateNormal];
    
    [titlesScrollView addSubview:self];
}



-(void)setupTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemNormalImageArray == nil) {
        
    }else{
        [self setImage:[UIImage imageNamed:tabItemNormalImageArray[buttonTag]] forState:UIControlStateNormal];
    }
    
}
-(void)setupTabItemImageSelectedArray:(NSArray *)tabItemSelectedImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemSelectedImageArray == nil) {
        
    }else{
        [self setImage:[UIImage imageNamed:tabItemSelectedImageArray[buttonTag]] forState:UIControlStateSelected];
    }
}

-(void)setupTabItemNormalBackImageArray:(NSArray *)tabItemNormalBackImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemNormalBackImageArray == nil) {
        
    }else{
        
        [self setBackgroundImage:[UIImage imageNamed:tabItemNormalBackImageArray[buttonTag]] forState:UIControlStateNormal];
    }
    
}

-(void)setupTabItemBackImageSelectedArray:(NSArray *)tabItemSelectedBackImageArray buttonTag:(NSUInteger)buttonTag
{
    
    if (tabItemSelectedBackImageArray == nil) {
        
    }else{
        
        [self setBackgroundImage:[UIImage imageNamed:tabItemSelectedBackImageArray[buttonTag]] forState:UIControlStateSelected];
    }
}



-(void)setupTabItemlayer:(CGFloat)layerCornerRadius layerMasksToBounds:(BOOL)layerMasksToBounds
{
    self.layer.masksToBounds = layerMasksToBounds;
    self.layer.cornerRadius = layerCornerRadius;
}


@end
