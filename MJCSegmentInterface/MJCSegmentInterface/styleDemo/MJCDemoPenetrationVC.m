//
//  MJCDemoPenetrationVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoPenetrationVC.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoPenetrationVC ()

@end

@implementation MJCDemoPenetrationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    vc1.titlesCount = 1;
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    vc2.titlesCount = 2;
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    vc3.titlesCount = 3;
    MJCTestViewController *vc4 = [[MJCTestViewController alloc]init];
    vc4.titlesCount = 4;
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    vc5.titlesCount = 5;
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    vc6.titlesCount = 6;
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    vc7.titlesCount = 7;
    NSArray *vcarrr = @[vc2,vc1,vc3,vc4,vc5,vc6,vc7];
    NSArray *titlesArr = @[@"天涯明月刀",@"联盟",@"我的运单",@"CF",@"飞车"];
    
    
    //以下是我的控件中的代码
    MJCSegmentInterface *lala =  [MJCSegmentInterface showInterfaceWithTitleBarStyles:MJCTitlesScrollStyle frame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64)];
    lala.titleBarStyles = MJCTitlesClassicStyle;
    lala.isPenetrationEffect = YES;
    lala.titlesViewBackColor =  [[UIColor blueColor]colorWithAlphaComponent:0.3];
    lala.itemBackColor =  [UIColor clearColor];
    lala.itemTextNormalColor = [UIColor redColor];
    lala.itemTextSelectedColor = [UIColor purpleColor];
    lala.itemTextFontSize = 11;
    lala.indicatorStyles = MJCIndicatorItemTextStyle;
    [lala intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:lala];
    [lala intoChildControllerArray:vcarrr];;

    
    
}


@end
