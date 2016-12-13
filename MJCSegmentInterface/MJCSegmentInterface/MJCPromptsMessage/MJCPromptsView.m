//
//  MJCPromptsView.m
//  ZhongChuZhiHui
//
//  Created by mjc on 16/11/16.
//  Copyright © 2016年 ZhongChuZhiHui. All rights reserved.
//

#import "MJCPromptsView.h"
#import "UIView+MJCExtenSion.h"

//RBG颜色
#define MJCRGBColor(r,g,b,alphas) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:alphas]


//文字大小
#define MJCMessageFont [UIFont systemFontOfSize:12]

//整个屏幕宽度
#define MJCScreenWidth [UIScreen mainScreen].bounds.size.width

/** 消息的持续时间 */
static CGFloat const MJCMessageDuration = 2.0;


/** 消息显示\隐藏的动画时间 */
static CGFloat const MJCAnimationDuration = 0.5;


/** 间距 */
static CGFloat const MJCMargin = 20;

static CGFloat const MJCMarginTen = 10;


static int number;

///** 全局的窗口 */
static UIWindow *window;

//
static CGRect frames;

///** 定时器 */
static NSTimer *timer;

static UIButton *button;

static UILabel *label;

static UIActivityIndicatorView *loadingView;

static UIImageView *imageView;

@interface MJCPromptsView ()

@end

@implementation MJCPromptsView

//设置自定义Message的位置
+(void)showCustomFrame:(CGRect)customFrame
{
    [UIView animateWithDuration:MJCAnimationDuration animations:^{
        window.hidden = NO;//不隐藏
        window.frame = customFrame;//并且重新赋值frame
    }];
}

+(void)windowAddSubview:(UIView *)addControls
{
    //起始位置
    [self showWindow:-64];
    
    [window addSubview:addControls];
}


//开始位置
+(void)starFrame:(CGFloat)starFrame;
{
    //窗口的frame
    CGFloat windowH = 50;
    frames = CGRectMake(0,starFrame,MJCScreenWidth,windowH);
    
}
//设置位置
+(void)showMessageFrame:(CGRect)messageFrame
{
    [UIView animateWithDuration:MJCAnimationDuration animations:^{
        window.hidden = NO;//不隐藏
        window.frame = messageFrame;//并且重新赋值frame
    }];
    
    button.frame = window.bounds;
    imageView.mjc_width = window.mjc_height * 0.5;
    imageView.mjc_height = imageView.mjc_width;
    imageView.mjc_x = MJCMarginTen;
    CGFloat centerY = window.mjc_height * 0.5;//Y值中心点,等于窗口的高度的一半那个位置
    imageView.mjc_centerY = centerY;
    
    label.mjc_x =(imageView.mjc_width + MJCMarginTen)+MJCMarginTen;
    label.mjc_y = 0;
    label.mjc_width = window.mjc_width - (imageView.mjc_width + 10+10+10);
    label.mjc_height = window.mjc_height;
}

/**
 * 创建显示窗口
 */
+ (void)showWindow:(CGFloat)starFrame;
{
    //起始位置
    [self starFrame:starFrame];
    
    //创建窗口
    window = [[UIWindow alloc] init];
    window.hidden = YES;//初始隐藏
    window.windowLevel = UIWindowLevelAlert;//窗口显示位置
    window.frame = frames;//窗口的frame,当我们创建的时候,将y值等于负的,也就是在超过了窗口的大小位置
    
    [self showMessageColor:[[UIColor blackColor]colorWithAlphaComponent:0.5]];
        
    // 动画效果
    frames.origin.y = 64;//在这将frame的y值,再调为,我们所想要的位置
    
    if (number == 1) {
        [self showMessageFrame:frames];
    }else{
        [self showCustomFrame:frames];
    }
    
//    [UIView animateWithDuration:MJCAnimationDuration animations:^{
//        window.hidden = NO;//不隐藏
//        window.frame = frame;//并且重新赋值frame
//        [self showMessageFrame:frame];
//    }];
}

// !!!:颜色
+(void)showMessageColor:(UIColor *)messageColor;
{
    window.backgroundColor = messageColor;
}
// 设置图片
+(void)showMessageImage:(UIImage *)image
{
    [button setImage:image forState:UIControlStateNormal];
}
//设置颜色
+(void)showMessageTextColor:(UIColor *)TextColor
{
    [button setTitleColor:TextColor forState:UIControlStateNormal];
    
    label.textColor = TextColor;
}

