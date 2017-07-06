//  代码地址:https://github.com/MJCIOS/MJCSegmentInterface
//  MJCSegmentInterface.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/6/29.
//  Copyright © 2017年 MJC. All rights reserved.
//  有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教

#import "MJCSegmentInterface.h"
#import "MJCOrdinaryLayout.h"
#import "MJCChildsView.h"
#import "MJCTabItem.h"
#import "MJCInterfaceTools.h"
#import "MJCTitlesView.h"

static NSString *const MJCItemCellID = @"itemCell";
static CGFloat const animalTime = 0.25;
static CGFloat const navH = 64;
static CGFloat const defaultTitlesViewH = 50;
static CGFloat const defaultIndicatorH = 1.5;
static CGFloat const defaultShowCountItem = 4;
@interface MJCSegmentInterface ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (nonatomic,weak) MJCTitlesView *titlesViews;
@property (nonatomic,strong) MJCChildsView *childScrollView;
@property (nonatomic,strong) UIButton *indicator;
@property (nonatomic,strong) NSArray *titlesItemArr;
@property (nonatomic,weak) UIViewController *mainViewController;
@property (nonatomic,weak) NSArray *childControllerArray;
@property (nonatomic,assign) BOOL zoomBigEnabled;
@property (nonatomic,assign) CGFloat tabItemTitleMaxfont;
@property (nonatomic,weak) MJCTabItem *selectedItem;
@property (nonatomic,assign) BOOL isScrollMax;
@property (nonatomic,weak) UIViewController *childVC;
@property (nonatomic,assign) BOOL isLoadDefaultChildVC;
@property (nonatomic,assign) BOOL isLoadTitlesFrame;
@end
@implementation MJCSegmentInterface
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self titlesViews];
        [self setupOtherUI];
    }
    return self;
}
-(void)setupOtherUI
{
    _titlesViews.frame = CGRectMake(0,0,self.frame.size.width,defaultTitlesViewH);
    _childScrollView = [[MJCChildsView  alloc]init];
    _childScrollView.delegate = self;
    _childScrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_childScrollView];
}
-(MJCTitlesView *)titlesViews
{
    if (!_titlesViews) {
        MJCOrdinaryLayout *layout = [[MJCOrdinaryLayout alloc]init];
        layout.srollingDirection = UICollectionViewScrollDirectionHorizontal;
        layout.hlitemShowMaxCount = defaultShowCountItem;
        layout.hlitemMaxTopMargin = 0;
        layout.hlitemMaxBottomMargin = 0;
        layout.hlitemMaxLeftMargin = 0;
        layout.hlitemMaxRightMargin = 0;
        layout.hlitemLineMargin = 0;
        MJCTitlesView *titlesViews = [[MJCTitlesView alloc]initWithFrame:CGRectMake(0,0,0,0) collectionViewLayout:layout];
        titlesViews.delegate = self;
        titlesViews.dataSource = self;
        [self addSubview:titlesViews];
        [titlesViews registerClass:[MJCTabItem class] forCellWithReuseIdentifier:MJCItemCellID];
        _titlesViews = titlesViews;
        _indicator = [UIButton buttonWithType:UIButtonTypeCustom];
        _indicator.backgroundColor = [UIColor blackColor];
        _indicator.userInteractionEnabled = NO;
        _indicator.enabled = NO;
        [titlesViews addSubview:_indicator];
    }
    return _titlesViews;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupUIFrame];
}
-(void)setupUIFrame
{
    CGFloat colletionMaxY = CGRectGetMaxY(_titlesViews.frame);
    _childScrollView.frame =CGRectMake(0,colletionMaxY,self.mjc_width,self.mjc_height-colletionMaxY);
    if (_isLoadDefaultChildVC == YES) {
//        dispatch_async(dispatch_get_main_queue(), ^{
            NSUInteger index = _childScrollView.contentOffset.x/_childScrollView.mjc_width;
            _childVC = _mainViewController.childViewControllers[index];
            _childVC.view.mjc_height = _childScrollView.bounds.size.height;
//        });
    }
}
-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    if (_isLoadTitlesFrame == YES)return;
    _titlesViews.frame  = CGRectMake(0,0,frame.size.width,defaultTitlesViewH);
    _indicator.frame = CGRectMake(0,CGRectGetMaxY(_titlesViews.frame)-defaultIndicatorH,0,defaultIndicatorH);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _titlesItemArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MJCTabItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MJCItemCellID forIndexPath:indexPath];
    cell.tag = indexPath.row;
    cell.backgroundColor = _itemBackColor;
    if (indexPath.row < _titlesItemArr.count){
        cell.itemText = _titlesItemArr[indexPath.row];
        cell.itemTextFontSize = _itemTextFontSize;
        cell.itemTitleNormalColor = _itemTextNormalColor;
        cell.itemTitleSelectedColor = _itemTextSelectedColor;
        cell.itemBackNormalImage = _itemBackNormalImage;
        cell.itemBackSelectedImage = _itemBackSelectedImage;
        cell.itemNormalBackImageArray = _itemNormalBackImageArray;
        cell.itemSelectedBackImageArray = _itemSelectedBackImageArray;
        cell.itemImageNormal = _itemImageNormal;
        cell.tabItemImageSelected = _itemImageSelected;
        cell.tabItemNormalImageArray = _itemImageNormalArray;
        cell.tabItemSelectedImageArray = _itemImageSelectedArray;
        cell.imageEffectStyles = _imageEffectStyles;
        cell.textsEdgeInsets = _textsEdgeInsets;
        cell.imagesEdgeInsets = _imagesEdgeInsets;
    }
    if (_indicatorFrame.size.width == 0) {
        _indicator.mjc_width = cell.mjc_width;
    }else{
        _indicator.mjc_width = _indicatorFrame.size.width;
    }
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MJCTabItem *cell = (MJCTabItem *)[collectionView cellForItemAtIndexPath:indexPath];
    if (_selectedItem == cell) return;
    _selectedItem = cell;
    if (_zoomBigEnabled) {
        cell.itemTextFontSize = _tabItemTitleMaxfont;
    }
    [self collectV:_titlesViews cellForItemAtIndexPath:indexPath itemBtn:cell];
    if ([self.delegate respondsToSelector:@selector(mjc_ClickEvent:childViewController:segmentInterface:)]) {
        [self.delegate mjc_ClickEvent:cell childViewController:_childVC segmentInterface:self];
    }
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    MJCTabItem *cell = (MJCTabItem *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.itemTextFontSize = _itemTextFontSize;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _childScrollView && _isIndicatorFollow == YES) {
        CGFloat value = scrollView.contentOffset.x / scrollView.frame.size.width;
        if (value >= _titlesItemArr.count - 1) return;
        if (value <= 0) return;
        CGFloat scaleRight = 0;
        CGFloat scaleLeft = 0;
        NSUInteger leftIndex = (int)value;
        NSUInteger rightIndex = leftIndex + 1;
        scaleRight = value - leftIndex;
        scaleLeft  = 1 - scaleRight;
        MJCTabItem *leftItem;
        MJCTabItem *rightItem;
        leftItem = (MJCTabItem *)[_titlesViews cellForItemAtIndexPath:[NSIndexPath indexPathForItem:leftIndex inSection:0]];
        if (rightIndex < _titlesItemArr.count) {
            rightItem = (MJCTabItem *)[_titlesViews cellForItemAtIndexPath:[NSIndexPath indexPathForItem:rightIndex inSection:0]];
        }
        [self setupIndicatorViewScroll:scrollView leftItem:leftItem rightItem:rightItem scaleR:scaleRight];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _childScrollView) {
        NSInteger itemIndex = scrollView.contentOffset.x / scrollView.mjc_width;
        if (itemIndex != _titlesItemArr.count-1)_isScrollMax = NO;
        if (_isScrollMax == YES) return;
        if (itemIndex == _titlesItemArr.count-1)_isScrollMax = YES;
        _selectedItem.itemTextFontSize = _itemTextFontSize;
        [_titlesViews selectItemAtIndexPath:[NSIndexPath indexPathForItem:itemIndex inSection:0] animated:YES scrollPosition:(UICollectionViewScrollPositionNone)];
        MJCTabItem *cell = (MJCTabItem *)[_titlesViews cellForItemAtIndexPath:[NSIndexPath indexPathForItem:itemIndex inSection:0]];
        cell.itemTextFontSize = _tabItemTitleMaxfont;
        _selectedItem = cell;
        [self collectV:_titlesViews cellForItemAtIndexPath:[NSIndexPath indexPathForItem:itemIndex inSection:0] itemBtn:_selectedItem];
        //下面的方法,遇到s b用户,稍微有点问题,暂时不用
//        [self collectionView:_titlesViews didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:itemIndex inSection:0]];
//        [self collectionView:_titlesViews didDeselectItemAtIndexPath:[NSIndexPath indexPathForItem:itemIndex-1 inSection:0]];
//        [self collectionView:_titlesViews didDeselectItemAtIndexPath:[NSIndexPath indexPathForItem:itemIndex+1 inSection:0]];
    }
}
-(void)setupTiTlesViewDefaultItem:(NSIndexPath *)indexPath
{
    MJCTabItem *cell = [self collectionView:_titlesViews cellForItemAtIndexPath:indexPath];
    _indicator.mjc_centerX = cell.mjc_centerX;
}
- (void)selectedTitleCenter:(MJCTabItem *)cell titlesScrollView:(UICollectionView *)collectionViews
{
    CGFloat offsetX = cell.center.x - collectionViews.mjc_width * 0.7;
    if (offsetX < 0) {
        offsetX = 0;
    }
    CGFloat maxOffsetX = collectionViews.contentSize.width - collectionViews.mjc_width;
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [collectionViews setContentOffset: CGPointMake(offsetX,0) animated:YES];   
}
- (void)addChildVcView
{
    //为什么一定要不让系统自动修改布局呢,如果不设为NO,会导致外界其他子控件每次滚动会调用我们这里scrollView的一个代理方法
    _mainViewController.automaticallyAdjustsScrollViewInsets = NO;
    NSUInteger index = _childScrollView.contentOffset.x/_childScrollView.mjc_width;
    UIViewController *childVc;
    if (index >= _mainViewController.childViewControllers.count) {
//        NSLog(@"您的控制器数量不够:控制器数量:%ld个 tabItem数量:%ld个",_mainViewController.childViewControllers.count,_titlesItemArr.count);
        return;
    }
    childVc = _mainViewController.childViewControllers[index];
    if ([childVc isViewLoaded]) return;
    childVc.view.frame = _childScrollView.bounds;
    [_childScrollView addSubview:childVc.view];
}
-(void)setupChildViewScollAnimal:(NSInteger)itemTag
{
    if (_isChildScollAnimal) {
        [UIView animateWithDuration:animalTime animations:^{
            CGPoint offset = _childScrollView.contentOffset;
            offset.x = itemTag * _childScrollView.mjc_width;
            [self.childScrollView setContentOffset:offset animated:NO];
        }];
    }else{
        CGPoint offset = _childScrollView.contentOffset;
        offset.x = itemTag * _childScrollView.mjc_width;
        [self.childScrollView setContentOffset:offset animated:NO];
    }
}
-(void)setupIndicatorViewScroll:(UIScrollView *)scrollView leftItem:(MJCTabItem *)leftItem rightItem:(MJCTabItem *)rightItem scaleR:(CGFloat)scaleR
{
    _indicator.mjc_centerX = leftItem.mjc_centerX + (rightItem.mjc_centerX - leftItem.mjc_centerX) * scaleR;
}
- (void)collectV:(UICollectionView *)collectV cellForItemAtIndexPath:(NSIndexPath *)indexPath itemBtn:(MJCTabItem *)itemBtn
{
    [self setupTiTlesViewDefaultItem:indexPath];
    [self selectedTitleCenter:itemBtn titlesScrollView:collectV];
    [self setupChildViewScollAnimal:indexPath.row];
    [self addChildVcView];
}

