//
//  MJCSegmentInterface.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教
//  新增了标题栏滑动功能

#import "MJCSegmentInterface.h"
#import "MJCChildMainView.h"
#import "MJCTitlesView.h"
#import "MJCTabItem.h"
#import "MJCIndicatorView.h"
#import "sys/utsname.h"
#import "UIView+MJCClassExtension.h"
#import "UIColor+MJCClassExtension.h"
#import "MJCToolClasses.h"

static CGFloat const animalTime= 0.25;//动画时间
static CGFloat const defaultTitlesViewH = 50;//默认标题栏的高度
static CGFloat const defaultIndicatorH = 1.5;//默认指示器的高度
static CGFloat const defaultShowCountItem = 4;//默认显示多少个
static CGFloat const defaultItemFontSize = 14;//默认字体的大小

@interface MJCSegmentInterface ()<UIScrollViewDelegate>
@property (nonatomic,weak) MJCTabItem *selectedTitleButton;
//@property (nonatomic,weak) MJCTabItem *tabItem;
@property (nonatomic,strong) MJCIndicatorView *indicatorView;
@property (nonatomic, weak) MJCChildMainView *childMainView;
@property (nonatomic, weak) MJCTitlesView *titlesView;
@property (nonatomic,strong) NSArray *titlesArray;
@property (nonatomic,weak) UIViewController *hostController;
@property (nonatomic,weak) NSArray *childControllerArray;
@property (nonatomic, strong) NSMutableArray *titleButtonsArr;
@property (nonatomic,assign) BOOL zoomBigEnabled;
@property (nonatomic,assign) CGFloat tabItemTitleMaxfont;
@property (nonatomic,weak) UIViewController *childVC;
@property (nonatomic,assign) BOOL isLoadDefaultChildVC;
@property (nonatomic,assign) BOOL isLoadIndicatorFrame;
@property (nonatomic,assign) BOOL isSetDefaultSelectedItem;
@property (nonatomic,assign) BOOL isXibLayoutSetup;
@property (nonatomic,weak) MJCTabItem *oldsSelectedItem;
@property (nonatomic,weak) MJCTabItem *newsSelectedItem;
@property (nonatomic,weak) NSArray *normalColorRgbaArr;
@property (nonatomic,weak) NSArray *selectedColorRgbaArr;
@property (nonatomic,weak) NSArray *gradientRgbaArr;
@property (nonatomic,assign) NSInteger selectedTag;
@end
@implementation MJCSegmentInterface
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupBasicUI];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    _isXibLayoutSetup = YES;
    [self setupBasicUI];
    _titlesView.jc_width = self.jc_width;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self setupUIFrame];
}

