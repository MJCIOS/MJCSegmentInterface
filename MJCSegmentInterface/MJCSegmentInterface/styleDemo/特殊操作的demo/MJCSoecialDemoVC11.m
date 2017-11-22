//
//  MJCSoecialDemoVC11.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/9/29.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC11.h"
#import "MJCSegmentInterface.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC11 ()<MJCSegmentDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLayout;
@property (weak, nonatomic) IBOutlet MJCSegmentInterface *interFace;

@end

@implementation MJCSoecialDemoVC11

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    vc2.heightLayout = _heightLayout;
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc7 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc8 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc2,vc1,vc3,vc4,vc5,vc6,vc7,vc8];
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"诛仙世界",@"飞车",@"炫舞",@"天涯"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithSegmentStylestoolsBlock:^(MJCSegmentStylesTools *jc_tools)
                                      {
                                          jc_tools.
                                          jc_titleBarStyles(MJCTitlesScrollStyle).
                                          jc_titlesViewFrame(CGRectMake(0,0,MJCScreenWidth,50)).
                                          jc_itemSelectedSegmentIndex(0).
                                          jc_ItemDefaultShowCount(3).
                                          jc_itemTextNormalColor([UIColor redColor]).
                                          jc_itemTextSelectedColor([UIColor purpleColor]).
                                          jc_titlesViewBackColor([UIColor blueColor]).
                                          jc_itemBackColor([UIColor whiteColor]);
                                      }];
    _interFace.jc_stylesTools = tools;
//    _interFace.delegate = self;
    [_interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
}


//-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
//{
//    _heightLayout.constant = 180;
//}

@end
