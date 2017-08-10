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
    MJCSegmentInterface *lala =  [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle];
    lala.titleBarStyles = MJCTitlesClassicStyle;
    lala.isPenetrationEffect = YES;
    lala.isIndicatorsAnimals = YES;
    lala.isIndicatorFollow = YES;
    lala.isChildScollAnimal = YES;
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

-(void)dealloc
{
    NSLog(@"销毁了");
}

@end
