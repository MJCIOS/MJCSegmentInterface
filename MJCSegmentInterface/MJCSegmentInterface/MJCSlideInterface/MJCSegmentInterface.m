// https://github.com/MJCIOS/MJCSegmentInterface
// 如果觉得好,麻烦点个星,谢谢大家支持,有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教
//  MJCSegmentInterface.m
//  MJCSegmentInterface
//
//  Created by mjc on 16/10/7.
//  Copyright © 2016年 MJC. All rights reserved.

#import "MJCSegmentInterface.h"
#import "MJCChildMainView.h"
#import "MJCTitlesView.h"
#import "MJCTabItem.h"
#import "sys/utsname.h"
#import "UIView+MJCClassExtension.h"

static CGFloat const defaultTitlesViewH = 50;

@interface MJCSegmentInterface ()<UIScrollViewDelegate>
@property (nonatomic, strong) MJCChildMainView *childMainView;
@property (nonatomic, strong) MJCTitlesView *titlesView;
@property (nonatomic,strong) NSArray *titlesArray;
@property (nonatomic,weak) UIViewController *hostController;
@property (nonatomic,weak) NSArray *childControllerArray;
@property (nonatomic,assign) BOOL isXibLayoutSetup;
@property (nonatomic,assign) BOOL isLoadDefaultChildVC;
/** 是否有穿透效果 */
@property (nonatomic,assign) BOOL isPenetrationEffect;
@end

@implementation MJCSegmentInterface

- (MJCChildMainView*)childMainView
{
    if (!_childMainView) {
        _childMainView = [[MJCChildMainView alloc]init];
        _childMainView.delegate = self;
    }
    return _childMainView;
}
- (MJCTitlesView*)titlesView
{
    MJCWeakSelf;
    
    if (!_titlesView) {
        _titlesView = [[MJCTitlesView alloc]init];
        _titlesView.frame = CGRectMake(0,0,0,defaultTitlesViewH);

        [_titlesView tabitemArrBlock:^(NSArray<MJCTabItem *> *tabItemArr) {
            if ([weakSelf.delegate respondsToSelector:@selector(mjc_tabitemDataWithTabitemArray:childsVCAarray:segmentInterface:)]) {
                [weakSelf.delegate mjc_tabitemDataWithTabitemArray:tabItemArr childsVCAarray:weakSelf.hostController.childViewControllers segmentInterface:weakSelf];
            }
        }];
        
        [_titlesView scrollDidEndBlock:^(MJCTabItem *tabItem) {
            weakSelf.childMainView.titlesTabItem = tabItem;
            [weakSelf.childMainView addChildVcView];
            if ([weakSelf.delegate respondsToSelector:@selector(mjc_scrollDidEndDeceleratingWithItem:childsController:indexPage:segmentInterface:)]) {
                if ( tabItem.tag >=weakSelf.hostController.childViewControllers.count) {
                    [weakSelf.delegate mjc_scrollDidEndDeceleratingWithItem:tabItem childsController:nil indexPage:tabItem.tag segmentInterface:weakSelf];
                }else{
                    [weakSelf.delegate mjc_scrollDidEndDeceleratingWithItem:tabItem childsController:weakSelf.hostController.childViewControllers[tabItem.tag] indexPage:tabItem.tag segmentInterface:weakSelf];
                }
            }
        }];
        [_titlesView tableItemClickBlock:^(MJCTabItem *tabItem) {
            weakSelf.childMainView.titlesTabItem = tabItem;
            [weakSelf.childMainView addChildVcView];
            if ([weakSelf.delegate respondsToSelector:@selector(mjc_ClickEventWithItem:childsController:segmentInterface:)]) {
                if ( tabItem.tag >=weakSelf.hostController.childViewControllers.count) {
                    [weakSelf.delegate mjc_ClickEventWithItem:tabItem childsController:nil segmentInterface:weakSelf];
                }else{
                    [weakSelf.delegate mjc_ClickEventWithItem:tabItem childsController:weakSelf.hostController.childViewControllers[tabItem.tag] segmentInterface:weakSelf];
                }
            }
        }];
        [_titlesView tableItemClickCancelBlock:^(MJCTabItem *tabItem) {
            if ([weakSelf.delegate respondsToSelector:@selector(mjc_cancelClickEventWithItem:childsController:segmentInterface:)]) {
                if ( tabItem.tag >=weakSelf.hostController.childViewControllers.count) {
                    [weakSelf.delegate mjc_cancelClickEventWithItem:tabItem childsController:nil segmentInterface:weakSelf];
                }else{
                    [weakSelf.delegate mjc_cancelClickEventWithItem:tabItem childsController:weakSelf.hostController.childViewControllers[tabItem.tag] segmentInterface:weakSelf];
                }
            }
        }];
    }
    return _titlesView;
}

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

