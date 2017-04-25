//
//  MJCSegmentInterface.h
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+MJCExtenSion.h"
#import "UIImage+MJCExtenSion.h"
#import "MJCToolClasses.h"

//标题样式
typedef enum {
    MJCTitlesClassicStyle,//经典标题样式
    MJCTitlesScrollStyle//滚动标题栏样式
} MJCTitleBarStyles;

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

/** 点击标题栏按钮的点击事件 */
- (void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface;

/** 右边按钮的点击事件 */
- (void)mjc_MostClickEvent:(UIButton *)rightMostButton segmentInterface:(MJCSegmentInterface *)segmentInterface;

/** 添加控制器的delegate方法 */
- (NSMutableArray *)mjc_intoChildControllerArrayHostMainController;


/** 设置默认点击的按钮和默认的显示界面 */
- (NSInteger )mjc_defaultSelectedTabItem;

@end

@interface MJCSegmentInterface : UIView

@property (nonatomic,assign) BOOL followScrollEnabled;

/** slideDelegate代理方法 */
@property (nonatomic,weak)id<MJCSlideSwitchViewDelegate> slideDelegate;

+ (instancetype)segmentinitWithFrame:(CGRect)frame MJCTitleBarStyle:(MJCTitleBarStyles)MJCTitleBarStyle;

- (instancetype)initWithFrame:(CGRect)frame MJCTitleBarStyle:(MJCTitleBarStyles)MJCTitleBarStyles;




#pragma mark -- 样式

/** 标题栏样式 */
@property (nonatomic,assign) MJCTitleBarStyles MJCTitleBarStyles;

/** 底部指示器样式 */
@property (nonatomic,assign) MJCIndicatorStyles MJCIndicatorStyle;

/** 标题图片样式 */
@property (nonatomic,assign) MJCImageEffectStyles MJCImageEffectStyle;

#pragma mark -- 标题栏设置创建和滚动标题栏的设置

/** 主控制器(传入正在使用这个框架的控制器) */
//@property (nonatomic,strong) UIViewController *hostController;

/** 标题栏Frame */
@property(nonatomic,assign) CGRect titleViewframe;

/** 标题栏颜色 */
@property (nonatomic,strong) UIColor *titleViewColor;


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
//@property (nonatomic) CGRect indicatorFrame;


#pragma mark -- childView子界面的属性设置

/** 子界面是否滑动 */
@property(nonatomic,assign,getter = childScollEnabled) BOOL childScollEnabled;

/** 子界面滚动是否有动画 */
@property(nonatomic,assign,getter= isChildViewScollAnimal) BOOL childViewScollAnimal;


#pragma mark -- tabItem的属性设置
/** 设置默认点击的按钮,显示界面 */
@property(nonatomic) NSInteger selectedSegmentIndex;

/** 初始显示几个Item */
@property (nonatomic,assign) NSInteger initialShowItem;

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

/** 用于缩放功能的修改字体的属性 */
-(void)tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont tabItemTitleMinfont:(CGFloat)tabItemTitleMinfont;

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
@property (nonatomic,strong) UIImage *pointedLeftImage;
/** 最右边位置的时候的最右边按钮的图片 */
@property (nonatomic,strong) UIImage *pointedRightImage;

/** 是否开启跳转子界面最左边位置以及最右边位置 */
@property (nonatomic,getter=isOpenJump) BOOL isOpenJump;

#pragma mark -- 添加方法

/** 添加控制器的方法(添加控制器按照控制器添加的先后顺序与按钮对应的 */
-(void)intoChildViewController:(UIViewController *)childViewController;

/** 添加控制器的方法(添加控制器按照控制器添加的先后顺序与按钮对应的 */
-(void)intoChildControllerArray:(NSArray *)childControllerArray;

/** 添加标题栏的方法 */
-(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController;


@end