-(void)setIsChildScollEnabled:(BOOL)isChildScollEnabled
{
    _isChildScollEnabled = isChildScollEnabled;
    _childScrollView.scrollEnabled = isChildScollEnabled;
}
-(void)setIsChildScollAnimal:(BOOL)isChildScollAnimal
{
    _isChildScollAnimal = isChildScollAnimal;
}
-(void)setDefaultShowItemCount:(NSInteger)defaultShowItemCount
{
    _defaultShowItemCount = defaultShowItemCount;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (defaultShowItemCount > _titlesItemArr.count) {
            _defaultShowItemCount = _titlesItemArr.count;
        }
        MJCOrdinaryLayout *layout = [[MJCOrdinaryLayout alloc]init];
        layout.srollingDirection = UICollectionViewScrollDirectionHorizontal;
        layout.hlitemShowMaxCount = _defaultShowItemCount;
        layout.hlitemMaxTopMargin = 0;
        layout.hlitemMaxBottomMargin = 0;
        layout.hlitemMaxLeftMargin = 0;
        layout.hlitemMaxRightMargin = 0;
        layout.hlitemLineMargin = 0;
        [_titlesViews setCollectionViewLayout:layout];
    });
}
-(void)setTitlesViewFrame:(CGRect)titlesViewFrame
{
    _titlesViewFrame = titlesViewFrame;
    _isLoadTitlesFrame = YES;
    _titlesViews.frame = titlesViewFrame;
//    dispatch_async(dispatch_get_main_queue(), ^{
    _indicator.frame = CGRectMake(0,CGRectGetMaxY(_titlesViews.frame)-defaultIndicatorH,0,defaultIndicatorH);
//    });
}
-(void)setTitlesViewBackColor:(UIColor *)titlesViewBackColor
{
    _titlesViewBackColor = titlesViewBackColor;
    _titlesViews.backgroundColor = titlesViewBackColor;
}
-(void)setTitlesViewBackImage:(UIImage *)titlesViewBackImage
{
    _titlesViewBackImage = titlesViewBackImage;
    _titlesViews.backgroundView = [[UIImageView alloc]initWithImage:titlesViewBackImage];
}
-(void)setIndicatorFrame:(CGRect)indicatorFrame
{
    _indicatorFrame = indicatorFrame;
    _indicator.frame = indicatorFrame;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self setupTiTlesViewDefaultItem:[NSIndexPath indexPathForItem:_defaultItemNumber inSection:0]];
