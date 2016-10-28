//
//  shishishi.m
//  试试
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCSlideInterface.h"

#define MJCScreenbound [UIScreen mainScreen].bounds
#define MJCScreenWidth [UIScreen mainScreen].bounds.size.width
#define MJCScreenHeight [UIScreen mainScreen].bounds.size.height



static const CGFloat margain = 0;
static const CGFloat btnMargain = 0;


@interface MJCSlideInterface ()<UIScrollViewDelegate>

///** 当前选中的标题按钮 */
@property (nonatomic, strong) UIButton *firstTitleButton;

/** 标题按钮底部的指示器 */
@property (nonatomic, strong) UIView *indicatorView;
/** UIScrollView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 标题栏view */
@property (nonatomic, strong) UIScrollView *titlesScrollView;




/** 所有item的margin */
@property (nonatomic,assign) CGFloat margin;
/** 最左最右tabItemMargin */
@property (nonatomic,assign) CGFloat tabItemMargin;
/** tabItemWidth */
@property (nonatomic,assign) CGFloat tabItemWidth;
/** tabItemHeight */
@property (nonatomic,assign) CGFloat tabItemHeight;
/** tabItemY */
@property (nonatomic,assign) CGFloat tabItemY;




/** 底部横线 */
@property (nonatomic,strong) UIView *bottomView;

/** 标题tabitem */
@property (nonatomic,strong) UIButton *titlesButton;

/** tabitem宽度 */
@property (nonatomic,assign) CGFloat btnW;
/** tabitemH */
@property (nonatomic,assign) CGFloat btnH;
/** tabitemX */
@property (nonatomic,assign) CGFloat btnX;

/** loc标识 */
@property (nonatomic,assign) NSUInteger loc;

/** 数量 */
@property (nonatomic,assign) NSUInteger counut;

/** i */
//@property (nonatomic,assign) NSUInteger tagI;

@end


@implementation MJCSlideInterface

//重写方法 通过代码自定义控件,都要重写这个方法
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        self.frame = [UIScreen mainScreen].bounds;//如果外界没有设置frame,那我们这里面要设置下
        //实例化mainVC,为当前view创建一个mainVC
        _addChildViewController = [self viewController:self];
        
    }
    
    return self;
    
}

//给view加了一个UIViewController控制器
- (UIViewController *)viewController:(UIView *)view{
    
    UIResponder *responder = view;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            return (UIViewController *)responder;
    
    return nil;
}

#pragma mark -- 添加子控制器
-(void)setAddChildViewController:(UIViewController *)addChildViewController
{
    _addChildViewController = addChildViewController;
    //实例化mainVC,为当前view创建一个mainVC
    _addChildViewController = [self viewController:self];
    //添加子控制器
    [_addChildViewController addChildViewController:addChildViewController];
    //添加子控制器的view
    [self addChildVcView];

}

/**
 *  !!!:添加子控制器的view
 */
- (void)addChildVcView
{
    // 子控制器的索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.mjc_width;
    
    // 取出子控制器
    UIViewController *childVc = _addChildViewController.childViewControllers[index];
    if ([childVc isViewLoaded]) return;
    //子控制器的frame
    childVc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVc.view];
    
}

#pragma mark -- 子控制器的滚动界面
-(void)setScollViewArr:(NSArray *)scollViewArr
{
    // 不允许自动调整scrollView的内边距
//    _childViewController.automaticallyAdjustsScrollViewInsets = NO;
    
    //子控制器的滚动界面
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor whiteColor];
    

    //设置子界面的frame
    [self isChildViewframe:_isChildViewframe childViewframe:_childViewframe];
    
    
    scrollView.pagingEnabled = YES;
    //是否允许滑动
    scrollView.scrollEnabled = _isChildViewEnabled;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
