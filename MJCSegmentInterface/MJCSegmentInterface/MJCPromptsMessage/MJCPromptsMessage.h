//
//  MJCUpDataAdvertisView.h
//  MJCUpDateAdvertisView
//
//  Created by mjc on 16/11/15.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+MJCExtenSion.h"

typedef enum {
    MJCPromptsTypeblack,
    MJCPromptsTypeWhite
}MJCPromptsTypeStyle;

typedef enum {
    MJCPromptsMessagesblack,
    MJCPromptsMessagesWhite
}MJCPromptsMessagesStyle;

@interface MJCPromptsMessage : NSObject


/**
 * MJCPromptsMessageStyle类型 (成功与失败的样式)
 */
+(void)showPromptsTypeStyle:(MJCPromptsTypeStyle)MJCPromptsTypeStyle;

/**
 * MJCPromptsMessagesStyle类型 (普通信息样式)
 */
+(void)showPromptsMessagesStyle:(MJCPromptsMessagesStyle)MJCPromptsMessagesStyle;


#pragma mark -- 提示图片或文字信息
/**
 * 提示信息(可修改,类型,图片,文字,是否隐藏)
 */
+(void)showMessage:(NSString *)msg
             image:(UIImage *)image
        autoHidden:(BOOL)autoHidden
      messageStyle:(MJCPromptsMessagesStyle)MJCPromptsMessagesStyle;
/**
 * 提示信息(可修改背景色,文字颜色,图片,文字,是否隐藏)
 */
+(void)showMessage:(NSString *)msg
         backColor:(UIColor *)backColor
         textColor:(UIColor *)textColor
             image:(UIImage *)image
         msgHidden:(BOOL)msgHidden;
/**提示图片或文字信息(自动消失) */
+ (void)showAutoHiddenMessage:(NSString *)msg image:(UIImage *)image;
/**提示图片或文字信息(是否隐藏) */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image msgHidden:(BOOL)msgHidden;
/** 提示文字信息(自动隐藏) */
+ (void)showAutoHiddenMessage:(NSString *)msg;
/** 提示文字信息(是否隐藏) */
+ (void)showMessage:(NSString *)msg msgHidden:(BOOL)msgHidden;


#pragma mark -- 成功信息
/** 成功信息(自己传参数) */
+(void)showAutoHiddenSuccess:(NSString *)successmsg backColor:(UIColor *)backColor successImage:(UIImage *)successImage;
/** 成功信息(自己传参数) */
+ (void)showAutoHiddenSuccess:(NSString *)successmsg messageStyle:(MJCPromptsTypeStyle)MJCPromptsTypeStyle;
/** 成功信息(自己传参数) */
+ (void)showAutoHiddenSuccess:(NSString *)msg;
/** 提示加载成功(加载成功) */
+ (void)showAutoHiddenSuccess;


#pragma mark -- 失败信息
/** 提示失败信息(自己传参数) */
+(void)showAutoHiddenError:(NSString *)errormsg backColor:(UIColor *)backColor errorImage:(UIImage *)errorImage;
/** 提示失败信息(自己传参数) */
+(void)showAutoHiddenError:(NSString *)errormsg messageStyle:(MJCPromptsTypeStyle)MJCPromptsTypeStyle;
/** 提示失败信息(自己传参数) */
+ (void)showAutoHiddenError:(NSString *)msg;
/** 提示失败信息(加载失败) */
+ (void)showAutoHiddenError;


#pragma mark -- 提示正在加载中
/** 提示正在加载中 (自行传参数)*/
+(void)showLoading:(NSString *)loadingmsg backColor:(UIColor *)backColor;
/** 提示正在加载中 (自行传参数)*/
+(void)showLoading:(NSString *)loadingmsg messageStyle:(MJCPromptsTypeStyle)MJCPromptsTypeStyle;
/** 提示正在加载中(自传参数) */
+ (void)showLoading:(NSString *)msg;
/** 提示正在加载中(正在加载中) */
+ (void)showLoading;



/**
 * 隐藏消失提示框
 */
+ (void)hideDismiss;

/**
 * 修改messageFrame
 */
+(void)showMessageFrame:(CGRect)messageFrame;


/**
 * 设置提示框的颜色
 */
+(void)showMessageColor:(UIColor *)messageColor;

/**
 * 设置提示框文字的颜色
 */
+(void)showMessageTextColor:(UIColor *)textColor;


/** 自定义Message的文字,图片,文字颜色,是否隐藏 */
+ (void)showCustomMessage:(NSString *)msg image:(UIImage *)image textColor:(UIColor *)textColor msgHidden:(BOOL)msgHidden;

/** 自定义Message的文字,图片,文字颜色,是否隐藏,图片位置和文字位置 */
+ (void)showCustomMessage:(NSString *)msg image:(UIImage *)image textColor:(UIColor *)textColor msgHidden:(BOOL)msgHidden imageFrame:(CGRect)imageFrame lableFrame:(CGRect)lableFrame;


/**
 * 修改自定义Message的Frame
 */
+ (void)showMessageCustomFrame:(CGRect)customFrame;

/** 自定义添加子控件 */
+(void)mjc_addSubview:(UIView *)addControls;

@end
