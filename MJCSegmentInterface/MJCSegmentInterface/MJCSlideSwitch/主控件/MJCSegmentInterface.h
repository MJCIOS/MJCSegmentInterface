//
//  MJCSegmentInterface.h
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//  有啥问题加我QQ: 1611891567 一起交流,我是菜菜..求大神指教

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MJCConst.h"
#import "UIView+MJCExtenSion.h"

#define SDColorCreater(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

#define MJCScreenbound [UIScreen mainScreen].bounds
#define MJCScreenWidth [UIScreen mainScreen].bounds.size.width
#define MJCScreenHeight [UIScreen mainScreen].bounds.size.height

//子界面样式
typedef enum {
    SegMentInterfaceStyleClassic,//经典样式
    SegMentInterfaceStylePenetrate,//穿透样式(普通穿透标题栏)
    SegMentInterfaceStyleLess,   //少用样式(格子竖线标题栏)
    SegMentInterfaceStyleMoreUse,//更少用样式(格子穿透标题栏)
    SegMentInterfaceStyleExceedUse //超少用样式(适用于上面没有导航栏的情况)
} MJCSegmentInterfaceStyle;

//底部指示器样式
typedef enum {
    SegMentIndicatorItemStyle,
    SegMentIndicatorItemTextStyle
} MJCSegmentIndicatorStyle;

//@protocol MJCSlideSwitchViewDelegate <NSObject>
//
//@required
//
//
//@optional
//
//
//@end


@interface MJCSegmentInterface : UIView

#pragma mark -- 默认为样式 
/** segmentInterface 样式，默认为样式 */
@property (nonatomic, assign) MJCSegmentInterfaceStyle SegmentInterFaceStyle;

/** 底部指示器样式 */
@property (nonatomic,assign) MJCSegmentIndicatorStyle SegmentIndicatorStyle;




#pragma mark -- 滚动标题栏设置创建
//***********************//

/** 标题栏Frame */
@property(nonatomic) CGRect titlesViewframe;
/** 是否自己设置标题栏的frame */
@property(nonatomic,getter = isTitlesViewframe) BOOL isTitlesViewframe;
/** 标题栏颜色 */
@property (nonatomic,strong) UIColor *titlesViewColor;

/** 一句代码设置标题栏Frame */
-(void)isTitlesViewframe:(BOOL)isTitlesViewframe titlesViewframe:(CGRect)titlesViewframe;


//*******************//

#pragma mark -- 右部竖线的属性设置
//***********************//

/** 右部竖线线条是否显示,只用于SegMentInterfaceStyleClassic,SegMentInterfaceStylePenetrate*/
@property (nonatomic,assign,getter= isRightViewShow) BOOL rightViewShow;

/** 右部竖线线条高度 */
@property (nonatomic,assign) CGFloat rightViewHegiht;

/** 右部竖线线条是否显示,只用于SegMentInterfaceStyleLess,SegMentInterfaceStyleMoreUse*/
@property (nonatomic,assign,getter= isRightViewHidden) BOOL rightViewHidden;

/** 右边竖线颜色 */
@property (nonatomic,strong) UIColor *rightColor;

//*******************//




#pragma mark -- 底部横线的属性设置
//*******************//

/** 底部横线条是否显示 */
@property (nonatomic,assign,getter = bottomViewHidden) BOOL bottomViewHidden;

/** 底部线条颜色 */
@property (nonatomic,strong) UIColor *bottomViewColor;

/** 是否开启用户改动底部线条Frame */
@property (nonatomic,getter=isBottomViewFrame) BOOL isBottomViewFrame;

/** 底部线条frame */
@property (nonatomic) CGRect bottomViewFrame;

/** 底部线条高度 */
@property (nonatomic,assign) CGFloat bottomViewHegiht;

/** 一句代码设置底部横条的Frame */
-(void)isBottomViewFrame:(BOOL)isBottomViewFrame setBottomViewFrame:(CGRect)bottomViewFrame;

//*******************//


#pragma mark -- 顶部横线的属性设置
//*******************//

/** 顶部横线条是否显示 */
@property (nonatomic,assign,getter= topViewHidden) BOOL topViewHidden;

