//
//  MJCDemoVC4.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC4.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC4 ()<MJCSegmentDelegate>

@end

@implementation MJCDemoVC4

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
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    
    //以下是我的控件中的代码
    MJCSegmentInterface *lala = [[MJCSegmentInterface alloc]init];
    lala.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    lala.itemTextNormalColor = [UIColor redColor];
    lala.itemTextSelectedColor = [UIColor purpleColor];
    lala.isIndicatorFollow = YES;
    lala.indicatorHidden = NO;
    lala.indicatorStyles = MJCIndicatorItemTextStyle;
    lala.selectedSegmentIndex = 3;
    lala.defaultShowItemCount = 5;
    lala.itemBackColor = [UIColor orangeColor];
    lala.isFontGradient = YES;
//    lala.itemTextFontSize = 17;
    [lala tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:22];
    [lala intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:lala];
    [lala intoChildControllerArray:vcarrr];;
    
}


@end
