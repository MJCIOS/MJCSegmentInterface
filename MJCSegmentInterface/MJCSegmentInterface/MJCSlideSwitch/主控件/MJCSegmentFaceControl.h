//
//  MJCSegmentsInterface.h
//  MJCSegmentInterface
//
//  Created by mjc on 16/12/16.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+MJCExtenSion.h"
#import "MJCSegmentInterface.h"

@interface MJCSegmentFaceControl : NSObject

/** slideDelegate代理方法 */
@property (nonatomic,weak)id<MJCSlideSwitchViewDelegate> slideDelegate;

/** 添加分段控件 */
-(UIView *)intoFaceView:(MJCSegmentInterfaceStyle)interfacestyle;

/** 添加标题 */
-(void)intoTitlesArray:(NSArray *)titlesArray;

/** 添加控制器 */
-(void)intoChildViewController:(UIViewController *)childViewController;


/** 分段控件的尺寸位置 */
@property (nonatomic,assign) CGRect faceViewFrame;

/** segmentInterface 样式，默认为SegMentInterfaceStyleClassic样式 */
@property (nonatomic, assign) MJCSegmentInterfaceStyle interFaceControlStyle;

/** 底部指示器样式 */
@property (nonatomic,assign) MJCSegmentIndicatorStyle indicatorStyle;

/** 标题栏图片样式 */
@property (nonatomic,assign) MJCImageEffectStyle imageEffectStyle;

/** 是否滚动标题(导航标题栏不适用) */
@property(nonatomic,assign,getter = scrollTitlesEnabled) BOOL scrollTitlesEnabled;

/** 子界面是否滑动 */
@property(nonatomic,assign,getter = childScollEnabled) BOOL childScollEnabled;

/** 子界面滚动是否有动画 */
@property(nonatomic,assign,getter= childViewScollAnimal) BOOL childViewScollAnimal;

#pragma mark -- 标题栏设置创建和滚动标题栏的设置
/** 标题栏Frame */
@property(nonatomic,assign) CGRect titlesViewframe;

/** 标题栏颜色 */
@property (nonatomic,strong) UIColor *titlesViewColor;

/** 滚动标题栏Frame */
@property(nonatomic) CGRect titleScrollframe;

/** 滚动标题栏颜色 */
@property (nonatomic,strong) UIColor *titleScrollColor;

#pragma mark -- childView子界面的属性设置

/** 子控制器视图界面的Frame */
@property(nonatomic,assign) CGRect  childViewframe;

#pragma mark -- 底部指示器的属性设置
/** 底部指示器的宽度 */
@property (nonatomic,assign) CGFloat indicatorWidth;

/** 底部指示器:颜色 */
@property (nonatomic,strong) UIColor *indicatorColor;

/** 是否显示底部指示器 */
@property (nonatomic,getter=indicatorHidden) BOOL indicatorHidden;

/** 底部指示器:frame */
@property (nonatomic) CGRect indicatorFrame;


#pragma mark -- 顶部横线的属性设置
/** 顶部横线条是否显示 */
@property (nonatomic,assign,getter= topViewHidden) BOOL topViewHidden;

/** 顶部线条颜色 */
@property (nonatomic,strong) UIColor *topViewColor;

/** 顶部线条frame */
@property (nonatomic) CGRect topViewFrame;

/** 顶部线条高度 */
@property (nonatomic,assign) CGFloat topViewHegiht;


#pragma mark -- 底部横线的属性设置
/** 底部横线条是否显示 */
@property (nonatomic,assign,getter = bottomViewHidden) BOOL bottomViewHidden;

/** 底部线条颜色 */
@property (nonatomic,strong) UIColor *bottomViewColor;

/** 底部线条frame */
@property (nonatomic) CGRect bottomViewFrame;

/** 底部线条高度 */
@property (nonatomic,assign) CGFloat bottomViewHegiht;


