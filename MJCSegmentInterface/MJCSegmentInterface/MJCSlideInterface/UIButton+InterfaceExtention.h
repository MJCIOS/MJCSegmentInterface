//
//  UIButton+MJCExtension.h
//  ZhongChuZhiHui
//
//  Created by mjc on 17/5/12.
//  Copyright © 2017年 ZhongChuZhiHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (interfaceExtention)


+(instancetype)mjc_buttonWithType:(UIButtonType)buttonType target:(id)target action:(SEL)action;

+(instancetype)mjc_buttonWithType:(UIButtonType)buttonType textColor:(UIColor*)textColor textFontSize:(CGFloat)textFontSize target:(id)target action:(SEL)action titleText:(NSString *)titleText;

/** 文字大小 */
@property (nonatomic,assign)  CGFloat textFontSizes;
/** 普通状态文字颜色 */
@property (nonatomic,strong) UIColor *textColors;
/** 普通状态按钮标题文字 */
@property (nonatomic,copy) NSString *titleTexts;
/** 普通状态按钮图片 */
@property (nonatomic,strong) UIImage *imagesNormal;
/** 普通状态按钮背景图片 */
@property (nonatomic,strong) UIImage *backImageNormal;


@end
