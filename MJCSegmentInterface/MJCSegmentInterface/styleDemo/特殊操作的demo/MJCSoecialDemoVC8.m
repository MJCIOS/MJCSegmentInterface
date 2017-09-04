//
//  MJCSoecialDemoVC8.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/9/4.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSoecialDemoVC8.h"
#import "MJCPrefixHeader.pch"

@interface MJCSoecialDemoVC8 ()<MJCSegmentDelegate>

@end

@implementation MJCSoecialDemoVC8

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
    
    //以下是我的控件中的代码
    MJCSegmentInterface *lala = [[MJCSegmentInterface alloc]init];
    lala.titleBarStyles = MJCTitlesScrollStyle;
    lala.delegate = self;
    lala.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    lala.itemTitleNormalColorArray = colorArr;
    lala.itemTitleSelectedColorArray = colorArr1;
    lala.itemTextNormalColor = [UIColor redColor];
    lala.itemTextSelectedColor = [UIColor purpleColor];
    lala.indicatorColor = [UIColor redColor];
    lala.isIndicatorFollow = YES;
    lala.isIndicatorColorEqualTextColor = YES;
    lala.itemTextFontSize = 11;
    lala.selectedSegmentIndex = 2;
    [lala tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:14];
    [self.view addSubview:lala];
    [lala intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];

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
        UIView *roundView = [[UIView alloc]init];//创建圆点view
        roundView.backgroundColor = [UIColor redColor];
        [item addSubview:roundView];//添加到item上面
        CGFloat  roundViewX= CGRectGetMaxX(item.titleLabel.frame);
        roundView.frame = CGRectMake(roundViewX,0,10 ,10);//设置圆点view的frame
    }
}


/**
 手拽滑动完成之后调用的代理方法

 @param tabItem <#tabItem description#>
 @param childsController <#childsController description#>
 @param indexPage <#indexPage description#>
 @param segmentInterface <#segmentInterface description#>
 */
-(void)mjc_scrollDidEndDeceleratingWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController indexPage:(NSInteger)indexPage segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    UIView *roundView =    tabItem.subviews[2];//获取到圆点view
    roundView.backgroundColor = [UIColor blackColor];
    roundView.jc_x = CGRectGetMaxX(tabItem.titleLabel.frame);//修改位置
}

/**
 点击item的时候会执行的代理方法
 
 @param tabItem <#tabItem description#>
 @param childsController <#childsController description#>
 @param segmentInterface <#segmentInterface description#>
 */
-(void)mjc_ClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    UIView *roundView =    tabItem.subviews[2];//获取到圆点view
    roundView.backgroundColor = [UIColor blackColor];
    roundView.jc_x = CGRectGetMaxX(tabItem.titleLabel.frame);//修改位置
}

/**
 取消选中点击的item会执行的代理方法
 
 @param tabItem <#tabItem description#>
 @param childsController <#childsController description#>
 @param segmentInterface <#segmentInterface description#>
 */
-(void)mjc_cancelClickEventWithItem:(UIButton *)tabItem childsController:(UIViewController *)childsController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    CGFloat  roundViewX= CGRectGetMaxX(tabItem.titleLabel.frame);
    UIView *roundView =    tabItem.subviews[2];//获取到圆点view
    roundView.backgroundColor = [UIColor redColor];
    roundView.jc_x = roundViewX;//修改位置
}



@end
