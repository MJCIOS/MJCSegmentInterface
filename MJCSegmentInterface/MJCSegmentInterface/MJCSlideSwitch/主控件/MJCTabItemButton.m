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

@end


@implementation MJCTabItemButton

//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
    }
    
    return self;
}


-(void)arraycount:(NSUInteger)arraycount buttonW:(CGFloat)buttonW buttonH:(CGFloat)buttonH scrollTitlesEnabled:(BOOL)scrollTitlesEnabled titlesScrollView:(UIScrollView*)titlesScrollView titlesView:(UIView*)titlesView isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame tabItemTitlesfont:(UIFont*)tabItemTitlesfont SegmentInterFaceStyle:(MJCSegmentInterfaceStyle)SegmentInterFaceStyle tabItemBackColor:(UIColor*)tabItemBackColor tabItemTitleNormalColor:(UIColor*)tabItemTitleNormalColor tabItemTitleSelectedColor:(UIColor*)tabItemTitleSelectedColor tabItemImageNormal:(UIImage*)tabItemImageNormal tabItemImageSelected:(UIImage *)tabItemImageSelected tabItemNormalImageArray:(NSArray *)tabItemNormalImageArray tabItemImageSelectedArray:(NSArray *)tabItemSelectedImageArray

{
    self.btnX = arraycount * buttonW;
    self.btnW = buttonW;
    self.btnH = buttonH;
    self.tag = arraycount;
    
    [self isTabItemFrame:isTabItemFrame tabItemFrame:tabItemFrame];
    [self setTabItemTitlesfont:tabItemTitlesfont];
    [self setTabItemBackColor:tabItemBackColor SegmentInterFaceStyle:SegmentInterFaceStyle];
    [self setTabItemTitleNormalColor:tabItemTitleNormalColor];
    [self setTabItemTitleSelectedColor:tabItemTitleSelectedColor];
    [self setTabItemImageNormal:tabItemImageNormal];
    [self setTabItemImageSelected:tabItemImageSelected];
    [self setTabItemNormalImageArray:tabItemNormalImageArray buttonTag:arraycount];
    [self setTabItemImageSelectedArray:tabItemSelectedImageArray buttonTag:arraycount];
    
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
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:tabItemImageNormal forState:UIControlStateNormal];
    }
}

-(void)setTabItemImageSelected:(UIImage *)tabItemImageSelected
{
    if (tabItemImageSelected == kNilOptions) {
        [self setBackgroundImage:nil forState:UIControlStateSelected];
    }else{
        [self setBackgroundImage:tabItemImageSelected forState:UIControlStateSelected];
    }
}
-(void)setTabItemNormalImageArray:(NSArray *)tabItemNormalImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemNormalImageArray == kNilOptions) {
        //        [titleButton setBackgroundImage:tabItemImageNormal forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:tabItemNormalImageArray[buttonTag]] forState:UIControlStateNormal];
    }
}
-(void)setTabItemImageSelectedArray:(NSArray *)tabItemSelectedImageArray buttonTag:(NSUInteger)buttonTag
{
    if (tabItemSelectedImageArray == kNilOptions) {
        //        [titleButton setBackgroundImage:tabItemImageNormal forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:tabItemSelectedImageArray[buttonTag]] forState:UIControlStateSelected];
    }
    
}





@end
