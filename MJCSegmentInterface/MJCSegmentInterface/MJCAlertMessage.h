//
//  MJCAlertMessage.h
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/26.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIAlertView的点击block块
typedef void (^MJCClickedButtonBlock)(UIAlertView *alertView,NSInteger buttonIndex);

@interface MJCAlertMessage : NSObject

/**
 提示框

 @param msgTitle <#msgTitle description#>
 @param message <#message description#>
 @param cancelButtonTitle <#cancelButtonTitle description#>
 */
+(UIAlertView *)showMessageViewTitle:(NSString *)msgTitle
                    message:(NSString *)message
          cancelButtonTitle:( NSString *)cancelButtonTitle;


/**
 提示框,可添加其他按钮

 @param msgTitle <#msgTitle description#>
 @param message <#message description#>
 @param cancelButtonTitle <#cancelButtonTitle description#>
 @param otherButtonTitles <#otherButtonTitles description#>
 */
+(UIAlertView*)showMessageViewTitle:(NSString *)msgTitle
                    message:(NSString *)message
          cancelButtonTitle:( NSString *)cancelButtonTitle
          otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles;

/**
 提示框,带有点击回调

 @param msgTitle 标题
 @param message 内容
 @param cancelButtonTitle 取消按钮
 @param otherButtonTitles 其他按钮
 @param clickedButtonBlock 点击回调块
 */
+(UIAlertView*)showMessageViewTitle:(NSString *)msgTitle
                    message:(NSString *)message
          cancelButtonTitle:( NSString *)cancelButtonTitle
          otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles
         clickedButtonBlock:(MJCClickedButtonBlock)clickedButtonBlock;


@end
