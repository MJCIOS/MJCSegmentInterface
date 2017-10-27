//
//  MJCOtherAppDemo7.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/10/27.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCOtherAppDemo7.h"
#import "MJCPrefixHeader.pch"
#import "MJCAlertMessage.h"

@interface MJCOtherAppDemo7 ()

@end

@implementation MJCOtherAppDemo7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *titlesArr = @[@"精选",@"",@"直播",@"订阅",@"视频购",@"问答",@"清单",@"社区",@"生活",@"数码",@"亲子",@"风尚",@"美食"];
    
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
    NSArray *imageNArr =@[@"",@"美妆个护",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""];
    
    MJCSegmentInterface *interFace = [MJCSegmentInterface showInterfaceWithTitleBarFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) Styles:MJCTitlesScrollStyle];
    interFace.titlesViewFrame = CGRectMake(0, 0, interFace.jc_width-50, 40);
    interFace.titlesViewBackColor = [UIColor groupTableViewBackgroundColor];
    interFace.itemTextSelectedColor = [UIColor redColor];
    interFace.itemTextNormalColor = [UIColor darkGrayColor];
    interFace.itemImageNormalArray = imageNArr;
    interFace.indicatorColor = [UIColor redColor];
    [interFace tabItemSizeToFitIsEnabled:YES heightToFitIsEnabled:NO widthToFitIsEnabled:YES];
    interFace.itemMaxEdgeinsets = MJCEdgeInsetsMake(0,15, 0,15, 20);
    interFace.itemTextFontSize = 15;
    interFace.isIndicatorsAnimals = YES;
    
    interFace.indicatorStyles = MJCIndicatorItemTextStyle;
    interFace.isChildScollAnimal = YES;
    [self.view addSubview:interFace];
    [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcArr hostController:self];
    
    
    [self liebiaoUI:interFace];
}


-(void)liebiaoUI:(MJCSegmentInterface*)interFace
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(interFace.titlesViewFrame), 64,50,interFace.titlesViewFrame.size.height)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:view];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0,8,1, view.jc_height-16)];
    lineView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    [view addSubview:lineView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.frame = CGRectMake(lineView.jc_width, 0,view.jc_width, view.jc_height);
    [btn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
}

-(void)test
{
    [MJCAlertMessage showMessageViewTitle:@"提示" message:@"没这个功能" cancelButtonTitle:@"知道了"];
}


@end