-(void)setupBasicUI
{
    [self addSubview:self.childMainView];
    [self addSubview:self.titlesView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_titlesView.frame.size.width == 0 || _titlesView.frame.size.height == 0) {
        _titlesView.jc_width = self.jc_width;
        _titlesView.jc_height = defaultTitlesViewH;
    }
    
    if (_isPenetrationEffect) {
        _childMainView.frame =CGRectMake(0,0,self.jc_width,self.jc_height);
    }else{
        CGFloat titlesViewMaxY = CGRectGetMaxY(_titlesView.frame);
        _childMainView.frame =CGRectMake(0,titlesViewMaxY,self.jc_width,self.jc_height-titlesViewMaxY);
    }
    
    [_childMainView setupChildViewHeightisLoadDefaultChildVC:_isLoadDefaultChildVC];
}

+(instancetype)initWithFrame:(CGRect)frame interFaceStyletools:(MJCSegmentStylesTools *)tools;
{
    MJCSegmentInterface *interface = [[self alloc]initWithFrame:frame];
    interface.jc_stylesTools = tools;
    return interface;
}
-(void)intoTitlesArray:(NSArray *)titlesArray intoChildViewArray:(NSArray *)childViewArray hostController:(UIViewController *)hostController;
{
    hostController.automaticallyAdjustsScrollViewInsets = NO;
    
    _titlesArray = titlesArray;
    _hostController = hostController;
    _childMainView.hostController = hostController;
    _titlesView.hostController = hostController;
    [self layoutIfNeeded];
    [self setNeedsLayout];
    [_childMainView setupContenSizeWithTitlesArr:titlesArray mainView:self];
    _childMainView.childViewArray =  [NSMutableArray arrayWithArray:childViewArray] ;
    _titlesView.titlesArray = titlesArray;
    _isLoadDefaultChildVC = YES;
}
-(void)intoChildControllerArray:(NSArray*)childControllerArray;
{
    _childControllerArray = childControllerArray;
    _childMainView.childControllerArray = childControllerArray;
}
-(void)intoTitlesArray:(NSArray*)titlesArray hostController:(UIViewController*)hostController;
{
    hostController.automaticallyAdjustsScrollViewInsets = NO;
    _titlesArray = titlesArray;
    _hostController = hostController;
    if (_titlesView.subviews.count == 1) {
        _childMainView.hostController = hostController;
        _titlesView.hostController = hostController;
        [self layoutIfNeeded];
        [self setNeedsLayout];
        [_childMainView setupContenSizeWithTitlesArr:titlesArray mainView:self];
        _titlesView.titlesArray = titlesArray;
        _isLoadDefaultChildVC = YES;
        //    _titlesView.selectedSegmentIndex = _selectedSegmentIndex;
    }
}

-(void)intoTitlesArray:(NSArray *)titlesArray intoChildControllerArray:(NSArray *)childControllerArray hostController:(UIViewController *)hostController;
{
    hostController.automaticallyAdjustsScrollViewInsets = NO;
    _childControllerArray = childControllerArray;
    _titlesArray = titlesArray;
    _hostController = hostController;
    
    _childMainView.hostController = hostController;
    _titlesView.hostController = hostController;
    [self layoutIfNeeded];
    [self setNeedsLayout];
    [_childMainView setupContenSizeWithTitlesArr:titlesArray mainView:self];
    _childMainView.childControllerArray = childControllerArray;
    _titlesView.titlesArray = titlesArray;
    _isLoadDefaultChildVC = YES;
    
    if (_jc_stylesTools.loadAllChildViewEnabled) {
        [_childMainView addAllChildVcView];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_titlesView jc_scrollViewDidScroll:scrollView isIndicatorFollow:_jc_stylesTools.indicatorFollowEnabled];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    [_titlesView jc_scrollViewDidEndDragging:scrollView itemTextNormalColor:_jc_stylesTools.itemTextNormalColor];
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [_titlesView jc_scrollViewWillEndDragging:scrollView itemTextNormalColor:_jc_stylesTools.itemTextNormalColor];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [_titlesView jc_scrollViewDidEndDecelerating:scrollView];
}

