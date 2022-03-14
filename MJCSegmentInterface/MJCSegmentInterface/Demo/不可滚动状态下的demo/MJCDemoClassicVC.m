//
//  MJCDemoClassicVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoClassicVC.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoClassicVC ()

@end

@implementation MJCDemoClassicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5];
    NSArray *titlesArr = @[@"天涯明月刀",@"联盟",@"我的运单",@"CF",@"飞车"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    
    
    [self setupInterfaceWithTitlesArr:titlesArr vcArr:vcarrr];
    
}

-(void)setupInterfaceWithTitlesArr:(NSArray*)titlesArr vcArr:(NSArray*)vcArr
{
    
   MJCSegmentInterface *interFace = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0, 64, self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.
        jc_titleBarStyles(MJCTitlesClassicStyle).
       jc_childScollEnabled(YES).
        jc_titlesViewBackColor([UIColor whiteColor]).
        jc_itemTextNormalColor([UIColor redColor]).
        jc_itemTextSelectedColor([UIColor purpleColor]).
//        jc_itemSelectedSegmentIndex(3).
        jc_defaultItemShowCount(6).
        jc_itemTextFontSize(13).
        jc_indicatorStyles(MJCIndicatorEqualTextEffect).
        jc_indicatorsAnimalsEnabled(NO).
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width, 50));
    }];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
    [self.view addSubview:interFace];

    
//    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithSegmentStylestoolsBlock:^(MJCSegmentStylesTools *jc_tools) {
//        jc_tools.
//        jc_titleBarStyles(MJCTitlesClassicStyle).
//        jc_titlesViewBackColor([UIColor whiteColor]).
//        jc_itemTextNormalColor([UIColor redColor]).
//        jc_itemTextSelectedColor([UIColor purpleColor]).
//        jc_itemSelectedSegmentIndex(3).
//        jc_defaultItemShowCount(6).
//        jc_itemTextFontSize(11).
//        jc_indicatorStyles(MJCIndicatorEqualTextEffect).
//        jc_indicatorsAnimalsEnabled(YES).
//        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width, 50));
//    }];
//
//    MJCSegmentInterface *interFace =  [[MJCSegmentInterface alloc]init];
//    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
//    interFace.jc_stylesTools = tools;
//    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
//    [self.view addSubview:interFace];

}

-(void)dealloc
{
    NSLog(@"%@销毁了",self);
}



@end
