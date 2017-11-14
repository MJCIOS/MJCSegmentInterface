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
    
    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools)
                                           {
                                               jc_tools.
                                               jc_titlesViewBackColor([UIColor whiteColor]).
                                               jc_titleBarStyles(MJCTitlesScrollStyle).
                                               jc_itemTextNormalColor([UIColor redColor]).
                                               jc_itemTextSelectedColor([UIColor purpleColor]).
                                               jc_itemTextFontSize(11).
                                               jc_indicatorColor([UIColor redColor]).
                                               jc_indicatorFollowEnabled(YES).
                                               jc_itemSelectedSegmentIndex(2);
                                           }];
    MJCSegmentInterface *interFace = [MJCSegmentInterface initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleTools:tools];
    _interface = interFace;
    interFace.delegate = self;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];

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
