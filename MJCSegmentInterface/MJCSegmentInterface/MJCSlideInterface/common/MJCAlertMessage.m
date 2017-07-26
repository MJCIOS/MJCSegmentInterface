//
//  MJCAlertMessage.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/26.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCAlertMessage.h"

@interface MJCAlertMessage ()

@property (nonatomic,copy) MJCClickedButtonBlock clickedButtonBlock;

@end

@implementation MJCAlertMessage
static MJCAlertMessage *showMessage = nil;
+ (MJCAlertMessage *)showMessage
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (showMessage == nil) {
            showMessage = [[self alloc] init];
        }
    });
    return showMessage;
}

+(UIAlertView*)showMessageViewTitle:(NSString *)msgTitle message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles clickedButtonBlock:(MJCClickedButtonBlock)clickedButtonBlock
{
    MJCAlertMessage *alertMessage =   [MJCAlertMessage showMessage];
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:msgTitle message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (clickedButtonBlock) {
        alertView.delegate = self;
        alertMessage.clickedButtonBlock = clickedButtonBlock;
    }
    [otherButtonTitles enumerateObjectsUsingBlock:^(NSString *button, NSUInteger idx, BOOL *stop) {
        [alertView addButtonWithTitle:button];
    }];
    [alertView show];
    
    return alertView;
}

+(UIAlertView*)showMessageViewTitle:(NSString *)msgTitle
                    message:(NSString *)message
          cancelButtonTitle:( NSString *)cancelButtonTitle
          otherButtonTitles:(NSArray<NSString *> *)otherButtonTitles;
{
   return [self showMessageViewTitle:msgTitle message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles clickedButtonBlock:nil];
}

+(UIAlertView*)showMessageViewTitle:(NSString *)msgTitle
                    message:(NSString *)message
          cancelButtonTitle:( NSString *)cancelButtonTitle;
{
    return [self showMessageViewTitle:msgTitle message:message cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
}


#pragma mark --UIAlertViewDelegate
+(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    MJCAlertMessage *alertMessage = [MJCAlertMessage showMessage];
    if (alertMessage.clickedButtonBlock) {
        alertMessage.clickedButtonBlock(alertView,buttonIndex);
    }
}


@end
