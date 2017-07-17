//
//  UIButton+MJCExtension.m
//  ZhongChuZhiHui
//
//  Created by mjc on 17/5/12.
//  Copyright © 2017年 ZhongChuZhiHui. All rights reserved.
//

#import "UIButton+interfaceExtention.h"
#import "objc/runtime.h"

@implementation UIButton (interfaceExtention)
/**
 @dynamic 就是要来告诉编译器，代码中用@dynamic修饰的属性，其getter和setter方法会在程序运行的时候或者用其他方式动态绑定，以便让编译器通过编译。其主要的作用就是用在NSManageObject对象的属性声明上，由于此类对象的属性一般是从Core Data的属性中生成的，Core Data框架会在程序运行的时候为此类属性生成getter和Setter方法。
 */
@dynamic textColors;
@dynamic titleTexts;
@dynamic imagesNormal;
@dynamic backImageNormal;
@dynamic textFontSizes;

+(instancetype)mjc_buttonWithType:(UIButtonType)buttonType target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+(instancetype)mjc_buttonWithType:(UIButtonType)buttonType textColor:(UIColor*)textColor textFontSize:(CGFloat)textFontSize target:(id)target action:(SEL)action titleText:(NSString *)titleText
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.textColors = textColor;
    button.titleTexts = titleText;
    button.textFontSizes = textFontSize;
    return button;
}
-(void)setTextColors:(UIColor *)textColors
{
    [self setTitleColor:textColors forState:UIControlStateNormal];
}

-(void)setTextFontSizes:(CGFloat)textFontSizes
{
    self.titleLabel.font = [UIFont systemFontOfSize:textFontSizes];
}

-(void)setTitleTexts:(NSString *)titleTexts
{
    [self setTitle:titleTexts forState:UIControlStateNormal];
}

-(void)setImagesNormal:(UIImage *)imagesNormal
{
    [self setImage:imagesNormal forState:UIControlStateNormal];
}

-(void)setBackImageNormal:(UIImage *)backImageNormal
{
    [self setBackgroundImage:backImageNormal forState:UIControlStateNormal];
}

@end

