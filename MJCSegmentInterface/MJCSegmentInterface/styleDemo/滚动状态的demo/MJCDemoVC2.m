//
//  MJCDemoVC4.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC2.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC2 ()

@end

@implementation MJCDemoVC2

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
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    NSArray *colorArr = @[[UIColor redColor],[UIColor blackColor],[UIColor purpleColor],[UIColor lightGrayColor],[UIColor orangeColor]];
    NSArray *colorArr1 = @[[UIColor blackColor],[UIColor redColor],[UIColor lightGrayColor],[UIColor purpleColor],[UIColor yellowColor]];
    
    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_indicatorFollowEnabled(YES).
        jc_indicatorHidden(NO).
        jc_itemSelectedSegmentIndex(2).
        jc_itemTextColorArrayNormal(colorArr).
        jc_itemTextColorArraySelected(colorArr1).
        jc_titlesViewBackColor([UIColor whiteColor]).
        jc_indicatorColor( [UIColor redColor]).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor whiteColor]).
        jc_itemTextFontSize(11).
        jc_tabItemTextZoomBigEnabled(YES, 18).
        jc_indicatorColorEqualTextColorEnabled(YES);
    }];

    
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace = [MJCSegmentInterface initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleTools:tools];
    
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
}


-(void)mjc_tabitemDataWithTabitemArray:(NSArray<UIButton *> *)tabItemArray childsVCAarray:(NSArray<UIViewController *> *)childsVCAarray segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    for (int i = 0 ; i < tabItemArray.count; i++) {
        UIButton *item = tabItemArray[i];
        UIView *view1 = [[UIView alloc]init];
        view1.backgroundColor = [UIColor blackColor];
        [item addSubview:view1];
        view1.frame = CGRectMake(item.titleLabel.jc_width, item.titleLabel.jc_y,10 ,10);
    }
    
    NSLog(@"%@",tabItemArray);
    NSLog(@"%@",childsVCAarray);
    
}


@end
