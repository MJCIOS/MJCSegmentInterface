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
    
    MJCSegmentInterface *interface = [MJCSegmentInterface jc_initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleToolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width-40, 40)).
        jc_titlesViewBackColor(MJCRGBColor(205, 23, 38, 1.0)).
        jc_childScollEnabled(YES).
        jc_indicatorsAnimalsEnabled(YES).
        jc_itemTextNormalColor([UIColor whiteColor]).
        jc_itemTextSelectedColor(MJCRGBColor(255,215, 0, 1.0)).
        jc_indicatorColor([UIColor orangeColor]).
        jc_itemTextGradientEnabled(YES).
        jc_indicatorFrame(CGRectMake(0, jc_tools.titlesViewFrame.size.height - 3, 20, 3)).
        jc_tabItemTextZoomBigEnabled(YES, 19).
        jc_itemTextFontSize(15).
        jc_indicatorColorEqualTextColorEnabled(YES).
        jc_tabItemSizeToFitIsEnabled(YES, NO, YES).
        jc_itemEdgeinsets(MJCEdgeInsetsMake(0,15, 0,15, 25)).
        jc_indicatorStyles(MJCIndicatorItemTextStyle).
        jc_childScollAnimalEnabled(YES);
    }];
    [self.view addSubview:interface];
    [interface intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
    
    [self liebiaoUI:interface.jc_stylesTools];
}


-(void)liebiaoUI:(MJCSegmentStylesTools*)tools
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tools.titlesViewFrame), 64,40,40)];
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