-(void)setSelectedSegmentIndex:(NSInteger)selectedSegmentIndex
{
    _selectedSegmentIndex = selectedSegmentIndex;
    _titlesView.selectedSegmentIndex = selectedSegmentIndex;
}

-(void)setJc_stylesTools:(MJCSegmentStylesTools *)jc_stylesTools
{
    _jc_stylesTools = jc_stylesTools;
    _isPenetrationEffect = jc_stylesTools.titlesViewPenetrationEnabled;
    
    
    if (jc_stylesTools.titlesViewFrame.size.height == 0 && jc_stylesTools.titlesViewFrame.size.width == 0) {
        _titlesView.frame = CGRectMake(0, 0, self.frame.size.width, defaultTitlesViewH);
    }else{
        _titlesView.frame = jc_stylesTools.titlesViewFrame;
    }
    _childMainView.bouncesEnabled = jc_stylesTools.childScollBouncesEnabled;
    _childMainView.customChildBackView = jc_stylesTools.customChildBackView;
    _titlesView.backgroundColor = jc_stylesTools.titlesViewBackColor;
    _childMainView.backgroundColor = jc_stylesTools.childsContainerBackColor;
    _titlesView.titlesBarStyles = jc_stylesTools.titleBarStyles;
    _titlesView.backgroudImage = jc_stylesTools.titlesViewBackImage;
    _titlesView.scaleLayoutEnabled = jc_stylesTools.scaleLayoutEnabled;
    _childMainView.isChildScollEnabled = jc_stylesTools.childScollEnabled;
    _childMainView.isChildScollAnimal = jc_stylesTools.childScollAnimalEnabled;
    
    _titlesView.tabItemExcessSize = CGSizeMake(jc_stylesTools.itemExcessWidth, jc_stylesTools.itemExcessHeight);
    [_titlesView tabItemTitlezoomBigEnabled:jc_stylesTools.itemTextZoomBigEnabled tabItemTitleMaxfont:jc_stylesTools.itemTextMaxfontSize];
    [_titlesView tabItemSizeToFitIsEnabled:jc_stylesTools.itemSizeToFitIsEnabled itemHeightToFitIsEnabled:jc_stylesTools.itemHeightToFitIsEnabled itemWidthToFitIsEnabled:jc_stylesTools.itemWidthToFitIsEnabled];
    _titlesView.ItemEdgeinsets = UIEdgeInsetsMake(jc_stylesTools.itemEdgeinsets.maxTop, jc_stylesTools.itemEdgeinsets.maxLeft, jc_stylesTools.itemEdgeinsets.maxBottom, jc_stylesTools.itemEdgeinsets.maxRight);
    _titlesView.lineMargin = jc_stylesTools.itemEdgeinsets.lineMargin;
    _titlesView.isIndicatorColorEqualTextColor = jc_stylesTools.indicatorColorEqualTextColorEnabled;
    _titlesView.isFontGradient = jc_stylesTools.itemTextGradientEnabled;
    _titlesView.isItemTitleTextHidden = jc_stylesTools.itemTextHidden;
    _titlesView.selectedSegmentIndex = jc_stylesTools.itemSelectedSegmentIndex;
    _titlesView.defaultShowItemCount = jc_stylesTools.ItemDefaultShowCount;
    _titlesView.itemImagesEdgeInsets = jc_stylesTools.itemImagesEdgeInsets;
    _titlesView.itemTextsEdgeInsets = jc_stylesTools.itemTextsEdgeInsets;
    _titlesView.imageEffectStyles = jc_stylesTools.itemImageEffectStyles;
    _titlesView.itemBackColor = jc_stylesTools.itemBackColor;
    _titlesView.itemBackColorSelected = jc_stylesTools.itemBackColorSelected;
    _titlesView.itemTextFontSize = jc_stylesTools.itemTextFontSize;
    _titlesView.itemTextNormalColor = jc_stylesTools.itemTextNormalColor;
    _titlesView.itemTextSelectedColor = jc_stylesTools.itemTextSelectedColor;
    _titlesView.itemImageNormal = jc_stylesTools.itemImageNormal;
    _titlesView.itemImageSelected = jc_stylesTools.itemImageSelected;
    _titlesView.itemImageNormalArray = jc_stylesTools.itemImageArrayNormal;
    _titlesView.itemImageSelectedArray = jc_stylesTools.itemImageArraySelected;
    _titlesView.itemBackNormalImage = jc_stylesTools.itemBackImageNormal;
    _titlesView.itemBackSelectedImage = jc_stylesTools.itemBackImageSelected;
    _titlesView.itemNormalBackImageArray = jc_stylesTools.itemBackImageArrayNormal;
    _titlesView.itemSelectedBackImageArray = jc_stylesTools.itemBackImageArraySelected;
    _titlesView.itemImageSize = jc_stylesTools.itemImageSize;
    _titlesView.itemTitleNormalColorArray = jc_stylesTools.itemTextColorArrayNormal;
    _titlesView.itemTitleSelectedColorArray = jc_stylesTools.itemTextColorArraySelected;
    _titlesView.itemTextBoldFontSize = jc_stylesTools.itemTextBoldFontSize;
    
    _titlesView.isIndicatorsAnimals = jc_stylesTools.indicatorsAnimalsEnabled;
    _titlesView.isIndicatorFollow = jc_stylesTools.indicatorFollowEnabled;
    _titlesView.indicatorStyles = jc_stylesTools.indicatorStyles;
    _titlesView.indicatorHidden = jc_stylesTools.indicatorHidden;
    _titlesView.indicatorColor = jc_stylesTools.indicatorColor;
    _titlesView.indicatorImage = jc_stylesTools.indicatorImage;
    _titlesView.indicatorFrame = jc_stylesTools.indicatorFrame;
}

