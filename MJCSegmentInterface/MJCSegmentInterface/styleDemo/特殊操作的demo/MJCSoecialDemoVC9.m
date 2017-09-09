//
//  MJCSoecialDemoVC9.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/9/6.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC9.h"
#import "MJCPrefixHeader.pch"
#import "MJCTestPushVC.h"

@interface MJCSoecialDemoVC9 ()<MJCSegmentDelegate>

@property (nonatomic,weak) MJCSegmentInterface *interface;

@end

@implementation MJCSoecialDemoVC9

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(switchSegmentPage) name:@"switchSegmentPage" object:nil];
    
    
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
    
    //以下是我的控件中的代码
    MJCSegmentInterface *interface = [[MJCSegmentInterface alloc]init];
    interface.titleBarStyles = MJCTitlesScrollStyle;
    interface.delegate = self;
    interface.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    interface.itemTitleNormalColorArray = colorArr;
    interface.itemTitleSelectedColorArray = colorArr1;
    interface.itemBackColor = [UIColor purpleColor];
    interface.itemMaxEdgeinsets = MJCEdgeInsetsMake(0,15,0,15,20);
    interface.itemTextNormalColor = [UIColor redColor];
    interface.itemTextSelectedColor = [UIColor purpleColor];
    interface.indicatorColor = [UIColor redColor];
    interface.isIndicatorFollow = YES;
    interface.isIndicatorColorEqualTextColor = YES;
    interface.itemTextFontSize = 11;
    interface.selectedSegmentIndex = 1;
    [interface tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:14];
    [self.view addSubview:interface];
    [interface intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    _interface = interface;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点我进入下个界面" forState:UIControlStateNormal];
    button.frame = CGRectMake(0,0, 0, 0);
    [button sizeToFit];
    button.jc_centerX = self.view.jc_centerX;
    button.jc_centerY = self.view.jc_centerY;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}
    
-(void)btnClick:(UIButton*)btn
{
    MJCWeakSelf;
    MJCTestPushVC *vc = [[MJCTestPushVC alloc]jc_initWithSureBtnClickBlock:^{
        [weakSelf switchSegmentPage];
    }];
    [self.navigationController pushViewController:vc animated:YES];
}
    
    
-(void)switchSegmentPage
{
    _interface.selectedSegmentIndex = 4;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
    

@end