/** 顶部线条颜色 */
@property (nonatomic,strong) UIColor *topViewColor;

/** 是否开启用户改动顶部线条Frame */
@property (nonatomic,getter=isTopViewFrame) BOOL isTopViewFrame;

/** 顶部线条frame */
@property (nonatomic) CGRect topViewFrame;

/** 顶部线条高度 */
@property (nonatomic,assign) CGFloat topViewHegiht;

/** 一句代码设置底部横条的Frame */
-(void)isTopViewFrame:(BOOL)isTopViewFrame setTopViewFrame:(CGRect)topViewFrame;

//*******************//



#pragma mark -- 底部指示器的属性设置
//*******************//
/** 底部指示器的宽度 */
@property (nonatomic,assign) CGFloat indicatorWidth;
/** 底部指示器:颜色 */
@property (nonatomic,strong) UIColor *indicatorColor;
/** 是否显示底部指示器 */
@property (nonatomic,getter=isIndicatorHidden) BOOL indicatorHidden;

/** 底部指示器:frame */
@property (nonatomic) CGRect indicatorFrame;

/** 是否开启用户修改底部指示器frame */
@property (nonatomic,getter=isindicatorFrame) BOOL isindicatorFrame;

/** 一句代码设置底部指示器的frame */
-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame;

//*******************//


#pragma mark -- childView子界面的属性设置
//*******************//

/** 子控制器视图界面的Frame */
@property(nonatomic) CGRect  childViewframe;

/** 是否开启用户自己设置子控制器视图界面的frame */
@property(nonatomic,getter = isChildViewframe) BOOL isChildViewframe;

/** 子界面是否滑动 */
@property(nonatomic,assign,getter = isChildViewEnabled) BOOL childViewEnabled;

/** 一句代码设置子界面的frame */
-(void)isChildViewframe:(BOOL)isChildViewframe childViewframe:(CGRect)childViewframe;

//*******************//



#pragma mark -- tabItem的属性设置

//*******************//

/** tabItem按钮的普通状态下背景图片 */
@property (nonatomic,strong) UIImage *tabItemImageNormal;
/** tabItem按钮的点击状态下背景图片 */
@property (nonatomic,strong) UIImage *tabItemImageSelected;


/** tabItem图片数组----tabItem数量一致,要不然图片数组会越界,会崩溃(此问题有人能解决的,可以给我点建议) */
@property (nonatomic,strong) NSArray *tabItemImageNormalArray;
@property (nonatomic,strong) NSArray *tabItemImageSelectedArray;

/** tabItemtitle普通状态颜色 */
@property (nonatomic,strong) UIColor *tabItemTitleNormalColor;
/** tabItemtitle点击状态下文字颜色 */
@property (nonatomic,strong) UIColor *tabItemTitleSelectedColor;
/** tabItem背景色 */
@property (nonatomic,strong) UIColor *tabItemBackColor;

/** tabItem文字大小 */
@property (nonatomic,strong) UIFont *tabItemTitlesfont;

/** tabItem的位置(是否开启用户修改tabItem的位置) */
@property (nonatomic,getter=isTabItemFrame) BOOL isTabItemFrame;
/** tabItem的Frame */
@property(nonatomic) CGRect  tabItemFrame;


/** 是否同意让用户设置间距 */
@property (nonatomic,getter=isMargin) BOOL isMargin;

/** 一句代码设置tabItem的Frame */
-(void)isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame;


//*******************//




#pragma mark -- childView子界面的属性设置
//**********重写set方法***********//


/** 添加控制器(添加控制器按照控制器添加的先后顺序与按钮对应的:比如说第一个按钮对应第一个添加的控制器)*/
@property (nonatomic,strong) UIViewController *addChildViewController;


//**********重写set方法***********//




//***************** 创建set方法 ****************//

/**
 *  添加标题栏的方法
 */
-(void)addTitlesArray:(NSArray *)titlesArray;




#pragma mark -- 工具方法
/**
 *  图片转换成颜色的方法
 */
- (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  颜色机制转换
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

/**
 *  添加子控制器的view
 */
//-(void)addChildViewControllerView;


//***************** 创建set方法 ****************//



@end
