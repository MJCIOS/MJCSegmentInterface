//
//  UIButton+MJCExtension.m
//  ZhongChuZhiHui
//
//  Created by mjc on 17/5/12.
//  Copyright © 2017年 ZhongChuZhiHui. All rights reserved.
//

#import "UIButton+MJCClassExtension.h"
#import "objc/runtime.h"

@implementation UIButton (MJCClassExtension)
/**
 @dynamic 就是要来告诉编译器，代码中用@dynamic修饰的属性，其getter和setter方法会在程序运行的时候或者用其他方式动态绑定，以便让编译器通过编译。其主要的作用就是用在NSManageObject对象的属性声明上，由于此类对象的属性一般是从Core Data的属性中生成的，Core Data框架会在程序运行的时候为此类属性生成getter和Setter方法。
 */
@dynamic jc_textColors;
@dynamic jc_titleTexts;
@dynamic jc_imagesNormal;
@dynamic jc_backImageNormal;
@dynamic jc_textFontSizes;

+(instancetype)jc_buttonWithType:(UIButtonType)buttonType target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(instancetype)jc_buttonWithType:(UIButtonType)buttonType textColor:(UIColor*)textColor textFontSize:(CGFloat)textFontSize target:(id)target action:(SEL)action titleText:(NSString *)titleText
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.jc_textColors = textColor;
    button.jc_titleTexts = titleText;
    button.jc_textFontSizes = textFontSize;
    return button;
}


-(void)setJc_textColors:(UIColor *)jc_textColors
{
    [self setTitleColor:jc_textColors forState:UIControlStateNormal];
}

-(void)setJc_textFontSizes:(CGFloat)jc_textFontSizes
{
    self.titleLabel.font = [UIFont systemFontOfSize:jc_textFontSizes];
}

-(void)setJc_titleTexts:(NSString *)jc_titleTexts
{
    [self setTitle:jc_titleTexts forState:UIControlStateNormal];
}

-(void)setJc_imagesNormal:(UIImage *)jc_imagesNormal
{
    [self setImage:jc_imagesNormal forState:UIControlStateNormal];
}

-(void)setJc_backImageNormal:(UIImage *)jc_backImageNormal
{
    [self setBackgroundImage:jc_backImageNormal forState:UIControlStateNormal];
}

@end