-(void)jc_reviseSegmentInterfaceTitleArr:(NSArray *)titlesArr childsViewControllerArr:(NSArray *)childsViewControllerArr;
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_childMainView removeFromSuperview];
    [_titlesView removeFromSuperview];
    _childMainView = nil;
    _titlesView = nil;
    [self setupBasicUI];
    [self setJc_stylesTools:_jc_stylesTools];
    [self intoTitlesArray:titlesArr intoChildControllerArray:childsViewControllerArr hostController:_hostController];
}
-(void)jc_reviseSegmentInterfaceTitleArr:(NSArray *)titlesArr childsViewArr:(NSArray *)childsViewArr;
{
    if (childsViewArr.count == 0) return;
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_childMainView removeFromSuperview];
    [_titlesView removeFromSuperview];
    _childMainView = nil;
    _titlesView = nil;
    [self setupBasicUI];
    [self setJc_stylesTools:_jc_stylesTools];
    [self intoTitlesArray:titlesArr intoChildViewArray:childsViewArr hostController:_hostController];
}

+(instancetype)jc_initWithFrame:(CGRect)frame interFaceStyleToolsBlock:(void (^)(MJCSegmentStylesTools *))toolsBlock
{
    MJCSegmentInterface *interface = [[MJCSegmentInterface alloc]initWithFrame:frame];
    MJCSegmentStylesTools *tools = [[MJCSegmentStylesTools alloc]init];
    toolsBlock(tools);
    interface.jc_stylesTools = tools;
    return interface;
}

+(instancetype)jc_initWithFrame:(CGRect)frame titlesArray:(NSArray *)titlesArray childControllerArray:(NSArray *)childControllerArray interFaceStyleToolsBlock:(void (^)(MJCSegmentStylesTools *))toolsBlock hostController:(UIViewController *)hostController
{
    MJCSegmentInterface *interface = [[MJCSegmentInterface alloc]initWithFrame:frame];
    MJCSegmentStylesTools *tools = [[MJCSegmentStylesTools alloc]init];
    toolsBlock(tools);
    interface.jc_stylesTools = tools;
    [interface intoTitlesArray:titlesArray intoChildControllerArray:childControllerArray hostController:hostController];
    return interface;
}

@end
