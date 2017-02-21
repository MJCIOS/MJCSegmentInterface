//
//  MJCSegmentInterface.h
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MJCConst.h"
#import "UIView+MJCExtenSion.h"

//RBG颜色
#define MJCRGBColor(r,g,b,alphas) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:alphas]

#define MJCScreenbound [UIScreen mainScreen].bounds
#define MJCScreenWidth [UIScreen mainScreen].bounds.size.width
#define MJCScreenHeight [UIScreen mainScreen].bounds.size.height

//标题样式
typedef enum {
    MJCSegMentTitlesClassicStyle,//经典标题样式
    MJCSegMentTitlesNavBarStyle//导航标题栏样式
} MJCSeMentTitleBarStyles;

//底部指示器样式
typedef enum {
    MJCIndicatorItemStyle,
    MJCIndicatorItemTextStyle
} MJCIndicatorStyles;

//按钮图片样式
typedef NS_OPTIONS(NSUInteger,MJCImageEffectStyles) {
    MJCImageClassicStyle = 0,
    MJCImageUpDownStyle = 1
};


@class MJCSegmentInterface;

@protocol MJCSlideSwitchViewDelegate <NSObject>

@required

@optional

/** 点击按钮scollview产生动画滚动结束时,就会调用这个方法 */
//- (void)mjc_ScrollViewDidEndScrollingAnimation:(MJCSegmentInterface *)segmentInterface;

//- (void)mjc_scrollViewDidEndDecelerating:(MJCSegmentInterface *)segmentInterface;

-(void)mjc_DefaultClickSelectedSegmentIndex:(MJCSegmentInterface *)segmentInterface;

/** 在拖拽scrollView滚动动画结束时, 就会调用这个方法  */
- (void)mjc_scrollDidEndDecelerating:(UIButton *)button segmentInterface:(MJCSegmentInterface *)segmentInterface;