//    scrollView.scrollsToTop = NO; // 点击状态栏的时候，这个scrollView不会滚动到最顶部

    // 添加所有子控制器的view到scrollView中(内容大小)
    scrollView.contentSize = CGSizeMake(scollViewArr.count * scrollView.mjc_width, 0);

    [self addSubview:scrollView];
    
}
//设置子界面的frame
-(void)isChildViewframe:(BOOL)isChildViewframe childViewframe:(CGRect)childViewframe
{
    _isChildViewframe = isChildViewframe;
    _childViewframe = childViewframe;
    
    if (_isChildViewframe == kNilOptions) {
        self.scrollView.frame = self.bounds;
    }else{
        self.scrollView.frame = _childViewframe;
    }
}


#pragma mark -- 加载主标题栏
-(void)addTitlesArray:(NSArray *)titlesArray
{
    
    [self setScollViewArr:titlesArray];

    // !!!:标题栏主容器
    // 创建titleScrollView
    UIScrollView *titleScrollView = [[UIScrollView alloc] init];
    _titlesScrollView = titleScrollView;
    
    //设置滚动标题栏
    [self setupTitleScrollView:titleScrollView];
    //设置标题按钮
    [self setupTitlesButton:titlesArray];
    //设置底部横线
    [self setupBottomView:titleScrollView];
    //设置底部指示器
    [self setupindicatorView:titleScrollView];
    
}

#pragma mark -- 创建滚动标题栏
-(void)setupTitleScrollView:(UIScrollView *)titleScrollView
{
    _titlesScrollView = titleScrollView;
    
    [self isTitlesViewframe:_isTitlesViewframe titlesViewframe:_titlesViewframe];
    [self setTitlesViewColor:_titlesViewColor];

    
    [self addSubview:titleScrollView];
    
}

//设置滚动标题栏的位置
-(void)isTitlesViewframe:(BOOL)isTitlesViewframe titlesViewframe:(CGRect)titlesViewframe
{
    _isTitlesViewframe = isTitlesViewframe;
    _titlesViewframe = titlesViewframe;
    
    if (self.isTitlesViewframe == kNilOptions) {
        self.titlesScrollView.frame = CGRectMake(0, 0, self.bounds.size.width, 50);
    }else{
        self.titlesScrollView.frame = titlesViewframe;
    }
    
}
//设置标题栏的颜色
-(void)setTitlesViewColor:(UIColor *)titlesViewColor
{
    _titlesViewColor = titlesViewColor;
    
    if (self.titlesViewColor == kNilOptions) {
        self.titlesScrollView.backgroundColor = [UIColor whiteColor];
    
    }else{
      self.titlesScrollView.backgroundColor = titlesViewColor;
    }

}

#pragma mark -- tabItem设置创建
-(void)setupTitlesButton:(NSArray *)titlesArray
{
    // !!!:添加标题按钮
    NSArray *titles = titlesArray;
    NSUInteger count = titles.count;
    _counut = count;
    
    [self setTabItemWidth:_tabItemWidth];

    self.btnH = _titlesScrollView.mjc_height;
    self.btnX = 0;
//    _tagI = 0;
    
    for (NSUInteger i = 0; i < count; i++) {
        
        // 创建按钮
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.titlesButton = titleButton;
        //按钮tag值
        titleButton.tag = i;
        
//        _tagI = i;
        
        NSUInteger loc = i % count;
        _loc = loc;
        self.btnX = (margain + self.btnW) *_loc + btnMargain + margain;
        
        //设置tabitem文字大小
        [self setTabItemTitlesfont:_tabItemTitlesfont];
        //设置item背景色
        [self setTabItemBackColor:_tabItemBackColor];
        //设置item普通状态下的文字颜色
        [self setTabItemTitleNormalColor:_tabItemTitleNormalColor];
        
        //设置item点击状态下的文字颜色
        [self setTabItemTitleSelectedColor:_tabItemTitleSelectedColor];
        
        //设置item普通状态下的图片
        [self setTabItemImageNormal:_tabItemImageNormal];
        
        //设置item图片数组
        [self setTabItemImageArray:titleButton buttonTag:i];
        
        
        //设置item位置
        if (_isMargin == kNilOptions) {
            //设置item的位置
            [self isTabItemFrame:_isTabItemFrame tabItemFrame:_tabItemFrame];
        }else{
            //设置item的位置
            [self isTabItemFrame:_isTabItemFrame margin:_margin tabItemMargin:_tabItemMargin tabItemWidth:_tabItemWidth tabItemHeight:_tabItemHeight tabItemY:_tabItemY];
        }
        
        // 设置按钮数据
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        //按钮点击事件
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_titlesScrollView addSubview:titleButton];
    }
    
    
    // 设置标题的滚动范围
    if (_margin == kNilOptions && _tabItemMargin == kNilOptions) {
        // 设置标题的滚动范围((按钮数量 * 按钮宽度) + (间距 * 数量+1 如果你不加1,最后面就少一个间距) + 最两边的间距* 2 (因为有两边嘛))
        self.titlesScrollView.contentSize = CGSizeMake(count * self.btnW + _margin*(count+1) + _tabItemMargin * 2, 0);
    }else{
        
        self.titlesScrollView.contentSize = CGSizeMake(count * self.btnW + _margin*(count+1) + _tabItemMargin * 2, 0);
    
    }
    
    self.titlesScrollView.showsHorizontalScrollIndicator = NO;
}

