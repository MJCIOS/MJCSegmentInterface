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
/** <#  注释  #> */
@property (nonatomic,assign) CGFloat btnX;

/** <#  注释  #> */
@property (nonatomic,assign) MJCImageEffectStyle imageEffectStyle;

@end


@implementation MJCTabItemButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
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
        self.titleLabel.mjc_width = self.mjc_width;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
        return;
    }
}

-(void)arraycount:(NSUInteger)arraycount buttonW:(CGFloat)buttonW buttonH:(CGFloat)buttonH scrollTitlesEnabled:(BOOL)scrollTitlesEnabled titlesScrollView:(UIScrollView*)titlesScrollView titlesView:(UIView*)titlesView titlesArr:(NSArray *)titlesArr imageStyle:(MJCImageEffectStyle)imageStyle;
{
    _imageEffectStyle = imageStyle;
    
    self.btnX = arraycount * buttonW;
    self.btnW = buttonW;
    self.btnH = buttonH;
    self.tag = arraycount;
    
    [self setTitle:titlesArr[arraycount] forState:UIControlStateNormal];
    
    if (scrollTitlesEnabled == kNilOptions) {
        [titlesView addSubview:self];
    }else{
        [titlesScrollView addSubview:self];
    }
}

-(void)isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame
{
    if (isTabItemFrame == kNilOptions) {
        self.frame = CGRectMake(self.btnX, 0, self.btnW, self.btnH);
    }else{
        self.frame = tabItemFrame;
    }
}

-(void)setTabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    if (tabItemTitlesfont == kNilOptions) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }else{
        self.titleLabel.font = tabItemTitlesfont;
    }
    
}

-(void)setTabItemBackColor:(UIColor *)tabItemBackColor SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;
{
    if (tabItemBackColor == kNilOptions) {
        
        if (SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse) {
            self.backgroundColor = [UIColor clearColor];
        }else if (SegmentInterFaceStyle == SegMentInterfaceStylePenetrate){
            self.backgroundColor = [UIColor clearColor];
        }else{
            self.backgroundColor = [UIColor whiteColor];
        }
    }else{
        self.backgroundColor = tabItemBackColor;
    }
}

-(void)setTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor
{
    if (tabItemTitleNormalColor == kNilOptions) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }else{
        [self setTitleColor:tabItemTitleNormalColor forState:UIControlStateNormal];
    }
}

-(void)setTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor
{
    if (tabItemTitleSelectedColor == kNilOptions) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }else{
        [self setTitleColor:tabItemTitleSelectedColor forState:UIControlStateSelected];
    }
    
}

-(void)setTabItemImageNormal:(UIImage *)tabItemImageNormal
{
    if (tabItemImageNormal == kNilOptions) {
        [self setImage:nil forState:UIControlStateNormal];
    }else{
        [self setImage:tabItemImageNormal forState:UIControlStateNormal];
    }
}

-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    if (tabItemImageSelected == kNilOptions) {
        [self setImage:nil forState:UIControlStateSelected];
    }else{
        [self setImage:tabItemImageSelected forState:UIControlStateSelected];
    }
}
-(void)setTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemNormalImageArray == kNilOptions) {
        [self setImage:nil forState:UIControlStateNormal];
    }else{
        [self setImage:[UIImage imageNamed:tabItemNormalImageArray[buttonTag]] forState:UIControlStateNormal];
    }
}
-(void)setTabItemImageSelectedArray:(NSArray *)tabItemSelectedImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemSelectedImageArray == kNilOptions) {
        [self setImage:nil forState:UIControlStateSelected];
    }else{
        [self setImage:[UIImage imageNamed:tabItemSelectedImageArray[buttonTag]] forState:UIControlStateSelected];
    }
    
}


-(void)setTabItemBackImageNormal:(UIImage *)tabItemBackImageNormal
{
    if (tabItemBackImageNormal == kNilOptions) {
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:tabItemBackImageNormal forState:UIControlStateNormal];
    }
}

-(void)setTabItemBackImageSelected:(UIImage *)tabItemBackImageSelected
{
    if (tabItemBackImageSelected == kNilOptions) {
        [self setBackgroundImage:nil forState:UIControlStateSelected];
    }else{
        [self setBackgroundImage:tabItemBackImageSelected forState:UIControlStateSelected];
    }
}
-(void)setTabItemNormalBackImageArray:(NSArray *)tabItemNormalBackImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemNormalBackImageArray == kNilOptions) {
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:tabItemNormalBackImageArray[buttonTag]] forState:UIControlStateNormal];
    }
}
-(void)setTabItemBackImageSelectedArray:(NSArray *)tabItemSelectedBackImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemSelectedBackImageArray == kNilOptions) {
        [self setBackgroundImage:nil forState:UIControlStateSelected];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:tabItemSelectedBackImageArray[buttonTag]] forState:UIControlStateSelected];
    }
    
}






@end
