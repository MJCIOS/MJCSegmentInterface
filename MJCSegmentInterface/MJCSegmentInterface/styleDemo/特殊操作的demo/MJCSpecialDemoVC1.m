//
//  MJCDemoNewVC.m
//  MJCSegmentInterface
//
//  Created by mjc on 2017/8/30.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCSpecialDemoVC1.h"
#import "MJCPrefixHeader.pch"

@interface MJCSpecialDemoVC1 ()<MJCSegmentDelegate>

@property (nonatomic,strong) NSArray *mainArr;

@end

@implementation MJCSpecialDemoVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"jiameng" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    _mainArr =  dic[@"data"][@"rootArray"];
    
    NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
    NSMutableArray *vcArr = [NSMutableArray array];
    for (int i = 0 ; i < titlesArr.count; i++) {//循环创建控制器对象
        MJCTestTableViewController *vc = [[MJCTestTableViewController alloc]init];
        vc.title = titlesArr[i];
        [vcArr addObject:vc];
    }
    
    [self setupBasicUIWithTitlesArr:titlesArr vcArr:vcArr];
}

-(void)setupBasicUIWithTitlesArr:(NSArray*)titlesArr vcArr:(NSArray*)vcArr
{
    //以下是我的控件中的代码
    MJCSegmentInterface *lala = [[MJCSegmentInterface alloc]init];
    lala.titleBarStyles = MJCTitlesScrollStyle;
    lala.frame = CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64);
    lala.delegate= self;
    lala.itemTextSelectedColor = [UIColor blueColor];
    lala.itemTextNormalColor = [UIColor redColor];
    lala.itemTextFontSize = 11;
    lala.defaultShowItemCount = 5;
    lala.childsContainerBackColor = [UIColor purpleColor];
    lala.selectedSegmentIndex = 2;
    [lala intoTitlesArray:titlesArr hostController:self];
    [self.view addSubview:lala];
    [lala intoChildControllerArray:vcArr];

}

-(void)mjc_ClickEvent:(UIButton *)tabItem childViewController:(UIViewController *)childViewController segmentInterface:(MJCSegmentInterface *)segmentInterface
{
    MJCTestTableViewController *vc = (MJCTestTableViewController *)childViewController;
    NSMutableDictionary *dic =  _mainArr[tabItem.tag];
    [vc beginLoadNewData:dic];
}


@end
