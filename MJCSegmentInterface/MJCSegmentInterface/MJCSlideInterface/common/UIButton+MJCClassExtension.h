//
//  UIButton+MJCExtension.h
//  ZhongChuZhiHui
//
//  Created by mjc on 17/5/12.
//  Copyright © 2017年 ZhongChuZhiHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MJCClassExtension)

+(instancetype)jc_buttonWithType:(UIButtonType)buttonType target:(id)target action:(SEL)action;

+(instancetype)jc_buttonWithType:(UIButtonType)buttonType textColor:(UIColor*)textColor textFontSize:(CGFloat)textFontSize target:(id)target action:(SEL)action titleText:(NSString *)titleText;

/** 文字大小 */
@property (nonatomic,assign)  CGFloat jc_textFontSizes;
/** 普通状态文字颜色 */
@property (nonatomic,strong) UIColor *jc_textColors;
/** 普通状态按钮标题文字 */
@property (nonatomic,copy) NSString *jc_titleTexts;
/** 普通状态按钮图片 */
@property (nonatomic,strong) UIImage *jc_imagesNormal;
/** 普通状态按钮背景图片 */
@property (nonatomic,strong) UIImage *jc_backImageNormal;


@end
