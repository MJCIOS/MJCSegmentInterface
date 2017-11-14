//
//  MJCSpecialDemoVC3.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/13.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC3.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC3 ()<MJCSegmentDelegate>

@property (nonatomic,weak) MJCSegmentInterface *interFace;


/** <#  注释  #> */
@property (nonatomic,weak) NSArray *titlesArr;

@end

@implementation MJCSpecialDemoVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc8 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯",@"诛仙世界"];
    _titlesArr = titlesArr;
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_titlesViewFrame(CGRectMake(0,0,self.view.jc_width,60)).
        jc_indicatorStyles(MJCIndicatorItemTextStyle).
        jc_itemBackColor([UIColor whiteColor]).
        jc_titlesViewBackColor([UIColor blueColor]).
        jc_itemTextSelectedColor([UIColor purpleColor]).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextFontSize(13).
        jc_ItemDefaultShowCount(3).
        jc_childsContainerBackColor([UIColor purpleColor]).
        jc_indicatorColor([UIColor blackColor]).
        jc_indicatorHidden(NO).
        jc_indicatorsAnimalsEnabled(YES).
        jc_childScollEnabled(YES).
        jc_childScollAnimalEnabled(YES).
        jc_indicatorFollowEnabled(YES).
        jc_itemImagesEdgeInsets(UIEdgeInsetsMake(10,0,10,0)).
        jc_itemImageEffectStyles(MJCImageClassicStyle).
        jc_itemTextsEdgeInsets(UIEdgeInsetsMake(10,10,10,10)).
        jc_itemTextGradientEnabled(YES).
        jc_tabItemTextZoomBigEnabled(YES, 18);
    }];

    
    MJCSegmentInterface *interFace = [MJCSegmentInterface initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleTools:tools] ;
    _interFace = interFace;
    interFace.delegate = self;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点我有意外惊喜" forState:UIControlStateNormal];
    button.frame = CGRectMake(0,0, 0, 0);
    [button sizeToFit];
    button.jc_centerX = self.view.jc_centerX;
    button.jc_centerY = self.view.jc_centerY;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    NSLog(@"%ld",tabItem.tag);
    NSLog(@"%@",childsController);
    NSLog(@"%@",segmentInterface);
}

-(void)btnClick:(UIButton *)button
{
    if (button.tag >= _titlesArr.count -1) {
        button.tag = 0;
        _interFace.selectedSegmentIndex = button.tag;
    }else{
        button.tag += 1;
        _interFace.selectedSegmentIndex = button.tag;
    }
}


@end
