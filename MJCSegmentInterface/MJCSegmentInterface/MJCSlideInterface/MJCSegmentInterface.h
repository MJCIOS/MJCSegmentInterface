//
//  MJCSegmentInterface.h
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import <UIKit/UIKit.h>
#import "UIView+MJCClassExtension.h"
#import "MJCCommonTools.h"

//标题样式
typedef NS_OPTIONS(NSUInteger,MJCTitleBarStyles) {
    MJCTitlesClassicStyle = 0,      //经典标题样式
    MJCTitlesScrollStyle = 1       //滚动标题栏样式 
} ;

//底部指示器样式
typedef NS_OPTIONS(NSUInteger,MJCIndicatorStyles) {
    MJCIndicatorItemStyle = 0,  //普通的指示器样式(与item宽度一样)
    MJCIndicatorItemTextStyle = 1  //指示器与文字宽度一样的样式
};

//按钮图片样式
typedef NS_OPTIONS(NSUInteger,MJCImageEffectStyles) {
    MJCImageClassicStyle = 0,  //普通的图片文字样式,左右样式
    MJCImageUpDownStyle = 1  //图片和文字上下的样式
};

@class MJCSegmentInterface;
@protocol MJCSegmentDelegate <NSObject>
@required
@optional
/** 点击标题栏按钮的点击事件 */
- (void)mjc_ClickEvent:(UIButton *)tabItem childViewController:(UIViewController *)childViewController segmentInterface:(MJCSegmentInterface *)segmentInterface;
@end

@interface MJCSegmentInterface : UIView

/** 代理方法 */
@property (nonatomic,weak)id<MJCSegmentDelegate> delegate;

/** 标题栏样式 */
@property (nonatomic,assign) MJCTitleBarStyles titleBarStyles;
/** 底部指示器大小样式 */
@property (nonatomic,assign) MJCIndicatorStyles indicatorStyles;
/** 标题图片效果样式 */
@property (nonatomic,assign) MJCImageEffectStyles imageEffectStyles;


#pragma mark -- 通用设置

//标题文字的内边距
@property(nonatomic)   UIEdgeInsets itemTextsEdgeInsets;
//标题图片的内边距
@property(nonatomic)   UIEdgeInsets itemImagesEdgeInsets;
/** 默认显示多少个item (初始显示4个) */
@property (nonatomic,assign) NSInteger defaultShowItemCount;
/** 底部指示器是否随着滚动 */
@property (nonatomic,assign) BOOL isIndicatorFollow;
/** 默认选中的item */
@property (nonatomic,assign) NSInteger selectedSegmentIndex;
/** 子界面是否允许滑动 */
@property (nonatomic,assign) BOOL isChildScollEnabled;
/** 子界面滚动是否有动画 */
@property(nonatomic,assign) BOOL isChildScollAnimal;
/** 指示器是否有动画 */
@property(nonatomic,assign) BOOL isIndicatorsAnimals;
/** 是否显示标题文字 */
@property(nonatomic,assign) BOOL isItemTitleTextHidden;
/** 颜色是否渐变 */
@property (nonatomic,assign) BOOL isFontGradient;
/** 是否有穿透效果 */
@property (nonatomic,assign) BOOL isPenetrationEffect;
/** 用于缩放功能的修改字体的属性 */
-(void)tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont;

#pragma mark -- 底部指示器设置

/** 可设置指示器的Y值和高度,其余不允许自己设置 */
@property (nonatomic,assign) CGRect indicatorFrame;
/** 底部指示器背景色 */
@property (nonatomic,strong) UIColor *indicatorColor;
/** 底部指示器图片(设置了图片的话,此控件是根据图片本身的大小自适应的) */
@property (nonatomic,strong) UIImage *indicatorImage;
/** 底部指示器是否隐藏 */
@property (nonatomic,assign) BOOL indicatorHidden;

#pragma mark -- 标题栏设置

/** 标题栏frame */
@property (nonatomic,assign) CGRect titlesViewFrame;
/** 标题栏背景色 */
@property (nonatomic,strong) UIColor *titlesViewBackColor;
/** 标题栏背景图片 */
@property (nonatomic,strong) UIImage *titlesViewBackImage;

#pragma mark -- item设置
/** item背景颜色 */
@property (nonatomic,strong) UIColor *itemBackColor;
/** item普通状态下的图片 */
@property (nonatomic,strong) UIImage *itemImageNormal;
/** item点击状态下的图片 */
@property (nonatomic,strong) UIImage *itemImageSelected;
/** item普通状态下图片数组 */
@property (nonatomic,strong) NSArray *itemImageNormalArray;
/** item点击状态下图片数组 */
@property (nonatomic,strong) NSArray *itemImageSelectedArray;
/** item普通状态下背景图片 */
@property (nonatomic,strong) UIImage *itemBackNormalImage;
/** item点击状态下背景图片 */
@property (nonatomic,strong) UIImage *itemBackSelectedImage;
/** item普通状态下背景图片数组 */
@property (nonatomic,strong) NSArray *itemNormalBackImageArray;
/** item点击状态下背景图片数组 */
@property (nonatomic,strong) NSArray *itemSelectedBackImageArray;
/** item普通状态下文字颜色 */
@property (nonatomic,strong) UIColor *itemTextNormalColor;
/** item高亮状态下文字颜色 */
@property (nonatomic,strong) UIColor *itemTextSelectedColor;
/** item文字大小 */
@property (nonatomic,assign) CGFloat itemTextFontSize;
/** item的图片大小(不能设置背景图片) */
@property (nonatomic,assign) CGSize itemImageSize;

#pragma mark -- 添加方法和创建方法

/** 实例化此控件的方法 */
+(instancetype)showInterfaceWithTitleBarFrame:(CGRect)frame Styles:(MJCTitleBarStyles)titleBarStyles;
/** 添加控制器的方法(添加控制器按照控制器添加的先后顺序与按钮对应的 */
-(void)intoChildControllerArray:(NSArray *)childControllerArray;
/** 添加标题栏的方法 */
-(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController;


@end
