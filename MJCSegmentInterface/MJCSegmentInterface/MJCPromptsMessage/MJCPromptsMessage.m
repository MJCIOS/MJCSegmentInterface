//
//  MJCUpDataAdvertisView.m
//  MJCUpDateAdvertisView
//
//  Created by mjc on 16/11/15.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCPromptsMessage.h"
#import "MJCPromptsView.h"

@interface MJCPromptsMessage ()



@end

static int imageInter;


@implementation MJCPromptsMessage


+(void)showPromptsTypeStyle:(MJCPromptsTypeStyle)MJCPromptsTypeStyle;
{
    if (MJCPromptsTypeStyle == MJCPromptsTypeblack) {
        [MJCPromptsView showMessageColor:[[UIColor blackColor]colorWithAlphaComponent:0.5]];
        [MJCPromptsView showMessageTextColor:[UIColor whiteColor]];
        [self setupshowMessageImage:@"successwhite" errorImage:@"errorwhite@2x 2"];
    }else{
        [MJCPromptsView showMessageColor:[[UIColor whiteColor]colorWithAlphaComponent:0.5]];
        [MJCPromptsView showMessageTextColor:[UIColor blackColor]];
        [self setupshowMessageImage:@"successblack" errorImage:@"errorblack"];
    }
}
//修改Message样式
+(void)showPromptsMessagesStyle:(MJCPromptsMessagesStyle)MJCPromptsMessagesStyle;
{
    if (MJCPromptsMessagesStyle == MJCPromptsMessagesblack) {
        [MJCPromptsView showMessageColor:[[UIColor blackColor]colorWithAlphaComponent:0.5]];
        [MJCPromptsView showMessageTextColor:[UIColor whiteColor]];
    }else{
        [MJCPromptsView showMessageColor:[[UIColor whiteColor]colorWithAlphaComponent:0.5]];
        [MJCPromptsView showMessageTextColor:[UIColor blackColor]];
    }
}

/**
 * 修改MessageFrame
 */
+(void)showMessageFrame:(CGRect)messageFrame;
{
    [MJCPromptsView showMessageFrame:messageFrame];
}

// !!!:背景颜色
+(void)showMessageColor:(UIColor *)messageColor;
{
    [MJCPromptsView showMessageColor:messageColor];
}
// !!!:文字颜色
+(void)showMessageTextColor:(UIColor *)textColor;
{
    [MJCPromptsView showMessageColor:textColor];
}

#pragma mark !!!:显示普通信息
+ (void)showAutoHiddenMessage:(NSString *)msg image:(UIImage *)image;
{
    [MJCPromptsView showAutoMessage:msg image:image textColor:nil msgHidden:YES];
}
// 显示文字和图片信息(带有图片和文字,自动消失)
+(void)showMessage:(NSString *)msg backColor:(UIColor *)backColor textColor:(UIColor *)textColor image:(UIImage *)image msgHidden:(BOOL)msgHidden;
{    
    [MJCPromptsView showAutoMessage:msg image:image textColor:nil msgHidden:YES];
    
    [self showPromptsMessagesStyle:MJCPromptsMessagesblack];
    
    [MJCPromptsView showMessageTextColor:textColor];
}
// 显示文字和图片信息(可添加文字,图片,是否隐藏,可修改类型)
+(void)showMessage:(NSString *)msg image:(UIImage *)image autoHidden:(BOOL)autoHidden messageStyle:(MJCPromptsMessagesStyle)MJCPromptsMessagesStyle;
{
    [self showMessage:msg image:image msgHidden:autoHidden];
    
    [self showPromptsMessagesStyle:MJCPromptsMessagesStyle];
    
}

// 显示文字和图片信息(带有文字和图片的)(是否自动消失)
+ (void)showMessage:(NSString *)msg image:(UIImage *)image msgHidden:(BOOL)msgHidden;
{
    if (msgHidden == YES) {
        [self showAutoHiddenMessage:msg image:image];
    
    }else{
        [MJCPromptsView showAutoMessage:msg image:image textColor:nil msgHidden:msgHidden];
        [self showPromptsTypeStyle:MJCPromptsTypeblack];
    }
}

// 显示普通信息(,自动消失)
+ (void)showAutoHiddenMessage:(NSString *)msg
{
    [self showAutoHiddenMessage:msg image:nil];
}
// 显示普通信息(是否消失)
+ (void)showMessage:(NSString *)msg msgHidden:(BOOL)msgHidden
{
    if (msgHidden == YES) {
        [self showAutoHiddenMessage:msg image:nil];
        
    }else{
        [MJCPromptsView showAutoMessage:msg image:nil textColor:nil msgHidden:msgHidden];
        [self showPromptsTypeStyle:MJCPromptsTypeblack];
    }
}

#pragma mark !!!:提显示成功信息
// 提显示成功信息(成功背景色,成功文字,成功图片)
+(void)showAutoHiddenSuccess:(NSString *)successmsg backColor:(UIColor *)backColor successImage:(UIImage *)successImage
{
    [self showAutoHiddenSuccess:successmsg];
    
    [MJCPromptsView showMessageColor:backColor];
    
    [MJCPromptsView showMessageImage:successImage];
}