//设置tabitemFrame
-(void)isTabItemFrame:(BOOL)isTabItemFrame margin:(CGFloat)margin tabItemMargin:(CGFloat)tabItemMargin tabItemWidth:(CGFloat)tabItemWidth tabItemHeight:(CGFloat)tabItemHeight tabItemY:(CGFloat)tabItemY
{
    _isTabItemFrame = isTabItemFrame;
    _margin = margin;
    _tabItemMargin = tabItemMargin;
    _tabItemWidth = tabItemWidth;
    _tabItemHeight = tabItemHeight;
    _tabItemY = tabItemY;
    
    if (_isTabItemFrame == kNilOptions) {
        
        //如果按钮宽度未设置
        if (_tabItemWidth == kNilOptions) {
        
            //如果间距没设置
            if (self.margin == kNilOptions && self.tabItemMargin == kNilOptions) {
                //我帮忙设置了好了宽度
                self.titlesButton.frame = CGRectMake(self.btnX,0,self.btnW,self.btnH);

            }else{
                
                self.btnX = (margin + self.btnW) *_loc + tabItemMargin + margin;
                //我们帮忙设置了好了宽度
                self.titlesButton.frame = CGRectMake(self.btnX,0,self.btnW,self.btnH);
            }
        
        }else{
            //设置了宽度后的位置
            if (self.margin == kNilOptions && self.tabItemMargin == kNilOptions) {
                //将用户设置的宽度传到这里
                self.titlesButton.frame = CGRectMake(self.btnX,0,_tabItemWidth,self.btnH);
            }else{
                self.btnX = (margin + self.btnW) *_loc + tabItemMargin + margin;
                //我们帮忙设置了好了宽度
                self.titlesButton.frame = CGRectMake(self.btnX,0,_tabItemWidth,self.btnH);
            }
            
        }
    }else{
            //同意用户设置frame之后的设置
            //btnx = (间距 + 按钮宽度) * _loc + 最两边左右间距 + 普通间距
            self.btnX = (margin + tabItemWidth) *_loc + tabItemMargin + margin;
            //都讲用户设置的东西传入进去
            self.titlesButton.frame = CGRectMake(self.btnX , tabItemY, tabItemWidth, tabItemHeight);
    }

}

/** 设置tabItemFrame */
-(void)isTabItemFrame:(BOOL)isTabItemFrame tabItemFrame:(CGRect)tabItemFrame;
{
    _isTabItemFrame = isTabItemFrame;
    _tabItemFrame = tabItemFrame;
    
    if (_isTabItemFrame ==kNilOptions) {
        //我们帮忙设置了好了宽度
        self.titlesButton.frame = CGRectMake(self.btnX,0,self.btnW,self.btnH);
    }else{
        //我们帮忙设置了好了宽度
        self.titlesButton.frame = tabItemFrame;

    }
}

