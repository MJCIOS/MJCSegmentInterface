//
//  MJCTestDemo100.m
//  MJCSegmentInterface
//
//  Created by mjc on 2022/3/14.
//  Copyright © 2022 MJC. All rights reserved.
//

#import "MJCTestDemo100.h"
#import "MJCSegmentInterface.h"
#import "MJCTestTableViewController.h"
#import "UIView+MJCClassExtension.h"

//屏幕尺寸
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenBounds [UIScreen mainScreen].bounds

//16进制颜色值
#define HexColor(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

@interface MJCTestDemo100 ()<MJCSegmentDelegate>

@property (nonatomic,strong) MJCSegmentInterface *segmentInterface;

/** <#  注释  #> */
@property (nonatomic,strong) UIView *mainVCHeaderView;

@end

@implementation MJCTestDemo100

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainVCHeaderView];
    [self setupInterface];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.mainVCHeaderView.jc_height = 170+105+45;
        self.segmentInterface.jc_y = CGRectGetMaxY(_mainVCHeaderView.frame);
        self.segmentInterface.jc_height = ScreenHeight-CGRectGetMaxY(_mainVCHeaderView.frame);
    });
    
}




-(UIView *)mainVCHeaderView
{
    if (!_mainVCHeaderView) {
        _mainVCHeaderView = [[UIView alloc]init];
        _mainVCHeaderView.frame = CGRectMake(0,0,ScreenWidth,(170+45));
        _mainVCHeaderView.backgroundColor = [UIColor whiteColor];
    }
    return _mainVCHeaderView;
}

-(void)setupInterface
{
    
    UIViewController *vc1 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor redColor];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    vc2.view.backgroundColor = [UIColor orangeColor];
    UIViewController *vc3 = [[UIViewController alloc]init];
    vc3.view.backgroundColor = [UIColor blueColor];
    UIViewController *vc4 = [[UIViewController alloc]init];
    vc4.view.backgroundColor = [UIColor yellowColor];
    
    NSArray *controllerArray = @[vc1,vc2,vc3,vc4];
    NSArray *titleArr = @[@"燃油类型",@"价格优先",@"距离优先",@"线路规划"];
    _segmentInterface = [MJCSegmentInterface  jc_initWithFrame:CGRectMake(0,CGRectGetMaxY(_mainVCHeaderView.frame),ScreenWidth, ScreenHeight-CGRectGetMaxY(_mainVCHeaderView.frame)) titlesArray:titleArr childControllerArray:controllerArray interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titlesViewFrame(CGRectMake(0, 0, ScreenWidth,42));
        jc_tools.jc_itemTextFontSize(15);
        jc_tools.jc_itemSelectedSegmentIndex(1);
        jc_tools.jc_itemTextBoldFontSizeSelected(15);
        jc_tools.jc_childScollEnabled(YES);
        jc_tools.jc_indicatorsAnimalsEnabled(YES);
        jc_tools.jc_itemTextNormalColor(HexColor(0x333333));
        jc_tools.jc_titlesViewBackColor([UIColor whiteColor]);
        jc_tools.jc_indicatorColor(HexColor(0x5086FC));
        jc_tools.jc_itemTextSelectedColor(HexColor(0x333333));
        jc_tools.jc_indicatorFollowEnabled(YES);
        jc_tools.jc_indicatorStyles(MJCIndicatorEqualTextEffect);
        jc_tools.jc_indicatorFrame(CGRectMake(0, 39, 0, 3));
    } hostController:self];
    [self.view addSubview:_segmentInterface];
    _segmentInterface.delegate = self;
    
}


- (void)mjc_tabitemDataWithTabitemArray:(NSArray<UIButton*>*)tabItemArray childsVCAarray:(NSArray<UIViewController*>*)childsVCAarray segmentInterface:(MJCSegmentInterface *)segmentInterface;
{
    
    
    
}


@end
