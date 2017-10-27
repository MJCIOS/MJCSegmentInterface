//
//  MJCOtherAppDemo3.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/26.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo3.h"
#import "MJCPrefixHeader.pch"
#import "MJCAlertMessage.h"

@interface MJCOtherAppDemo3 ()

@end

@implementation MJCOtherAppDemo3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *duowanPathStr =  [[NSBundle mainBundle] pathForResource:@"tengxunxinwenData" ofType:@"plist"];
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
    interFace.titlesViewFrame = CGRectMake(0, 0, interFace.jc_width-40, 40);
    interFace.titlesViewBackColor = MJCRGBColor(205, 23, 38, 1.0);
    interFace.itemTextSelectedColor = MJCRGBColor(255,215, 0, 1.0);
    interFace.itemTextNormalColor = [UIColor whiteColor];
    interFace.isFontGradient = YES;
    interFace.isIndicatorColorEqualTextColor = YES;
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:NO widthToFitIsEnabled:YES];
    interFace.itemMaxEdgeinsets = MJCEdgeInsetsMake(0,15, 0,15, 25);
    interFace.itemTextFontSize = 15;
    interFace.isIndicatorsAnimals = YES;
    interFace.indicatorFrame = CGRectMake(0, interFace.titlesViewFrame.size.height - 3, 20, 3);
    interFace.isChildScollAnimal = YES;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
    
    
    [self liebiaoUI:interFace];
}


-(void)liebiaoUI:(MJCSegmentInterface*)interFace
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(interFace.titlesViewFrame), 64,40,40)];
    view.backgroundColor = MJCRGBColor(205, 23, 38, 1.0);
    [self.view addSubview:view];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0,view.jc_width, view.jc_height);
    [btn setImage:[UIImage imageNamed:@"加号2"] forState:UIControlStateNormal];
    btn.backgroundColor = MJCRGBColor(205, 23, 38, 1.0);
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}

-(void)test
{
    [MJCAlertMessage showMessageViewTitle:@"提示" message:@"没这个功能" cancelButtonTitle:@"知道了"];
}


@end
