//
//  MJCDemoVC3.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/7/2.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoVC1.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoVC1 ()<MJCSegmentDelegate>

@end

@implementation MJCDemoVC1

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
    
    //以下是我的控件中的代码
    MJCSegmentInterface *interFace = [[MJCSegmentInterface alloc]init];
    interFace.titleBarStyles = MJCTitlesScrollStyle;
    interFace.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interFace.itemTextNormalColor = [UIColor redColor];
    interFace.itemTextSelectedColor = [UIColor purpleColor];
    interFace.isIndicatorFollow = YES;
    interFace.titlesViewBackImage = [UIImage imageNamed:@"back"];
    [interFace tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:18];
    [self.view addSubview:interFace];
    
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}

@end