#pragma mark -- tabItem的属性设置
/** tabItem背景色 */
@property (nonatomic,strong) UIColor *tabItemBackColor;

/** tabItem文字大小 */
@property (nonatomic,strong) UIFont *tabItemTitlesfont;

/** tabItem的Frame */
@property(nonatomic) CGRect  tabItemFrame;

/** tabItemWidth (这个是给滚动标题栏使用的) */
@property (nonatomic,assign) CGFloat tabItemWidth;

/** tabItemtitle普通状态颜色 */
@property (nonatomic,strong) UIColor *tabItemTitleNormalColor;

/** tabItemtitle点击状态下文字颜色 */
@property (nonatomic,strong) UIColor *tabItemTitleSelectedColor;


/** tabItem按钮的普通状态下背景图片 */
@property (nonatomic,strong) UIImage *tabItemImageNormal;
/** tabItem按钮的点击状态下背景图片 */
@property (nonatomic,strong) UIImage *tabItemImageSelected;
/** tabItem图片数组----tabItem数量一致,要不然图片数组会越界,会崩溃(此问题有人能解决的,可以给我点建议) */
@property (nonatomic,strong) NSArray *tabItemImageNormalArray;
@property (nonatomic,strong) NSArray *tabItemImageSelectedArray;

/** tabItem按钮的普通状态下背景图片 */
@property (nonatomic,strong) UIImage *tabItemBackImageNormal;
/** tabItem按钮的点击状态下背景图片 */
@property (nonatomic,strong) UIImage *tabItemBackImageSelected;
/** tabItem图片数组----tabItem数量一致,要不然图片数组会越界,会崩溃(此问题有人能解决的,可以给我点建议) */
@property (nonatomic,strong) NSArray *tabItemBackImageNormalArray;
@property (nonatomic,strong) NSArray *tabItemBackImageSelectedArray;


#pragma mark -- 右部竖线的属性设置
/** 右部竖线线条高度 */
@property (nonatomic,assign) CGFloat verticalLineHegiht;

/** 右部竖线线条是否显示 */
@property (nonatomic,assign,getter= verticalLineHidden) BOOL verticalLineHidden;

/** 右边竖线颜色 */
@property (nonatomic,strong) UIColor *verticalLineColor;



#pragma mark -- 右边按钮
/** 最右边按钮是否隐藏 */
@property (nonatomic,getter = rightMostBtnShow) BOOL rightMostBtnShow;

/** 最右边按钮的颜色 */
@property (nonatomic,strong) UIColor *rightMostBtnColor;

/** 最右边按钮的图片 */
@property (nonatomic,strong) UIImage *rightMostBtnImage;

/** 最右边按钮的位置 */
@property(nonatomic) CGRect  rightMostBtnFrame;

/** 最左边位置的时候最左边按钮的图片 */
@property (nonatomic,strong) UIImage *mostLeftPosition;

/** 最右边位置的时候的最右边按钮的图片 */
@property (nonatomic,strong) UIImage *mostRightPosition;

/** 是否开启跳转子界面最左边位置以及最右边位置 */
@property (nonatomic,getter=isOpenJump) BOOL isOpenJump;



-(UIView *)intoTitlesFace:(NSArray *)titlesArr;

-(UIScrollView *)intoScollFace:(NSArray *)titlesArr;



#pragma mark -- 工具方法
/**
 *  图片转换成颜色的方法
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  颜色机制转换
 */
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

/** 最右边按钮的顶部间距 */
@property (nonatomic,assign) CGFloat rightBtnTopMargin;

/** 最右边按钮的底部间距 */
@property (nonatomic,assign) CGFloat rightBtnBottomMargin;

/** 最右边按钮的右边间距 */
@property (nonatomic,assign) CGFloat rightBtnRightMargin;


/** 有导航栏或者tabbar时,保证标题栏不会被覆盖 */
+(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers;





@end
