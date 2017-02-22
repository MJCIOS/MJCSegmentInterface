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
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    
    _segmentInterface.titlesScrollEnabled = NO;
    _segmentInterface.childScollEnabled = YES;
    _segmentInterface.slideDelegate = self;
    _segmentInterface.indicatorHidden = NO;
    _segmentInterface.topViewHidden = YES;
    _segmentInterface.topViewColor = [UIColor redColor];
    _segmentInterface.bottomViewColor = [UIColor blackColor];
    _segmentInterface.bottomViewHidden=YES;
    _segmentInterface.tabItemBackColor = [UIColor redColor];
    
    //在添加标题栏之前做其他属性操作
    [_segmentInterface intoTitlesArray:titlesArr];
    
    //添加控制器
    UITestViewController *vc = [[UITestViewController alloc]init];
    [_segmentInterface intoChildViewController:vc hostMainController:self];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [_segmentInterface intoChildViewController:vc1 hostMainController:self];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [_segmentInterface intoChildViewController:vc2 hostMainController:self];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;//传输数据
    [_segmentInterface intoChildViewController:vc3 hostMainController:self];
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [_segmentInterface intoChildViewController:vc4 hostMainController:self];

}


@end
