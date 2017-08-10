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

    
    
    //以下是我的控件中的代码
    MJCSegmentInterface *lala = [[MJCSegmentInterface alloc]init];
    lala.titleBarStyles = MJCTitlesClassicStyle;
    lala.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    lala.itemBackColor =  [UIColor clearColor];
    lala.itemTextNormalColor = [UIColor redColor];
    lala.itemTextSelectedColor = [UIColor purpleColor];
    lala.selectedSegmentIndex = 3;
    lala.defaultShowItemCount = 3;
    //    lala.isIndicatorFollow = YES;
    lala.itemTextFontSize = 11;
    lala.indicatorStyles = MJCIndicatorItemTextStyle;
    lala.isIndicatorsAnimals = YES;
    [lala intoTitlesArray:titlesArr hostController:self];
    [lala intoChildControllerArray:vcarrr];;
    [self.view addSubview:lala];
    
    
    
}

-(void)dealloc
{
    NSLog(@"销毁了");
}



@end