// 提显示成功信息
+(void)showAutoHiddenSuccess:(NSString *)successmsg messageStyle:(MJCPromptsTypeStyle)MJCPromptsTypeStyle
{
    [self showAutoHiddenSuccess:successmsg];
    [self showPromptsTypeStyle:MJCPromptsTypeStyle];
}

// 提显示成功信息(不自动消失,用户自己设置文字)
+ (void)showAutoHiddenSuccess:(NSString *)msg
{
    imageInter = 1;
    
    [self showAutoHiddenMessage:msg image:[UIImage imageNamed:@"successwhite"]];
    [self showPromptsTypeStyle:MJCPromptsTypeblack];
    
}

// 提显示成功信息(不自动消失,设置好文字了)
+(void)showAutoHiddenSuccess
{
    [self showAutoHiddenSuccess:@"加载成功..."];
    [self showPromptsTypeStyle:MJCPromptsTypeblack];
}

#pragma mark !!!:显示失败信息
// 显示失败信息(背景色,失败图片)
+(void)showAutoHiddenError:(NSString *)errormsg backColor:(UIColor *)backColor errorImage:(UIImage *)errorImage;
{
    [self showAutoHiddenError:errormsg];
    
    [MJCPromptsView showMessageColor:backColor];
    
    [MJCPromptsView showMessageImage:errorImage];
}

// 显示失败信息(修改样式)
+(void)showAutoHiddenError:(NSString *)errormsg messageStyle:(MJCPromptsTypeStyle)MJCPromptsTypeStyle
{
    [self showAutoHiddenError:errormsg];
    [self showPromptsTypeStyle:MJCPromptsTypeStyle];
}

// 显示失败信息(不自动消失,用户自己设置文字)
+ (void)showAutoHiddenError:(NSString *)msg
{
    imageInter = 2;
    
    [self showAutoHiddenMessage:msg image:[UIImage imageNamed:@"errorwhite"]];
    [self showPromptsTypeStyle:MJCPromptsTypeblack];
}
// 显示失败信息(不自动消失,设置好文字了)
+ (void)showAutoHiddenError
{
    [self showAutoHiddenError:@"加载失败..."];
    [self showPromptsTypeStyle:MJCPromptsTypeblack];
}


#pragma mark !!!:正在加载信息
// 正在加载信息(自动消失,背景颜色)
+(void)showLoading:(NSString *)loadingmsg backColor:(UIColor *)backColor;
{
    [self showLoading:loadingmsg];
    
    [MJCPromptsView showMessageColor:backColor];
}
// 正在加载信息(自动消失,样式)
+(void)showLoading:(NSString *)loadingmsg messageStyle:(MJCPromptsTypeStyle)MJCPromptsTypeStyle;
{
    [self showLoading:loadingmsg];
    
    [self showPromptsTypeStyle:MJCPromptsTypeStyle];
}

// 正在加载信息(不自动消失,用户自己设置文字)
+ (void)showLoading:(NSString *)msg
{
    [MJCPromptsView showloading:msg textColor:nil];
    [self showPromptsTypeStyle:MJCPromptsTypeblack];
}

// 正在加载信息(不自动消失,设置好文字了)
+ (void)showLoading
{
    [self showLoading:@"正在加载中..."];
}

// !!!:隐藏指示栏
+ (void)hideDismiss
{
    [MJCPromptsView hideDismiss];
}

//设置失败和成功的图片
+(void)setupshowMessageImage:(NSString *)imageSucces errorImage:(NSString *)errorImage
{
    if (imageInter == 1) {
        [MJCPromptsView showMessageImage:[UIImage imageNamed:imageSucces]];
    }else if (imageInter == 2){
        [MJCPromptsView showMessageImage:[UIImage imageNamed:errorImage]];
    }else{
    }
}

/** 自定义Message的文字,图片,文字颜色,是否隐藏 */
+ (void)showCustomMessage:(NSString *)msg image:(UIImage *)image textColor:(UIColor *)textColor msgHidden:(BOOL)msgHidden;
{
    [MJCPromptsView showMessage:msg image:image textColor:textColor msgHidden:msgHidden];
}

/** 自定义Message的文字,图片,文字颜色,是否隐藏,图片位置和文字位置 */
+ (void)showCustomMessage:(NSString *)msg image:(UIImage *)image textColor:(UIColor *)textColor msgHidden:(BOOL)msgHidden imageFrame:(CGRect)imageFrame lableFrame:(CGRect)lableFrame;
{
    [MJCPromptsView showMessage:msg image:image textColor:textColor msgHidden:msgHidden imageFrame:imageFrame lableFrame:lableFrame];
}

/**
 * 修改自定义Message的Frame
 */
+(void)showMessageCustomFrame:(CGRect)customFrame
{
    [MJCPromptsView showCustomFrame:customFrame];
}

/** 添加子控件 */
+(void)mjc_addSubview:(UIView *)addControls
{
    [MJCPromptsView windowAddSubview:addControls];
}


@end