//    });
}
-(void)setIndicatorHidden:(BOOL)indicatorHidden
{
    _indicatorHidden = indicatorHidden;
    _indicator.hidden = indicatorHidden;
}
-(void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
    _indicator.backgroundColor = indicatorColor;
}
-(void)setIndicatorImage:(UIImage *)indicatorImage
{
    _indicatorImage = indicatorImage;
    [_indicator setImage:indicatorImage forState:UIControlStateNormal];
    [_indicator sizeToFit];
    _indicator.frame = CGRectMake(0,CGRectGetMaxY(_titlesViews.frame)-_indicator.mjc_height,0,_indicator.mjc_height);
}
-(void)tabItemTitlezoomBigEnabled:(BOOL)zoomBigEnabled tabItemTitleMaxfont:(CGFloat)tabItemTitleMaxfont
{
    _zoomBigEnabled = zoomBigEnabled;
    _tabItemTitleMaxfont = tabItemTitleMaxfont;
}
-(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController
{
    _titlesItemArr = titlesArray;
    _mainViewController = hostController;
    _childScrollView.contentSize = CGSizeMake(titlesArray.count * self.frame.size.width,0);
    [self layoutIfNeeded];
    [self setNeedsLayout];
    [_titlesViews reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        _isLoadDefaultChildVC = YES;
        [_titlesViews selectItemAtIndexPath:[NSIndexPath indexPathForItem:_defaultItemNumber inSection:0] animated:YES scrollPosition:(UICollectionViewScrollPositionNone)];
        [self collectionView:_titlesViews didSelectItemAtIndexPath:[NSIndexPath indexPathForItem:_defaultItemNumber inSection:0]];
    });
}
-(void)intoChildControllerArray:(NSArray *)childControllerArray
{
    _childControllerArray = childControllerArray;
    if (childControllerArray.count == 0) return;
    if (_mainViewController.childViewControllers.count == 0) {
        for (int i = 0; i < childControllerArray.count; i++) {
            [_mainViewController addChildViewController:childControllerArray[i]];
        }
        [self addChildVcView];
    }
}

@end
