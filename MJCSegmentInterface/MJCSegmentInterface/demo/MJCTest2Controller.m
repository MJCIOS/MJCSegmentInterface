//
//  MJCTest2Controller.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/1/9.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCTest2Controller.h"
#import "MJCSegmentInterface.h"
#import "MJCPrefixHeader.pch"

@interface MJCTest2Controller ()<MJCSlideSwitchViewDelegate>

@property (weak, nonatomic) IBOutlet MJCSegmentInterface *segmentFace;

@end

@implementation MJCTest2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
        
//    [MJCSegmentInterface useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];

    //添加标题栏
    NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪"];
    
    _segmentFace.MJCSeMentTitleBarStyle = MJCSegMentTitlesScrollStyle;
    
    _segmentFace.childScollEnabled = YES;
    _segmentFace.slideDelegate = self;
    _segmentFace.indicatorHidden = NO;
    _segmentFace.topViewHidden = YES;
    _segmentFace.topViewColor = [UIColor redColor];
    _segmentFace.bottomViewColor = [UIColor blackColor];
    _segmentFace.bottomViewHidden=YES;
    _segmentFace.tabItemBackColor = [UIColor redColor];
    _segmentFace.titlesViewColor = [[UIColor blueColor]colorWithAlphaComponent:0.3];
    
    //在添加标题栏之前做其他属性操作
    [_segmentFace intoTitlesArray:titlesArr];
    
    //添加控制器
    UITestViewController *vc = [[UITestViewController alloc]init];
    [_segmentFace intoChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [_segmentFace intoChildViewController:vc1];
    
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    [_segmentFace intoChildViewController:vc2];
    
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;//传输数据
    [_segmentFace intoChildViewController:vc3];
    
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    [_segmentFace intoChildViewController:vc4];
    
}


@end