+(instancetype)showInterfaceWithTitleBarStyles:(MJCTitleBarStyles)titleBarStyles frame:(CGRect)frame
{
    MJCSegmentInterface *interface = [[self alloc]initWithFrame:frame];
    interface.titleBarStyles = titleBarStyles;
    return interface;
}
- (NSMutableArray *)titleButtonsArr
{
    if (!_titleButtonsArr) {
        _titleButtonsArr = [NSMutableArray array];
    }
    return _titleButtonsArr;
}
-(void)setupBasicUI
{
    MJCTitlesView *titlesView = [[MJCTitlesView alloc]init];
    titlesView.frame = CGRectMake(0,0,0, defaultTitlesViewH);
    _titlesView = titlesView;
    MJCChildMainView *childMainView = [[MJCChildMainView alloc]init];
    childMainView.delegate = self;
    _childMainView = childMainView;
    _indicatorView = [MJCIndicatorView buttonWithType:UIButtonTypeCustom];
    _indicatorView.frame = CGRectMake(0,0,0,defaultIndicatorH);
    [self addSubview:childMainView];
    [self addSubview:titlesView];
}
-(void)setupUIFrame
{
    if (_titlesViewFrame.size.width == 0) {
        _titlesView.jc_width = self.jc_width;
    }else{
        _titlesView.jc_width = _titlesViewFrame.size.width;
    }
    
    if (_isLoadIndicatorFrame) {
        _indicatorView.jc_y = _indicatorFrame.origin.y;
        _indicatorView.jc_height = _indicatorFrame.size.height;
    }else{
        _indicatorView.jc_y = _titlesView.frame.size.height - _indicatorView.jc_height;
    }
    
    if (_isPenetrationEffect) {
        _childMainView.frame =CGRectMake(0,0,self.jc_width,self.jc_height);
    }else{
        CGFloat titlesViewMaxY = CGRectGetMaxY(_titlesView.frame);
        _childMainView.frame =CGRectMake(0,titlesViewMaxY,self.jc_width,self.jc_height-titlesViewMaxY);
    }
    if (_isLoadDefaultChildVC == YES) {
        NSUInteger index = _childMainView.contentOffset.x/_childMainView.jc_width;
        _childVC = _hostController.childViewControllers[index];
        _childVC.view.jc_height = _childMainView.bounds.size.height;
    }
}
-(void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    if (selectedSegmentIndex == _selectedTag)return;
    _selectedSegmentIndex = selectedSegmentIndex;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (selectedSegmentIndex >= _titlesArray.count) {
            return;
        }
        _isSetDefaultSelectedItem = YES;
        MJCTabItem *titlesButton =_titleButtonsArr[selectedSegmentIndex];
        [self titleClick:titlesButton];
    });
}
-(void)intoChildControllerArray:(NSArray *)childControllerArray
{   _childControllerArray = childControllerArray;
    if (self.hostController.childViewControllers.count == 0) {
        for (int i = 0; i < childControllerArray.count; i++) {
            [self.hostController addChildViewController:childControllerArray[i]];
        }
        [self addChildVcView];
    }
}
- (void)addChildVcView
{
    _hostController.automaticallyAdjustsScrollViewInsets = NO;
    NSUInteger index = _childMainView.contentOffset.x / _childMainView.jc_width;
    UIViewController *childVc;
    if (index >= _hostController.childViewControllers.count) {
        return;
    }
    childVc = self.hostController.childViewControllers[index];
    if ([childVc isViewLoaded]) return;
    childVc.view.frame = _childMainView.bounds;
    [_childMainView addSubview:childVc.view];
}
-(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController
{   _titlesArray = titlesArray;
    _hostController = hostController;
    _childMainView.contentSize = CGSizeMake(titlesArray.count * self.frame.size.width,0);
    if (!_isXibLayoutSetup) {
        [self layoutIfNeeded];
        [self setNeedsLayout];
    }
    [self setupTitlesButton:titlesArray];
    [_titlesView addSubview:_indicatorView];
    dispatch_async(dispatch_get_main_queue(), ^{
        _isLoadDefaultChildVC = YES;
    });
}

-(void)setupTitlesButton:(NSArray *)titlesArray
{
    _titlesArray = titlesArray;
    CGFloat maxTopMargin = 0;
    CGFloat maxBottomMargin = 0;
    CGFloat maxleftMargin = 0;
    CGFloat maxRightMargin = 0;
    CGFloat lineMargin = 0;
    CGFloat tabItemW;
    
    if (_titleBarStyles == MJCTitlesScrollStyle ) {
        if (_defaultShowItemCount) {//外界是否设置了值
            if (titlesArray.count <=defaultShowCountItem) {
                _defaultShowItemCount = titlesArray.count;
            }else{
                if ( _defaultShowItemCount > titlesArray.count) {
                    _defaultShowItemCount =defaultShowCountItem;
                }else{
                    _defaultShowItemCount = self.defaultShowItemCount;
                }
            }
            tabItemW = _titlesView.jc_width/_defaultShowItemCount;
        }else{
            tabItemW = _titlesView.jc_width/defaultShowCountItem;
        }
    }else{
        tabItemW = _titlesView.jc_width/titlesArray.count;
    }
    
    CGFloat tabItemH = _titlesView.jc_height;
    for (NSUInteger i = 0 ; i < titlesArray.count; i++) {
        MJCTabItem *tabbutton = [MJCTabItem buttonWithType:UIButtonTypeCustom];
        tabbutton.tag = i;
        CGFloat tabX = tabItemW*i+maxleftMargin;
        CGFloat tabY = maxTopMargin;
        CGFloat tabH = tabItemH - maxBottomMargin - maxTopMargin;
        tabbutton.frame = CGRectMake(tabX,tabY,tabItemW-lineMargin,tabH);
        [self setupButton:tabbutton];
        [_titlesView addSubview:tabbutton];
        [tabbutton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            tabbutton.selected = YES;
            if (_zoomBigEnabled) {
                tabbutton.itemTextFontSize = _tabItemTitleMaxfont;
            }
            _selectedTitleButton = tabbutton;
            [self setupIndicatorViewCenterAndWidth];
        }
        [self.titleButtonsArr addObject:tabbutton];
    }
    _titlesView.contentSize = CGSizeMake(titlesArray.count * tabItemW+maxRightMargin+maxleftMargin-lineMargin,0);
}
- (void)titleClick:(MJCTabItem *)titleButton
{
    _selectedTag = titleButton.tag;
    [self setupTitleCenter:titleButton];
    if (titleButton == _selectedTitleButton && !_isSetDefaultSelectedItem) { _selectedTitleButton.selected = YES; return;};
    _isSetDefaultSelectedItem = NO;
    if (_itemTextFontSize) {
        _selectedTitleButton.itemTextFontSize = _itemTextFontSize;
    }else{
        _selectedTitleButton.itemTextFontSize = defaultItemFontSize;
    }
    _selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    titleButton.itemTitleSelectedColor = _itemTextSelectedColor;
    _selectedTitleButton = titleButton;
    if (_zoomBigEnabled) {
        titleButton.itemTextFontSize = _tabItemTitleMaxfont;
    }
    [self setupChildViewScollAnimal:titleButton];
    [self addChildVcView];
    [self setupIndicatorViewCenterAndWidth];
    if ([self.delegate respondsToSelector:@selector(mjc_ClickEvent:childViewController:segmentInterface:)]) {
        if ( titleButton.tag >=_hostController.childViewControllers.count) {
            [self.delegate mjc_ClickEvent:titleButton childViewController:nil segmentInterface:self];
        }else{
            [self.delegate mjc_ClickEvent:titleButton childViewController:_hostController.childViewControllers[titleButton.tag] segmentInterface:self];
        }
        
    }
}

#pragma mark -- <UIScrollViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _childMainView  ) {
        if (_isIndicatorFollow == YES) {
            CGFloat value = scrollView.contentOffset.x / scrollView.frame.size.width;
            if (value >= _titlesArray.count - 1) return;
            if (value <= 0) return;
            CGFloat scaleRight = 0;
            CGFloat scaleLeft = 0;
            NSUInteger leftIndex = (int)value;
            NSUInteger rightIndex = leftIndex + 1;
            scaleRight = value - leftIndex;
            scaleLeft  = 1 - scaleRight;
            if (scaleLeft == 1 && scaleRight == 0)return;
            MJCTabItem *rightItem;
            MJCTabItem *leftItem = _titleButtonsArr[leftIndex];
            if (rightIndex < _titlesArray.count) {
                rightItem = _titleButtonsArr[rightIndex];
            }
            _indicatorView.jc_centerX = leftItem.jc_centerX + (rightItem.jc_centerX - leftItem.jc_centerX) * scaleRight;
        }
        if (_isFontGradient) {
            CGFloat value = scrollView.contentOffset.x / scrollView.frame.size.width;
            if (value >= _titlesArray.count - 1) return;
            if (value <= 0) return;
            CGFloat scaleRight = 0;
            CGFloat scaleLeft = 0;
            NSUInteger leftIndex = (int)value;
            NSUInteger rightIndex = leftIndex + 1;
            scaleRight = value - leftIndex;
            scaleLeft  = 1 - scaleRight;
            MJCTabItem *rightItem;
            MJCTabItem *leftItem = _titleButtonsArr[leftIndex];
            if (rightIndex < _titlesArray.count) {
                rightItem = _titleButtonsArr[rightIndex];
            }
            [self setupGramientWithValueTag:value leftItem:leftItem rightItem:rightItem scaleRight:scaleRight];
        }
    }
}