//设置tabItem的宽度
-(void)setTabItemWidth:(CGFloat)tabItemWidth
{
    _tabItemWidth = tabItemWidth;
   
        //如果外界没传,或者为0
        if (_tabItemWidth == kNilOptions) {
            //自动帮它宽度设置为120;
            self.btnW = 120;
        }else{
            //如果传了多少宽度,设置为用户传的宽度
            self.btnW = tabItemWidth;
        }

}

//设置tabitem的文字大小
-(void)setTabItemTitlesfont:(UIFont *)tabItemTitlesfont
{
    _tabItemTitlesfont = tabItemTitlesfont;
    //如果没传,为14
    if (_tabItemTitlesfont == kNilOptions) {
        self.titlesButton.titleLabel.font = [UIFont systemFontOfSize:14];
    }else{
        self.titlesButton.titleLabel.font = _tabItemTitlesfont;
    }

}
//设置tabitem的背景色
-(void)setTabItemBackColor:(UIColor *)tabItemBackColor
{
    _tabItemBackColor = tabItemBackColor;
    
    if (_tabItemBackColor == kNilOptions) {
        self.titlesButton.backgroundColor = [UIColor clearColor];
    }else{
        self.titlesButton.backgroundColor = tabItemBackColor;
    }
}
//设置tabitem的普通状态下文字颜色
-(void)setTabItemTitleNormalColor:(UIColor *)tabItemTitleNormalColor
{
    _tabItemTitleNormalColor = tabItemTitleNormalColor;
    if (_tabItemTitleNormalColor == kNilOptions) {
        [self.titlesButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }else{
        [self.titlesButton setTitleColor:tabItemTitleNormalColor forState:UIControlStateNormal];
    }
}
//设置tabitem点击状态下的文字颜色
-(void)setTabItemTitleSelectedColor:(UIColor *)tabItemTitleSelectedColor
{
    _tabItemTitleSelectedColor = tabItemTitleSelectedColor;
    if (_tabItemTitleNormalColor == kNilOptions) {
        [self.titlesButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    }else{
        [self.titlesButton setTitleColor:tabItemTitleSelectedColor forState:UIControlStateSelected];
    }

}
//设置tabitem普通状态下的图片
-(void)setTabItemImageNormal:(UIImage *)tabItemImageNormal
{
    _tabItemImageNormal = tabItemImageNormal;
    
    if (_tabItemImageNormal == kNilOptions) {
        [self.titlesButton setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self.titlesButton setBackgroundImage:tabItemImageNormal forState:UIControlStateNormal];
    }
}
//设置tabitem的图片数组
-(void)setTabItemImageArray:(UIButton *)titleButton buttonTag:(NSUInteger)buttonTag
{
    if (_tabItemImageArray == kNilOptions) {
//        [titleButton setBackgroundImage:tabItemImageNormal forState:UIControlStateNormal];
    }else{
        [titleButton setBackgroundImage:[UIImage imageNamed:_tabItemImageArray[buttonTag]] forState:UIControlStateNormal];
    }
}


#pragma mark -- 底部横线的设置创建
-(void)setupBottomView:(UIScrollView *)titleScrollView
{
    
    UIView *bottomView = [[UIView alloc]init];
    self.bottomView = bottomView;
    
    [self setBottomViewColor:_bottomViewColor];
    
    [self isBottomViewFrame:_isBottomViewFrame setBottomViewFrame:_bottomViewFrame];
    
    [self setBottomViewHidden:_bottomViewHidden];
    [titleScrollView addSubview:bottomView];
}



-(void)setBottomViewHidden:(BOOL)bottomViewHidden
{
    _bottomViewHidden = bottomViewHidden;
    if (self.bottomViewHidden == YES) {
        self.bottomView.hidden = YES;
    }else{
        self.bottomView.hidden = NO;
    }
}


-(void)setBottomViewColor:(UIColor *)bottomViewColor
{
    _bottomViewColor = bottomViewColor;
    if (_bottomViewColor == kNilOptions) {
        self.bottomView.backgroundColor  = [[UIColor blackColor]colorWithAlphaComponent:0.1];

    }else{
        self.bottomView.backgroundColor  = bottomViewColor;
    }
}


-(void)isBottomViewFrame:(BOOL)isBottomViewFrame setBottomViewFrame:(CGRect)setBottomViewFrame
{
    self.isBottomViewFrame = isBottomViewFrame;
    self.bottomViewFrame = setBottomViewFrame;
    
    
    if (isBottomViewFrame == kNilOptions) {
        
        if (_bottomViewHegiht == kNilOptions) {
            self.bottomView.mjc_x = self.titlesScrollView.mjc_x;
            self.bottomView.mjc_height = 1;
            self.bottomView.mjc_y = self.titlesScrollView.mjc_height - self.bottomView.mjc_height;
            self.bottomView.mjc_width = self.titlesScrollView.contentSize.width ;
        }else{
        
            self.bottomView.mjc_x = self.titlesScrollView.mjc_x;
            self.bottomView.mjc_height = _bottomViewHegiht;
            self.bottomView.mjc_y = self.titlesScrollView.mjc_height - self.bottomView.mjc_height;
            self.bottomView.mjc_width = self.titlesScrollView.mjc_width;
        }
        
    }else{
        self.bottomView.frame = setBottomViewFrame;
    }

}


#pragma mark -- 底部指示器创建设置
-(void)setupindicatorView:(UIScrollView *)titlesScrollView
{
    UIButton *firstTitleButton = _titlesScrollView.subviews.firstObject;

    [firstTitleButton.titleLabel sizeToFit];

    firstTitleButton.selected = YES;
    self.firstTitleButton = firstTitleButton;
    
    UIView *indicatorView = [[UIView alloc] init];
    self.indicatorView = indicatorView;
    [self setIndicatorColor:_indicatorColor];
    
    [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];

    [_titlesScrollView addSubview:indicatorView];
    
    if (_isIndicatorHidden == kNilOptions) {
        indicatorView.hidden = NO;
    }else{
        indicatorView.hidden = YES;
    }
    
}

-(void)isindicatorFrame:(BOOL)isindicatorFrame indicatorFrame:(CGRect)indicatorFrame
{
    _isindicatorFrame = isindicatorFrame;
    _indicatorFrame = indicatorFrame;

    if (_isindicatorFrame == kNilOptions) {
        if (_indicatorWidth == kNilOptions) {
            
            self.indicatorView.mjc_height = 1;
            self.indicatorView.mjc_y = _titlesScrollView.mjc_height - self.indicatorView.mjc_height;
            self.indicatorView.mjc_width = self.firstTitleButton.titleLabel.mjc_width;
            self.indicatorView.mjc_centerX = self.firstTitleButton.mjc_centerX;

        }else{
            
            self.indicatorView.mjc_height = 1;
            self.indicatorView.mjc_y = _titlesScrollView.mjc_height - self.indicatorView.mjc_height;
            self.indicatorView.mjc_width = _indicatorWidth;
            self.indicatorView.mjc_centerX = self.firstTitleButton.mjc_centerX;
        }

    }else{
        
        self.indicatorView.frame = indicatorFrame;
    }
    
}


-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    if (_indicatorColor == kNilOptions) {
       self.indicatorView.backgroundColor = [self.firstTitleButton titleColorForState:UIControlStateSelected];
    }else{
        self.indicatorView.backgroundColor = indicatorColor;
    }
}

- (void)titleClick:(UIButton *)titleButton
{

    self.firstTitleButton.selected = NO;
    titleButton.selected = YES;
    self.firstTitleButton = titleButton;
    

    [UIView animateWithDuration:0.25 animations:^{
        [self isindicatorFrame:_isindicatorFrame indicatorFrame:_indicatorFrame];
        self.indicatorView.mjc_centerX = titleButton.mjc_centerX;
    }];
    

    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.mjc_width;
    [self.scrollView setContentOffset:offset animated:YES];
}


#pragma mark -- <UIScrollViewDelegate>
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcView];
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.mjc_width;
    UIButton *titleButton = self.titlesScrollView.subviews[index];
    [self titleClick:titleButton];
    
    [self addChildVcView];
    
}



@end
