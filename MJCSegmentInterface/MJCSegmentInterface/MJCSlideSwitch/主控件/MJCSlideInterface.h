//
//  shishishi.h
//  试试
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+MJCExtenSion.h"

//@protocol MJCSlideSwitchViewDelegate <NSObject>
//
//@required
//
//
//@optional
//
//
//@end


@interface MJCSlideInterface : UIView

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

/** 是否滚动 */
@property (nonatomic,getter=istitlesScollEnabled) BOOL istitlesScollEnabled;

//*******************//



#pragma mark -- 底部横线的属性设置
//*******************//

/** 底部横线条是否显示 */
@property (nonatomic,assign,getter= bottomViewHidden) BOOL bottomViewHidden;

/** 底部线条颜色 */
@property (nonatomic,strong) UIColor *bottomViewColor;

/** 是否开启用户改动底部线条Frame */
@property (nonatomic,getter=isBottomViewFrame) BOOL isBottomViewFrame;

/** 底部线条frame */
@property (nonatomic) CGRect bottomViewFrame;

/** 底部线条高度 */
@property (nonatomic,assign) CGFloat bottomViewHegiht;

/** 一句代码设置底部横条的Frame */
-(void)isBottomViewFrame:(BOOL)isBottomViewFrame setBottomViewFrame:(CGRect)setBottomViewFrame;

//*******************//



#pragma mark -- 底部指示器的属性设置
//*******************//
/** 底部指示器的宽度 */
@property (nonatomic,assign) CGFloat indicatorWidth;
/** 底部指示器:颜色 */
@property (nonatomic,strong) UIColor *indicatorColor;
/** 是否显示底部指示器 */
@property (nonatomic,getter=isIndicatorHidden) BOOL isIndicatorHidden;

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
@property(nonatomic,assign,getter = isChildViewEnabled) BOOL isChildViewEnabled;

/** 一句代码设置子界面的frame */
-(void)isChildViewframe:(BOOL)isChildViewframe childViewframe:(CGRect)childViewframe;

//*******************//







#pragma mark -- tabItem的属性设置

//*******************//

/** tabItem按钮的背景图片 */
@property (nonatomic,strong) UIImage *tabItemImageNormal;

/** tabItem图片数组----tabItem数量一致,要不然图片数组会越界,会崩溃(此问题有人能解决的,可以给我点建议) */
@property (nonatomic,strong) NSArray *tabItemImageArray;

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


//设置tabitem的Frame间距;(这个方法不够完善,你们也可以用用看)
-(void)isTabItemFrame:(BOOL)isTabItemFrame margin:(CGFloat)margin tabItemMargin:(CGFloat)tabItemMargin tabItemWidth:(CGFloat)tabItemWidth tabItemHeight:(CGFloat)tabItemHeight tabItemY:(CGFloat)tabItemY;

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




/**
 *  添加子控制器的view
 */
//-(void)addChildViewControllerView;


//***************** 创建set方法 ****************//


@end
