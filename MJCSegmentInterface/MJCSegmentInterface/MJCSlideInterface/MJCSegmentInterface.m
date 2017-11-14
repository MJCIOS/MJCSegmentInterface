//https://github.com/MJCIOS/MJCSegmentInterface
//如果觉得好,麻烦点个星,谢谢大家支持,有啥问题加我QQ: 292251588 一起交流,我是菜菜..求大神指教
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
    if (!_titlesView) {
        _titlesView = [[MJCTitlesView alloc]init];
        _titlesView.frame = CGRectMake(0,0,0,defaultTitlesViewH);

        [_titlesView tabitemArrBlock:^(NSArray<MJCTabItem *> *tabItemArr) {
            if ([self.delegate respondsToSelector:@selector(mjc_tabitemDataWithTabitemArray:childsVCAarray:segmentInterface:)]) {
                [self.delegate mjc_tabitemDataWithTabitemArray:tabItemArr childsVCAarray:_hostController.childViewControllers segmentInterface:self];
            }
        }];
        
        [_titlesView scrollDidEndBlock:^(MJCTabItem *tabItem) {
            _childMainView.titlesTabItem = tabItem;
            [_childMainView addChildVcView];
            if ([self.delegate respondsToSelector:@selector(mjc_scrollDidEndDeceleratingWithItem:childsController:indexPage:segmentInterface:)]) {
                if ( tabItem.tag >=_hostController.childViewControllers.count) {
                    [self.delegate mjc_scrollDidEndDeceleratingWithItem:tabItem childsController:nil indexPage:tabItem.tag segmentInterface:self];
                }else{
                    [self.delegate mjc_scrollDidEndDeceleratingWithItem:tabItem childsController:_hostController.childViewControllers[tabItem.tag] indexPage:tabItem.tag segmentInterface:self];
                }
            }
        }];
        [_titlesView tableItemClickBlock:^(MJCTabItem *tabItem) {
            _childMainView.titlesTabItem = tabItem;
            [_childMainView addChildVcView];
            if ([self.delegate respondsToSelector:@selector(mjc_ClickEventWithItem:childsController:segmentInterface:)]) {
                if ( tabItem.tag >=_hostController.childViewControllers.count) {
                    [self.delegate mjc_ClickEventWithItem:tabItem childsController:nil segmentInterface:self];
                }else{
                    [self.delegate mjc_ClickEventWithItem:tabItem childsController:_hostController.childViewControllers[tabItem.tag] segmentInterface:self];
                }
            }
        }];
        [_titlesView tableItemClickCancelBlock:^(MJCTabItem *tabItem) {
            if ([self.delegate respondsToSelector:@selector(mjc_cancelClickEventWithItem:childsController:segmentInterface:)]) {
                if ( tabItem.tag >=_hostController.childViewControllers.count) {
                    [self.delegate mjc_cancelClickEventWithItem:tabItem childsController:nil segmentInterface:self];
                }else{
                    [self.delegate mjc_cancelClickEventWithItem:tabItem childsController:_hostController.childViewControllers[tabItem.tag] segmentInterface:self];
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

+(instancetype)initWithFrame:(CGRect)frame interFaceStyleTools:(MJCSegmentStylesTools *)tools
{
    MJCSegmentInterface *interface = [[self alloc]initWithFrame:frame];
    interface.tools = tools;
    return interface;
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
    _childMainView.hostController = hostController;
    _titlesView.hostController = hostController;
    [self layoutIfNeeded];
    [self setNeedsLayout];
    [_childMainView setupContenSizeWithTitlesArr:titlesArray mainView:self];
    _titlesView.titlesArray = titlesArray;
    _isLoadDefaultChildVC = YES;
    _titlesView.selectedSegmentIndex = _selectedSegmentIndex;
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
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_titlesView jc_scrollViewDidScroll:scrollView isIndicatorFollow:_tools.indicatorFollowEnabled];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    [_titlesView jc_scrollViewDidEndDragging:scrollView itemTextNormalColor:_tools.itemTextNormalColor];
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [_titlesView jc_scrollViewWillEndDragging:scrollView itemTextNormalColor:_tools.itemTextNormalColor];
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


-(void)setTools:(MJCSegmentStylesTools *)tools
{
    _tools = tools;
    _isPenetrationEffect = tools.titlesViewPenetrationEnabled;
    
    if (tools.titlesViewFrame.size.height == 0 && tools.titlesViewFrame.size.width == 0) {
        _titlesView.frame = CGRectMake(0, 0, self.frame.size.width, defaultTitlesViewH);
    }else{
        _titlesView.frame = tools.titlesViewFrame;
    }
    
    _titlesView.backgroundColor = tools.titlesViewBackColor;
    _childMainView.backgroundColor = tools.childsContainerBackColor;
    _titlesView.titlesBarStyles = tools.titleBarStyles;
    _titlesView.backgroudImage = tools.titlesViewBackImage;
    _titlesView.scaleLayoutEnabled = tools.scaleLayoutEnabled;
    _childMainView.isChildScollEnabled = tools.childScollEnabled;
    _childMainView.isChildScollAnimal = tools.childScollAnimalEnabled;
    
    
    [_titlesView tabItemTitlezoomBigEnabled:tools.itemTextZoomBigEnabled tabItemTitleMaxfont:tools.itemTextMaxfontSize];
    [_titlesView tabItemSizeToFitIsEnabled:tools.itemSizeToFitIsEnabled itemHeightToFitIsEnabled:tools.itemHeightToFitIsEnabled itemWidthToFitIsEnabled:tools.itemWidthToFitIsEnabled];
    _titlesView.ItemEdgeinsets = UIEdgeInsetsMake(tools.itemEdgeinsets.maxTop, tools.itemEdgeinsets.maxLeft, tools.itemEdgeinsets.maxBottom, tools.itemEdgeinsets.maxRight);
    _titlesView.lineMargin = tools.itemEdgeinsets.lineMargin;
    _titlesView.isIndicatorColorEqualTextColor = tools.indicatorColorEqualTextColorEnabled;
    _titlesView.isFontGradient = tools.itemTextGradientEnabled;
    _titlesView.isItemTitleTextHidden = tools.itemTextHidden;
    _titlesView.selectedSegmentIndex = tools.itemSelectedSegmentIndex;
    _titlesView.defaultShowItemCount = tools.ItemDefaultShowCount;
    _titlesView.itemImagesEdgeInsets = tools.itemImagesEdgeInsets;
    _titlesView.itemTextsEdgeInsets = tools.itemTextsEdgeInsets;
    _titlesView.imageEffectStyles = tools.itemImageEffectStyles;
    _titlesView.itemBackColor = tools.itemBackColor;
    _titlesView.itemTextFontSize = tools.itemTextFontSize;
    _titlesView.itemTextNormalColor = tools.itemTextNormalColor;
    _titlesView.itemTextSelectedColor = tools.itemTextSelectedColor;
    _titlesView.itemImageNormal = tools.itemImageNormal;
    _titlesView.itemImageSelected = tools.itemImageSelected;
    _titlesView.itemImageNormalArray = tools.itemImageArrayNormal;
    _titlesView.itemImageSelectedArray = tools.itemImageArraySelected;
    _titlesView.itemBackNormalImage = tools.itemBackImageNormal;
    _titlesView.itemBackSelectedImage = tools.itemBackImageSelected;
    _titlesView.itemNormalBackImageArray = tools.itemBackImageArrayNormal;
    _titlesView.itemSelectedBackImageArray = tools.itemBackImageArraySelected;
    _titlesView.itemImageSize = tools.itemImageSize;
    _titlesView.itemTitleNormalColorArray = tools.itemTextColorArrayNormal;
    _titlesView.itemTitleSelectedColorArray = tools.itemTextColorArraySelected;
    
    _titlesView.isIndicatorsAnimals = tools.indicatorsAnimalsEnabled;
    _titlesView.isIndicatorFollow = tools.indicatorFollowEnabled;
    _titlesView.indicatorStyles = tools.indicatorStyles;
    _titlesView.indicatorHidden = tools.indicatorHidden;
    _titlesView.indicatorColor = tools.indicatorColor;
    _titlesView.indicatorImage = tools.indicatorImage;
    _titlesView.indicatorFrame = tools.indicatorFrame;
}

-(void)jc_reviseSegmentInterfaceTitleArr:(NSArray *)titlesArr childsViewControllerArr:(NSArray *)childsViewControllerArr;
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_childMainView removeFromSuperview];
    [_titlesView removeFromSuperview];
    _childMainView = nil;
    _titlesView = nil;
    [self setupBasicUI];
    [self setTools:_tools];
    [self intoTitlesArray:titlesArr intoChildControllerArray:childsViewControllerArr hostController:_hostController];
}



@end
