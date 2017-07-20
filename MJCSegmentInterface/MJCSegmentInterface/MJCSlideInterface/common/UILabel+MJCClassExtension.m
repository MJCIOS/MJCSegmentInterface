//
//  UILabel+UILabel_MJCExtention_h_InterfaceExtention.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/17.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "UILabel+MJCClassExtension.h"

@implementation UILabel (MJCClassExtension)

+(instancetype)jc_lableWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;
{
    UILabel *lable = [[UILabel alloc]init];
    lable.text = text;
    lable.font = [UIFont systemFontOfSize:fontSize];
    lable.textColor = textColor;
    return lable;
}

@end
