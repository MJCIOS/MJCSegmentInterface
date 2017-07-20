//
//  UILabel+UILabel_MJCExtention_h_InterfaceExtention.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/17.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MJCClassExtension)

/**
 快速创建lable对象
 
 @param text <#text description#>
 @param fontSize <#fontSize description#>
 @param textColor <#textColor description#>
 @return <#return value description#>
 */
+(instancetype)jc_lableWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor;

@end
