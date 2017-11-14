//
//  MJCDemoVC4.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC3.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC3 ()<MJCSegmentDelegate>

@end

@implementation MJCDemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }

    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_indicatorFrame(CGRectMake(0,0,0,50)).
        jc_indicatorFollowEnabled(YES).
        jc_childScollEnabled(YES).
        jc_itemSelectedSegmentIndex(3).
        jc_indicatorColor([[UIColor blackColor]colorWithAlphaComponent:0.3]).
        jc_tabItemTextZoomBigEnabled(YES, 22).
        jc_itemTextFontSize(17).
        jc_titlesViewBackColor([UIColor redColor]).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor whiteColor]).
        jc_itemTextFontSize(11).
        jc_tabItemTextZoomBigEnabled(YES, 18).
        jc_titlesViewBackImage([UIImage imageNamed:@"back"]).
        jc_indicatorHidden(NO).
        jc_indicatorsAnimalsEnabled(YES).
        jc_ItemDefaultShowCount(5).
        jc_itemBackColor([UIColor orangeColor]).
        jc_itemTextGradientEnabled(YES);
    }];

        
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interFace.tools = tools;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}


@end
