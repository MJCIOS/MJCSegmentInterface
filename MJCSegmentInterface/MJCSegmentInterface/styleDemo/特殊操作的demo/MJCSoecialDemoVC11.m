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

@interface MJCSoecialDemoVC11 ()
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
    
    _interFace.titleBarStyles = MJCTitlesScrollStyle;
    _interFace.titlesViewFrame = CGRectMake(0,0,MJCScreenWidth,50);//顶部标题栏frame
    _interFace.selectedSegmentIndex = 0;//默认选中第几个
    _interFace.defaultShowItemCount = 3;//首页,第一页展示多少个
    _interFace.titlesViewBackColor = [UIColor blueColor];//标题栏背景颜色
    _interFace.itemTextNormalColor = [UIColor redColor];//item普通状态下文字颜色
    _interFace.itemTextSelectedColor = [UIColor purpleColor];//item点击状态下文字颜色
    _interFace.itemBackColor = [UIColor whiteColor];//item背景颜色
    [_interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
    
}


@end
