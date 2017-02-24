//
//  MJCTest2Controller.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/1/9.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoController9.h"
#import "MJCSegmentInterface.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoController9 ()<MJCSlideSwitchViewDelegate>

@property (weak, nonatomic) IBOutlet MJCSegmentInterface *segmentInterface;

@end

@implementation MJCDemoController9

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    
    //    [MJCSegmentInterface useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];
    
    //添加标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪啪啪",@"啪啪",@"啪啪"];
    
    _segmentInterface.MJCIndicatorStyle = MJCIndicatorItemStyle;
    _segmentInterface.childViewScollAnimal = YES;
    _segmentInterface.titlesScrollEnabled = NO;
    _segmentInterface.childScollEnabled = YES;
    _segmentInterface.slideDelegate = self;
    _segmentInterface.indicatorHidden = NO;
    _segmentInterface.topViewHidden = YES;
    _segmentInterface.topViewColor = [UIColor redColor];
    _segmentInterface.bottomViewColor = [UIColor blackColor];
    _segmentInterface.bottomViewHidden=YES;
    //    _segmentInterface.tabItemTitlesfont = [UIFont systemFontOfSize:10];
//    _segmentInterface.tabItemBackColor = [[UIColor redColor]colorWithAlphaComponent:0.3];
    _segmentInterface.indicatorColor = [UIColor redColor];
    _segmentInterface.titleViewColor = [[UIColor redColor]colorWithAlphaComponent:0.3];
    
    _segmentInterface.zoomBigEnabled = YES;
    _segmentInterface.followScrollEnabled = NO;
    

    
    _segmentInterface.tabItemTitleMaxfont = 30;
    _segmentInterface.tabItemTitleMinfont = 20;
    
    //在添加标题栏之前做其他属性操作
    [_segmentInterface intoTitlesArray:titlesArr];
    
    //添加控制器
    UITestViewController *vc = [[UITestViewController alloc]init];
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;//传输数据
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    
    
    NSArray *childArr = @[vc,vc1,vc2,vc3,vc4];
    
    [_segmentInterface intoChildControllerArray:childArr hostMainController:self];
    
//    _segmentInterface.selectedSegmentIndex = 3;
    
}


@end
