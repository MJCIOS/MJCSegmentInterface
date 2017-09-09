//
//  MJCDemoPenetrationVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC0.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC0 ()

@end

@implementation MJCSpecialDemoVC0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
    MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
    MJCTestViewController *vc6 = [[MJCTestViewController alloc]init];
    NSArray *vcarrr = @[vc4,vc2,vc1,vc3,vc5,vc6];
    NSArray *titlesArr = @[@"天涯明月刀",@"联盟",@"我的运单",@"CF",@"飞车"];
    
    for (int i = 0 ; i < titlesArr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace =  [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle];
    interFace.titleBarStyles = MJCTitlesClassicStyle;
    interFace.isPenetrationEffect = YES;
    interFace.isIndicatorsAnimals = YES;
    interFace.isIndicatorFollow = YES;
    interFace.isChildScollAnimal = YES;
    interFace.titlesViewBackColor =  [[UIColor blueColor]colorWithAlphaComponent:0.3];
    interFace.itemBackColor =  [UIColor clearColor];
    interFace.itemTextNormalColor = [UIColor redColor];
    interFace.itemTextSelectedColor = [UIColor orangeColor];
    interFace.indicatorColor = [UIColor redColor];
    interFace.itemTextFontSize = 12;
    interFace.indicatorStyles = MJCIndicatorItemTextStyle;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
}

-(void)dealloc
{
    NSLog(@"销毁了");
}

@end
