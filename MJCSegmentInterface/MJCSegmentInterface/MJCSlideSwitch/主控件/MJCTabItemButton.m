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
//        self.titleLabel.mjc_width = self.mjc_width;
        self.titleLabel.mjc_centerX = self.imageView.mjc_centerX;
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

-(void)setupisTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame
{
    if (isTabItemFrame == kNilOptions) {
        self.frame = CGRectMake(self.btnX, 0, self.btnW, self.btnH);
    }else{
        self.frame = tabItemFrame;
    }
}

-(void)setupTabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    if (tabItemTitlesfont == kNilOptions) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }else{
        self.titleLabel.font = tabItemTitlesfont;
    }
    
}

-(void)setupTabItemBackColor:(UIColor *)tabItemBackColor SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle;
{
    if (tabItemBackColor == kNilOptions) {
        
        if (SegmentInterFaceStyle == SegMentInterfaceStyleMoreUse) {
            self.backgroundColor = [UIColor clearColor];
        }else if (SegmentInterFaceStyle == SegMentInterfaceStylePenetrate){
            self.backgroundColor = [UIColor clearColor];
        }else{
            self.backgroundColor = [UIColor clearColor];
        }
    }else{
        self.backgroundColor = tabItemBackColor;
    }
}

-(void)setupTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor
{
    if (tabItemTitleNormalColor == kNilOptions) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }else{
        [self setTitleColor:tabItemTitleNormalColor forState:UIControlStateNormal];
    }
}

-(void)setupTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor
{
    if (tabItemTitleSelectedColor == kNilOptions) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }else{
        [self setTitleColor:tabItemTitleSelectedColor forState:UIControlStateSelected];
    }
    
}

-(void)setupTabItemImageNormal:(UIImage *)tabItemImageNormal
{
    if (tabItemImageNormal == kNilOptions) {
        [self setImage:nil forState:UIControlStateNormal];
    }else{
        [self setImage:tabItemImageNormal forState:UIControlStateNormal];
    }
}

-(void)setupTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    [self setImage:tabItemImageSelected forState:UIControlStateSelected];
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

-(void)setupTabItemBackImageNormal:(UIImage *)tabItemBackImageNormal
{
    [self setBackgroundImage:tabItemBackImageNormal forState:UIControlStateNormal];
}

-(void)setupTabItemBackImageSelected:(UIImage *)tabItemBackImageSelected
{
    [self setBackgroundImage:tabItemBackImageSelected forState:UIControlStateSelected];
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






@end
