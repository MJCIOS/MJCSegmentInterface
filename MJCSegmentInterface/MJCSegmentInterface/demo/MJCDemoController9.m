//
//  MJCTest2Controller.m
//  MJCSegmentInterface
//
//  Created by mjc on 17/1/9.
//  Copyright © 2017年 MJC. All rights reserved.
//

#import "MJCDemoController9.h"
#import "MJCSegmentInterface.h"
#import "MJCPrefixHeader.pch"

@interface MJCDemoController9 ()<MJCSlideSwitchViewDelegate>

@property (weak, nonatomic) IBOutlet MJCSegmentInterface *segmentInterface;

@end

@implementation MJCDemoController9

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger style = 0;
    
    //    [MJCSegmentInterface useNavOrTabbarNotBeCover:self rectEdge:UIRectEdgeNone];
    
    //添加标题栏
    NSArray *titlesArr = @[@"德玛西亚",@"卡特琳娜",@"锐雯",@"诺克萨斯",@"EZ",@"光辉",@"无极剑圣",@"狗头"];
    
    _segmentInterface.frame = MJCScreenbound;
    
    _segmentInterface.MJCIndicatorStyle = MJCIndicatorItemTextStyle;
    _segmentInterface.childViewScollAnimal = YES;
    _segmentInterface.MJCTitleBarStyles = MJCTitlesScrollStyle;
    _segmentInterface.childScollEnabled = YES;
    _segmentInterface.slideDelegate = self;
    _segmentInterface.indicatorHidden = NO;
    
//    _segmentInterface.tabItemWidth = 100;
    _segmentInterface.initialShowItem = 4;
    

    _segmentInterface.tabItemTitlesfont = [UIFont systemFontOfSize:10];
    _segmentInterface.tabItemBackColor = [[UIColor redColor]colorWithAlphaComponent:0.3];
    _segmentInterface.indicatorColor = [UIColor purpleColor];
    _segmentInterface.titleViewColor = [[UIColor redColor]colorWithAlphaComponent:0.3];
    
    _segmentInterface.rightMostBtnHidden = NO;
    _segmentInterface.isOpenJump = YES;
    _segmentInterface.pointedLeftImage = [UIImage imageNamed:@"向左箭头"];
    _segmentInterface.pointedRightImage = [UIImage imageNamed:@"向右箭头"];
    _segmentInterface.childViewScollAnimal = YES;
    _segmentInterface.followScrollEnabled = YES;
    
    _segmentInterface.tabItemTitleNormalColor = [UIColor redColor];
    _segmentInterface.tabItemTitleSelectedColor = [UIColor purpleColor];
    
    [_segmentInterface tabItemTitlezoomBigEnabled:YES tabItemTitleMaxfont:20 tabItemTitleMinfont:15];
    
    _segmentInterface.selectedSegmentIndex = 3;
    //在添加标题栏之前做其他属性操作
    [_segmentInterface intoTitlesArray:titlesArr hostController:self];
    
    //添加控制器
    UITestViewController *vc = [[UITestViewController alloc]init];
    UITestViewController1 *vc1 = [[UITestViewController1 alloc]init];
    vc1.style = style;
    UITestViewController2 *vc2 = [[UITestViewController2 alloc]init];
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    vc3.style = style;//传输数据
    UITestViewController4 *vc4 = [[UITestViewController4 alloc]init];
    
    NSArray *childArr = @[vc,vc1,vc2,vc3,vc4];
    [_segmentInterface intoChildControllerArray:childArr];
    
}

-(NSInteger)mjc_defaultSelectedTabItem
{
    return 3;
}

-(NSMutableArray *)mjc_intoChildControllerArrayHostMainController
{
    NSMutableArray *childArr = [NSMutableArray array];
    [childArr addObject:[[UITestViewController alloc]init]];
    [childArr addObject:[[UITestViewController1 alloc]init]];
    [childArr addObject:[[UITestViewController2 alloc]init]];
    [childArr addObject:[[UITestViewController3 alloc]init]];
    [childArr addObject:[[UITestViewController4 alloc]init]];
    
    return childArr;
}


//-(void)mjc_ClickEvent:(UIButton *)titleButton segmentInterface:(MJCSegmentInterface *)segmentInterface
//{
//    if (titleButton.tag == 1) {
//        [titleButton setTitle:@"消息" forState:UIControlStateNormal];
//    }else{
//        [titleButton setTitle:@"电话11" forState:UIControlStateNormal];
//    }
//    
//    [self setupButton:titleButton];
//}
//
//
//
//-(void)setupButton:(UIButton *)button
//{
//    if (button.tag == 0) {
//        button.backgroundColor = [[UIColor purpleColor]colorWithAlphaComponent:0.7];
//    }else if (button.tag == 1){
//        button.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:1.0];
//    }else if (button.tag == 2){
//        button.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7];
//    }else if (button.tag == 3){
//        button.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];
//    }else{
//        button.backgroundColor = [[UIColor orangeColor]colorWithAlphaComponent:0.7];
//    }
//}


@end
