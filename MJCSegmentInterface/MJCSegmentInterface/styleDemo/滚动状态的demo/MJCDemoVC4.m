//
//  MJCDemoVC10.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC4.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC4 ()<MJCSegmentDelegate>

@end

@implementation MJCDemoVC4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    [self setupBasicUIWithTitlesArr:titlesArr vcArr:vcarrr];
}

-(void)setupBasicUIWithTitlesArr:(NSArray*)titlesArr vcArr:(NSArray*)vcArr
{
    //以下是我的控件中的代码
    MJCSegmentInterface *lala = [MJCSegmentInterface showInterfaceWithTitleBarFrame: CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle];
    lala.delegate= self;
    lala.titlesViewBackColor = [UIColor redColor];
    lala.itemBackColor = [UIColor purpleColor];
    lala.ItemWidthStyles = MJCItemAdaptiveWidthStyle;
//    [lala tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:20];
    lala.itemMaxEdgeinsets = MJCEdgeInsetsMake(10,10,10,10,20);
    lala.itemTextSelectedColor = [UIColor blackColor];
    lala.itemTextNormalColor = [UIColor redColor];
    lala.itemTextFontSize = 13;
    lala.defaultShowItemCount = 5;
    lala.childsContainerBackColor = [UIColor purpleColor];
//    lala.selectedSegmentIndex = 2;
    [lala intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:lala];
    [lala intoChildControllerArray:vcArr];
    
}

-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%@",tabItem);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}




@end
