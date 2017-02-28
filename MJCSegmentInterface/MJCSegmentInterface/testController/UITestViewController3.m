//
//  UITestViewController3.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/9.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "UITestViewController3.h"
#import "UIView+MJCExtenSion.h"
#import "MJCSegmentInterface.h"
#import "UITestViewController4.h"

@interface UITestViewController3 ()<UITableViewDelegate,UITableViewDataSource>

/** tableView2 */
@property (nonatomic,strong) UITableView *tableView2;



@end

@implementation UITestViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%ld",(long)_style);
    
    self.tableView2 = [[UITableView alloc]init];
    UIImageView *imamgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"皎月"]];
    self.tableView2.backgroundView =imamgview;
    self.tableView2.frame = CGRectMake(0,0,MJCScreenWidth,MJCScreenHeight-64);
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    [self.view addSubview:self.tableView2];
    
    UIView *view1 = [[UIView alloc]init];
    view1.mjc_height = 50;
    view1.frame = CGRectMake(0,self.view.mjc_height-(view1.mjc_height + 64)-2,self.view.mjc_width,view1.mjc_height);
    view1.backgroundColor = [[UIColor blueColor]colorWithAlphaComponent:0.2];
    [self.view addSubview:view1];

    UILabel *lablew1 = [[UILabel alloc]init];
    lablew1.mjc_width = 100;
    lablew1.mjc_centerX = view1.mjc_width / 2;
    lablew1.mjc_height = view1.mjc_height / 2;
    lablew1.mjc_centerY = view1.mjc_height / 2 ;
    lablew1.backgroundColor = [UIColor redColor];
    lablew1.textAlignment = NSTextAlignmentCenter;
    lablew1.font = [UIFont systemFontOfSize:16];
    lablew1.textColor = [UIColor blackColor];
    lablew1.text = @"谢 谢 大 家 ";
    [view1 addSubview:lablew1];

    
    
    /**
     * 修改子控件大小位置,还有一些内边距
     */
    if (self.style == 0) {
        self.tableView2.frame = CGRectMake(0,0,MJCScreenWidth,MJCScreenHeight-64-50);
        view1.frame = CGRectMake(0,self.view.mjc_height-(view1.mjc_height+MJCTitlesViewH+MJCNavMaxY)-2,self.view.mjc_width,view1.mjc_height);
        lablew1.frame = CGRectMake((view1.mjc_width - lablew1.mjc_width) * 0.5,0,lablew1.mjc_width,50);
        return;
    }

    
    if (self.style == 2) {
        self.tableView2.frame = CGRectMake(0,0,MJCScreenWidth-20,MJCScreenHeight-64-50-10);
        view1.frame = CGRectMake(0,self.view.mjc_height-(view1.mjc_height+MJCTitlesViewH+MJCNavMaxY)-12,self.view.mjc_width-20,view1.mjc_height);
        lablew1.mjc_width = 100;
        lablew1.mjc_centerX = view1.mjc_width / 2;
        lablew1.mjc_height = view1.mjc_height / 2;
        lablew1.mjc_centerY = view1.mjc_height / 2 ;
        
        return;
    }
    
    
    
//    self.tableView2.frame = CGRectMake(0,0,MJCScreenWidth,MJCScreenHeight-64);
    
    
    
    

}


#pragma mark - UITableviewdatasource
//多少组cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}
//每行表格什么内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.定义个重用标识符
    static NSString *ID = @"cell";
    
    // 2.先从缓存池去找可重用的cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.进行判断:缓存池没有可重用的cell,创建一个新的cell,并绑定一个重用标识
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if (indexPath.row == 1) {
        cell.textLabel.text = @"MJC啦啦啦3333MJC啦啦啦3333333333333333333333333333";
    }else if(indexPath.row == 0 ){
        cell.textLabel.text = @"MJC啦啦啦2222";
    }else{
        
        cell.textLabel.text = @"MJC啦啦啦1111";
    }
    
    cell.textLabel.textColor = [UIColor grayColor];
    
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

//在TableView上选中某个Cell会触发点击方法,被选中时调用的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITestViewController4 *textVC = [UITestViewController4 new];
    
    [self.navigationController pushViewController:textVC animated:YES];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSLog(@"sadasdsa");
    
}


@end
