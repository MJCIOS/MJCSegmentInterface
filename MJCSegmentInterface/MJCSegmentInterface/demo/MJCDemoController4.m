//
//  SegMentInterfaceStyleExceedUse.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/27.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "MJCDemoController4.h"
#import "MJCPrefixHeader.pch"


@interface MJCDemoController4 ()

@end

@implementation MJCDemoController4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    
    [MJCSegmentInterface useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];
    
    NSArray *titlesArr = @[@"我爱你一辈子",@"你爱我怕啪啪"];//创建标题栏
    //创建标题栏控件
    MJCSegmentInterface  *segmentInterface = [[MJCSegmentInterface alloc]init];
    segmentInterface.MJCSeMentTitleBarStyle = MJCSegMentTitlesClassicStyle;
    
    segmentInterface.indicatorHidden = NO;
    segmentInterface.titleViewColor = [UIColor redColor];
//    segmentInterface.tabItemBackColor = [UIColor redColor];
    segmentInterface.childScollEnabled = YES;
    segmentInterface.childViewScollAnimal = YES;
//    segmentInterface.verticalLineHidden = YES;
    segmentInterface.tabItemTitlesfont = [UIFont systemFontOfSize:14];
    //在添加标题栏之前做其他属性操作
    [segmentInterface intoTitlesArray:titlesArr];//添加标题栏
    [self.view addSubview:segmentInterface];
    
    /**
     * 添加控制器
     */
    UITestViewController *vc = [[UITestViewController alloc]init];
    [segmentInterface intoChildViewController:vc];
    
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    [segmentInterface intoChildViewController:vc1];
    
}



@end