/** 点击标题栏按钮的点击事件 */
- (void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface;

/** 右边按钮的点击事件 */
- (void)mjc_MostClickEvent:(UIButton *)rightMostButton segmentInterface:(MJCSegmentInterface *)segmentInterface;

@end

@interface MJCSegmentInterface : UIView

/** 标题按钮缩放效果 */
@property (nonatomic,assign) BOOL zoomBigEnabled;

/** 标题栏是否滚动 */
@property (nonatomic,assign) BOOL titlesScrollEnabled;

/** slideDelegate代理方法 */
@property (nonatomic,weak)id<MJCSlideSwitchViewDelegate> slideDelegate;

#pragma mark -- 样式

+ (instancetype)segmentinitWithFrame:(CGRect)frame MJCSeMentTitleBarStyle:(MJCSeMentTitleBarStyles)MJCSeMentTitleBarStyle;

/** 标题栏样式 */
@property (nonatomic,assign) MJCSeMentTitleBarStyles MJCSeMentTitleBarStyle;

/** 标题栏界面样式，默认为样式 */
//@property (nonatomic, assign) MJCTitlesInterfaceStyles MJCTitlesInterfaceStyle;

/** 底部指示器样式 */
@property (nonatomic,assign) MJCIndicatorStyles MJCIndicatorStyle;

/** 标题图片样式 */
@property (nonatomic,assign) MJCImageEffectStyles MJCImageEffectStyle;


#pragma mark -- 标题栏设置创建和滚动标题栏的设置

/** 滚动标题栏Frame */
@property(nonatomic,assign) CGRect titleViewframe;

/** 滚动标题栏颜色 */
@property (nonatomic,strong) UIColor *titleViewColor;


#pragma mark -- 右部竖线的属性设置
//***********************//

/** 右部竖线线条高度 */
@property (nonatomic,assign) CGFloat verticalLineHegiht;

/** 右部竖线线条是否显示 */
@property (nonatomic,assign,getter= verticalLineHidden) BOOL verticalLineHidden;

/** 右边竖线颜色 */
@property (nonatomic,strong) UIColor *verticalLineColor;


//*******************//




#pragma mark -- 底部横线的属性设置
//*******************//

/** 底部横线条是否显示 */
@property (nonatomic,assign,getter = bottomViewHidden) BOOL bottomViewHidden;

/** 底部线条颜色 */
@property (nonatomic,strong) UIColor *bottomViewColor;

/** 底部线条frame */
@property (nonatomic) CGRect bottomViewFrame;

/** 底部线条高度 */
@property (nonatomic,assign) CGFloat bottomViewHegiht;

#pragma mark -- 顶部横线的属性设置

/** 顶部横线条是否显示 */
@property (nonatomic,assign,getter= topViewHidden) BOOL topViewHidden;

/** 顶部线条颜色 */
@property (nonatomic,strong) UIColor *topViewColor;

/** 顶部线条frame */
@property (nonatomic,assign) CGRect topViewFrame;

/** 顶部线条高度 */
@property (nonatomic,assign) CGFloat topViewHegiht;

#pragma mark -- 底部指示器的属性设置

/** 底部指示器的高度 */
@property (nonatomic,assign) CGFloat indicatorHeight;
/** 底部指示器的宽度 */
@property (nonatomic,assign) CGFloat indicatorWidth;
/** 底部指示器:颜色 */
@property (nonatomic,strong) UIColor *indicatorColor;
/** 是否显示底部指示器 */
@property (nonatomic,getter=isIndicatorHidden) BOOL indicatorHidden;
/** 底部指示器:frame */
@property (nonatomic) CGRect indicatorFrame;


#pragma mark -- childView子界面的属性设置
/** 子控制器视图界面的Frame */
@property(nonatomic,assign) CGRect  childViewframe;

/** 是否开启用户自己设置子控制器视图界面的frame */
//@property(nonatomic,getter = isChildViewframe) BOOL isChildViewframe;

/** 子界面是否滑动 */
@property(nonatomic,assign,getter = childScollEnabled) BOOL childScollEnabled;

/** 子界面滚动是否有动画 */
@property(nonatomic,assign,getter= isChildViewScollAnimal) BOOL childViewScollAnimal;



#pragma mark -- tabItem的属性设置

/** 设置默认点击的按钮,显示界面 */
@property(nonatomic) NSInteger selectedSegmentIndex;

/** tabItemWidth 只用于滚动栏 */
@property (nonatomic,assign) CGFloat tabItemWidth;

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

/** tabItemtitle普通状态颜色 */
@property (nonatomic,strong) UIColor *tabItemTitleNormalColor;
/** tabItemtitle点击状态下文字颜色 */
@property (nonatomic,strong) UIColor *tabItemTitleSelectedColor;
/** tabItem背景色 */
@property (nonatomic,strong) UIColor *tabItemBackColor;

/** tabItem文字大小 */
@property (nonatomic,strong) UIFont *tabItemTitlesfont;


#pragma mark -- 右边按钮
/** 最右边按钮是否隐藏 */
@property (nonatomic,getter=rightMostBtnHidden) BOOL rightMostBtnHidden;

/** 最右边按钮的颜色 */
@property (nonatomic,strong) UIColor *rightMostBtnColor;

/** 最右边按钮的图片 */
@property (nonatomic,strong) UIImage *rightMostBtnImage;
/** 最右边按钮的大小位置 */
@property(nonatomic,assign) CGRect  rightMostBtnFrame;


/** 最左边位置的时候最左边按钮的图片 */
@property (nonatomic,strong) UIImage *rightMostLeftSide;
/** 最右边位置的时候的最右边按钮的图片 */
@property (nonatomic,strong) UIImage *rightMostRightSide;

/** 是否开启跳转子界面最左边位置以及最右边位置 */
@property (nonatomic,getter=isOpenJump) BOOL isOpenJump;




#pragma mark -- childView子界面的属性设置

/** 添加控制器(添加控制器按照控制器添加的先后顺序与按钮对应的:比如说第一个按钮对应第一个添加的控制器)*/
-(void)intoChildViewController:(UIViewController *)childViewController;
/**
 *  添加标题栏的方法
 */
-(void)intoTitlesArray:(NSArray *)titlesArray;

/** 创建标题栏的方法 */
-(UIScrollView *)intoFaceView;




#pragma mark -- 工具方法
/** 有导航栏或者tabbar时,保证标题栏不会被覆盖 */
+(void)useNavOrTabbarNotBeCover:(UIViewController *)controllers rectEdge:(UIRectEdge)rectEdge;

/**
 *  图片转换成颜色的方法
 */
+ (UIImage *)imageWithColor:(UIColor *)color;







@end
