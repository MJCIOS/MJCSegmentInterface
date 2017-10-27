//
//  MJCOtherAppDemo1.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/25.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo1.h"
#import "MJCPrefixHeader.pch"
#import "MJCAlertMessage.h"

@interface MJCOtherAppDemo1 ()

@end

@implementation MJCOtherAppDemo1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *duowanPathStr =  [[NSBundle mainBundle] pathForResource:@"duowanData" ofType:@"plist"];
    NSArray *titlesArr =  [NSArray arrayWithContentsOfFile:duowanPathStr];
    
    MJCTestTableViewController *vc1 = [[MJCTestTableViewController alloc]init];
    MJCTestCollectVC *vc2 = [[MJCTestCollectVC alloc]init];
    MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
    NSMutableArray  *vcarrr = [NSMutableArray arrayWithObjects:vc1,vc2,vc3, nil];
    NSInteger vcCount = titlesArr.count-vcarrr.count;
    for (int i = 0 ; i < vcCount ; i++) {
        MJCTestViewController *vc = [[MJCTestViewController alloc]init];;
        [vcarrr addObject:vc];//将元素添加到数组末尾
    }
    
    for (int i = 0 ; i < titlesArr.count; i++) {
        UIViewController *vc =vcarrr[i];
        vc.title = titlesArr[i];
    }
    
    [self setupSegmentWithTitlesArr:titlesArr vcArr:vcarrr];
    
    
}

-(void)setupSegmentWithTitlesArr:(NSArray *)titlesArr vcArr:(NSArray *)vcArr
{
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle];
    interFace.titlesViewFrame = CGRectMake(0, 0, interFace.jc_width-40, 50);
    interFace.titlesViewBackColor = [UIColor whiteColor];
    interFace.isIndicatorsAnimals  = YES;
    interFace.itemTextSelectedColor = [UIColor orangeColor];
    interFace.itemTextNormalColor = [UIColor lightGrayColor];
    interFace.indicatorColor = [UIColor orangeColor];
    //    interFace.isFontGradient = YES;
    interFace.indicatorFrame = CGRectMake(0, interFace.titlesViewFrame.size.height-5,15,2);
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:NO widthToFitIsEnabled:YES];
    interFace.itemMaxEdgeinsets = MJCEdgeInsetsMake(0,5, 0,5, 15);
    interFace.indicatorStyles = MJCIndicatorItemTextStyle;
    interFace.itemTextFontSize = 13;
    interFace.isChildScollAnimal = YES;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
    
    
    
    [self liebiaoUI:interFace];
    
}

-(void)liebiaoUI:(MJCSegmentInterface*)interFace
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(interFace.titlesViewFrame), 64, 40, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,8,1, view.jc_height-16)];
    lineView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    [view addSubview:lineView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(lineView.jc_width, 0,view.jc_width, view.jc_height);
    [btn setImage:[UIImage imageNamed:@"列表"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}

-(void)test
{
    [MJCAlertMessage showMessageViewTitle:@"提示" message:@"没这个功能" cancelButtonTitle:@"知道了"];
}


@end