-(void)setupGramientWithValueTag:(NSInteger)value leftItem:(MJCTabItem*)leftItem rightItem:(MJCTabItem*)rightItem scaleRight:(CGFloat)scaleRight
{
    if (value > _selectedTag || value == _selectedTag) {
        leftItem.itemTitleSelectedColor = [UIColor oldColorWithSelectedColorRGBA:self.selectedColorRgbaArr deltaRGBA:self.gradientRgbaArr scale:scaleRight];
        _oldsSelectedItem =  leftItem;
        rightItem.itemTitleNormalColor = [UIColor newColorWithNormalColorRGBARGBA:self.normalColorRgbaArr deltaRGBA:self.gradientRgbaArr scale:scaleRight];
        _newsSelectedItem = rightItem;
    }else{
        leftItem.itemTitleNormalColor = [UIColor oldColorWithSelectedColorRGBA:self.selectedColorRgbaArr deltaRGBA:self.gradientRgbaArr scale:scaleRight];
        _newsSelectedItem = leftItem;
        rightItem.itemTitleSelectedColor = [UIColor newColorWithNormalColorRGBARGBA:self.normalColorRgbaArr deltaRGBA:self.gradientRgbaArr scale:scaleRight];
        _oldsSelectedItem =  rightItem;
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
//    if (scrollView == _childMainView) {
//        NSUInteger index = scrollView.contentOffset.x / scrollView.jc_width;
//        MJCTabItem *titleButton;
//        if (index == 6)return;
//        if (index < _titlesArray.count) {
//            titleButton = _titleButtonsArr[index+1];
//        }
//        [self setupTitleCenter:titleButton];
//    }
    _oldsSelectedItem.itemTitleNormalColor = _itemTextNormalColor;
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    _oldsSelectedItem.itemTitleNormalColor = _itemTextNormalColor;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.jc_width;
    MJCTabItem *titleButton = _titleButtonsArr[index];
    [self titleClick:titleButton];
    [_titleButtonsArr enumerateObjectsUsingBlock:^(MJCTabItem*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.itemTitleNormalColor = _itemTextNormalColor;
    }];
}
-(void)setupChildViewScollAnimal:(MJCTabItem *)titleButton
{
    if (_isChildScollAnimal == YES) {
        [UIView animateWithDuration:animalTime animations:^{
            CGPoint offset = _childMainView.contentOffset;
            offset.x = titleButton.tag * _childMainView.jc_width;
            [_childMainView setContentOffset:offset animated:NO];
        }];
    }else{
        CGPoint offset = _childMainView.contentOffset;
        offset.x = titleButton.tag * _childMainView.jc_width;
        [_childMainView setContentOffset:offset animated:NO];
    }
}
-(void)setupIndicatorViewCenterAndWidth
{
    [[MJCToolClasses toolClasses] setupIndicatorViewCenterAndWidthIsAnimal:_isChildScollAnimal indicatorStyles:_indicatorStyles selectedTitleButton:_selectedTitleButton indicatorFrame:_indicatorFrame indicatorView:_indicatorView];
}
- (void)setupTitleCenter:(UIButton *)titleButton
{
    [[MJCToolClasses  toolClasses] selectedTitleCenter:titleButton titlesScrollView:_titlesView];
}
-(void)setupButton:(MJCTabItem *)tabbutton
{
    if (!_isItemTitleTextHidden) {
            tabbutton.itemText = _titlesArray[tabbutton.tag];
    }
    tabbutton.backgroundColor = _itemBackColor;
    tabbutton.itemImageSize = _itemImageSize;
    tabbutton.itemTextFontSize = _itemTextFontSize;
    tabbutton.itemTitleNormalColor = _itemTextNormalColor;
    tabbutton.itemTitleSelectedColor = _itemTextSelectedColor;
    tabbutton.itemBackNormalImage = _itemBackNormalImage;
    tabbutton.itemBackSelectedImage = _itemBackSelectedImage;
    tabbutton.itemNormalBackImageArray = _itemNormalBackImageArray;
    tabbutton.itemSelectedBackImageArray = _itemSelectedBackImageArray;
    tabbutton.itemImageNormal = _itemImageNormal;
    tabbutton.tabItemImageSelected = _itemImageSelected;
    tabbutton.tabItemNormalImageArray = _itemImageNormalArray;
    tabbutton.tabItemSelectedImageArray = _itemImageSelectedArray;
    tabbutton.imageEffectStyles = _imageEffectStyles;
    tabbutton.itemTextsEdgeInsets = _itemTextsEdgeInsets;
    tabbutton.itemImagesEdgeInsets = _itemImagesEdgeInsets;
}
-(void)tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont
{
    _zoomBigEnabled = zoomBigEnabled;
    _tabItemTitleMaxfont = tabItemTitleMaxfont;
}
-(void)setIndicatorFrame:(CGRect)indicatorFrame
{
    _indicatorFrame = indicatorFrame;
    _indicatorView.frame = indicatorFrame;
    _isLoadIndicatorFrame = YES;
}
-(void)setIndicatorHidden:(BOOL)indicatorHidden
{
    _indicatorHidden = indicatorHidden;
    _indicatorView.hidden = indicatorHidden;
}
-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    _indicatorView.backgroundColor = indicatorColor;
}
-(void)setIndicatorImage:(UIImage *)indicatorImage
{
    _indicatorImage = indicatorImage;
    _indicatorView.indicatorImage = indicatorImage;
    _indicatorView.frame = CGRectMake(0,CGRectGetMaxY(_titlesView.frame)-_indicatorView.jc_height,_indicatorView.jc_width,_indicatorView.jc_height);
}
-(void)setDefaultShowItemCount:(NSInteger)defaultShowItemCount
{
    _defaultShowItemCount = defaultShowItemCount;
}
-(void)setTitlesViewFrame:(CGRect)titlesViewFrame
{
    _titlesViewFrame = titlesViewFrame;
    _titlesView.frame = titlesViewFrame;
    CGFloat indicatorY = titlesViewFrame.size.height;
    _indicatorView.frame = CGRectMake(0,indicatorY-_indicatorView.jc_height,_indicatorView.jc_width,_indicatorView.jc_height);
}
-(void)setTitlesViewBackColor:(UIColor *)titlesViewBackColor
{
    _titlesViewBackColor = titlesViewBackColor;
    _titlesView.backgroundColor = titlesViewBackColor;
}
-(void)setTitlesViewBackImage:(UIImage *)titlesViewBackImage
{
    _titlesViewBackImage = titlesViewBackImage;
    _titlesView.backgroudImage = titlesViewBackImage;
}
-(void)setIsChildScollEnabled:(BOOL)isChildScollEnabled
{
    _isChildScollEnabled = isChildScollEnabled;
    _childMainView.scrollEnabled = isChildScollEnabled;
}
-(void)setIsChildScollAnimal:(BOOL)isChildScollAnimal
{
    _isChildScollAnimal = isChildScollAnimal;
}
-(void)setItemBackColor:(UIColor *)itemBackColor
{
    _itemBackColor = itemBackColor;
}
-(void)setItemTextFontSize:(CGFloat)itemTextFontSize
{
    _itemTextFontSize = itemTextFontSize;
}
-(void)setItemTextNormalColor:(UIColor *)itemTextNormalColor
{
    _itemTextNormalColor = itemTextNormalColor;
}
-(void)setItemTextSelectedColor:(UIColor *)itemTextSelectedColor
{
    _itemTextSelectedColor = itemTextSelectedColor;
}
-(void)setItemImageNormal:(UIImage *)itemImageNormal
{
    _itemImageNormal = itemImageNormal;
}
-(void)setItemImageSelected:(UIImage *)itemImageSelected
{
    _itemImageSelected = itemImageSelected;
}
-(void)setItemImageNormalArray:(NSArray *)itemImageNormalArray
{
    _itemImageNormalArray = itemImageNormalArray;
}
-(void)setItemImageSelectedArray:(NSArray *)itemImageSelectedArray
{
    _itemImageNormalArray = itemImageSelectedArray;
}
-(void)setItemBackNormalImage:(UIImage *)itemBackNormalImage
{
    _itemBackNormalImage = itemBackNormalImage;
}
-(void)setItemBackSelectedImage:(UIImage *)itemBackSelectedImage
{
    _itemBackSelectedImage = itemBackSelectedImage;
}
-(void)setItemNormalBackImageArray:(NSArray *)itemNormalBackImageArray
{
    _itemNormalBackImageArray = itemNormalBackImageArray;
}
-(void)setItemSelectedBackImageArray:(NSArray *)itemSelectedBackImageArray
{
    _itemSelectedBackImageArray = itemSelectedBackImageArray;
}
-(void)setIsItemTitleTextHidden:(BOOL)isItemTitleTextHidden
{
    _isItemTitleTextHidden = isItemTitleTextHidden;
}
-(void)setItemImageSize:(CGSize)itemImageSize
{
    _itemImageSize = itemImageSize;
}
-(void)setItemTextsEdgeInsets:(UIEdgeInsets)itemTextsEdgeInsets
{
    _itemTextsEdgeInsets = itemTextsEdgeInsets;
}
-(void)setItemImagesEdgeInsets:(UIEdgeInsets)itemImagesEdgeInsets
{
    _itemImagesEdgeInsets = itemImagesEdgeInsets;
}

- (NSArray *)gradientRgbaArr
{
    if (!_gradientRgbaArr) {
        NSArray *gradientRgbaArr = [UIColor jc_gradientRGBAWith:self.normalColorRgbaArr selectedColorRGBA:self.selectedColorRgbaArr];
        _gradientRgbaArr = gradientRgbaArr;
    }
    return _gradientRgbaArr;
}
- (NSArray *)normalColorRgbaArr
{
    if (!_normalColorRgbaArr) {
        NSArray *normalColorRgbaArr = [UIColor jc_getNeedColorRgbaArr:_itemTextNormalColor];
        _normalColorRgbaArr = normalColorRgbaArr;
    }
    return  _normalColorRgbaArr;
}
- (NSArray *)selectedColorRgbaArr
{
    if (!_selectedColorRgbaArr) {
        NSArray *selectedColorRgbaArr = [UIColor jc_getNeedColorRgbaArr:_itemTextSelectedColor];
        _selectedColorRgbaArr = selectedColorRgbaArr;
    }
    return  _selectedColorRgbaArr;
}



@end
