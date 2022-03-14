//
//  MJCSoecialDemoVC7.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/9/1.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC7.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC7 ()<MJCSegmentDelegate>

@end

@implementation MJCSoecialDemoVC7

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
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    for (int i = 0 ; i < vcarrr.count; i++) {//赋值标题
        UIViewController *vc = vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    NSArray *colorArr = @[[UIColor redColor],[UIColor blackColor],[UIColor purpleColor],[UIColor lightGrayColor],[UIColor orangeColor]];
    NSArray *colorArr1 = @[[UIColor blackColor],[UIColor redColor],[UIColor lightGrayColor],[UIColor purpleColor],[UIColor yellowColor]];
    
    
    MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithSegmentStylestoolsBlock:^(MJCSegmentStylesTools *jc_tools)
                                      {
                                          jc_tools.
                                          jc_titlesViewBackColor([UIColor whiteColor]).
                                          jc_titleBarStyles(MJCTitlesScrollStyle).
                                          jc_itemTextNormalColor([UIColor redColor]).
                                          jc_itemTextSelectedColor([UIColor purpleColor]).
                                          jc_itemTextColorArrayNormal(colorArr).
                                          jc_itemTextColorArraySelected(colorArr1).
                                          jc_itemTextFontSize(11).
                                          jc_indicatorColor([UIColor redColor]).
                                          jc_indicatorFollowEnabled(YES).
                                          jc_indicatorColorEqualTextColorEnabled(YES).
                                          jc_itemTextsEdgeInsets(UIEdgeInsetsMake(0, 0, 0, 0)).
                                          jc_itemSelectedSegmentIndex(2);
                                      }];
    MJCSegmentInterface *interFace = [MJCSegmentInterface initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyletools:tools];
    interFace.delegate = self;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];
}
    
/**
 获取到所有item的代理方法

 @param tabItemArray 装有item的数组
 @param childsVCAarray 装有子控制器的数组
 @param segmentInterface segmentInterface
 */
-(void)mjc_tabitemDataWithTabitemArray:(NSArray<UIButton *> *)tabItemArray childsVCAarray:(NSArray<UIViewController *> *)childsVCAarray segmentInterface:(MJCSegmentInterface *)segmentInterface
{
        for (int i = 0 ; i < tabItemArray.count; i++) {
            UIButton *item = tabItemArray[i];//获取到item
            CGFloat  roundViewX= CGRectGetMaxX(item.titleLabel.frame);
            UIView *roundView = [[UIView alloc]init];//创建圆点view
            roundView.backgroundColor = [UIColor blackColor];
            [item addSubview:roundView];//添加到item上面
            roundView.frame = CGRectMake(roundViewX,0,10 ,10);//设置圆点view的frame
        }
}
    
    


@end