// !!!:显示普通信息
+ (void)showAutoMessage:(NSString *)msg image:(UIImage *)image textColor:(UIColor *)textColor msgHidden:(BOOL)msgHidden;
{
    number = 1;
    
    //停止定时器
    [timer invalidate];
    
    // 显示窗口
    [self showWindow:-64];
    
    // 添加按钮
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    //按钮的点击方法
    [button addTarget:self action:@selector(hideDismiss) forControlEvents:UIControlEventTouchUpInside];
    
    button.titleLabel.numberOfLines = 0;
    
    //设置按钮的文字
    [button setTitle:msg forState:UIControlStateNormal];
    
    [self showMessageTextColor:textColor];
    //按钮文字大小
    button.titleLabel.font = MJCMessageFont;
    //按钮图片
    if (image) { // 如果有图片
        //赋值图片
        [self showMessageImage:image];
        
        //修改文字内边距位置
        button.titleEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
        
    }
    //按钮的位置
    button.frame = window.bounds;
    
    [window addSubview:button];
    
    
    if (msgHidden == YES) {
        // 定时器方法
        timer = [NSTimer scheduledTimerWithTimeInterval:MJCMessageDuration target:self selector:@selector(hideDismiss) userInfo:nil repeats:NO];
    }else{
        [timer invalidate];
    }
    

}

//显示加载信息
+(void)showloading:(NSString *)loading textColor:(UIColor *)textColor
{
    number = 1;
    
    // 停止定时器
    [timer invalidate];
    timer = nil;
    
    // 显示窗口
    [self showWindow:-64];
    
    // 创建lable
    label = [[UILabel alloc] init];
    label.font = MJCMessageFont;
    label.frame = window.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    
    label.text = loading;
    
    [self showMessageTextColor:textColor];
    
    [window addSubview:label];
    //计算文字宽度
    CGFloat msgW = [label.text sizeWithAttributes:@{NSFontAttributeName : MJCMessageFont}].width;
    
    // 添加旋转器
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];//开始旋转
    //(窗口的宽度-文字的宽度)的一半 - 离文字的间距
    CGFloat centerX = (window.mjc_width- msgW) * 0.5 - MJCMargin;
    //Y值中心点,等于窗口的高度的一半那个位置
    CGFloat centerY = window.mjc_height * 0.5;
    //设置旋转器的中心点
    loadingView.center = CGPointMake(centerX, centerY);
    [window addSubview:loadingView];
}


// !!!:隐藏指示栏
+ (void)hideDismiss
{
    //动画的隐藏效果
    [UIView animateWithDuration:MJCAnimationDuration animations:^{
        //直接将窗口的y =  它的负数高度... (反正改变它的y值就可以了)
        window.mjc_y = -window.mjc_height;
    } completion:^(BOOL finished) { //动画完成之后
        [timer invalidate];//如果你不停止定时器,会与按钮方法冲突..
        window = nil;//直接将窗口为空
        timer = nil;//定时器为空
    }];
}


// !!!:显示普通信息
+ (void)showMessage:(NSString *)msg image:(UIImage *)image textColor:(UIColor *)textColor msgHidden:(BOOL)msgHidden
{
    number = 1;
    
    //停止定时器
    [timer invalidate];
    // 显示窗口
    //    [self showWindow];
    [self showWindow:-64];
    
    // 添加图片
    imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.mjc_width = window.mjc_height * 0.5;
    imageView.mjc_height = imageView.mjc_width;
    imageView.mjc_x = MJCMarginTen;
    //Y值中心点,等于窗口的高度的一半那个位置
    imageView.mjc_centerY = window.mjc_height * 0.5;;
    [window addSubview:imageView];
    
    // 创建lable
    label = [[UILabel alloc] init];
    [self showMessageTextColor:textColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentLeft;//文字向左对齐
    label.text = msg;
    label.numberOfLines = 0;//行数
    label.mjc_x =(imageView.mjc_width + MJCMarginTen)+MJCMarginTen;
    label.mjc_y = 0;
    label.mjc_width = window.mjc_width - (imageView.mjc_width + 10+10+10);
    label.mjc_height = window.mjc_height;
    
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDismiss)];
    [label addGestureRecognizer:tapGesture];
    
    [window addSubview:label];
    
    if (msgHidden == YES) {
        // 定时器方法
        timer = [NSTimer scheduledTimerWithTimeInterval:MJCMessageDuration target:self selector:@selector(hideDismiss) userInfo:nil repeats:NO];
    }else{
        [timer invalidate];
    }

}

+ (void)showMessage:(NSString *)msg image:(UIImage *)image textColor:(UIColor *)textColor msgHidden:(BOOL)msgHidden imageFrame:(CGRect)imageFrame lableFrame:(CGRect)lableFrame;
{
    number = 2;
    
    //停止定时器
    [timer invalidate];
    // 显示窗口
    //    [self showWindow];
    [self showWindow:-64];
    
    // 添加图片
    imageView = [[UIImageView alloc] init];
    imageView.image = image;
    imageView.frame = imageFrame;
    [window addSubview:imageView];
    
    // 创建lable
    label = [[UILabel alloc] init];
    [self showMessageTextColor:textColor];
    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentLeft;//文字向左对齐
    label.text = msg;
    label.numberOfLines = 0;//行数
    label.frame = lableFrame;
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideDismiss)];
    [label addGestureRecognizer:tapGesture];
    
    [window addSubview:label];
    
    if (msgHidden == YES) {
        // 定时器方法
        timer = [NSTimer scheduledTimerWithTimeInterval:MJCMessageDuration target:self selector:@selector(hideDismiss) userInfo:nil repeats:NO];
    }else{
        [timer invalidate];
    }

}




@end
