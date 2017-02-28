//
//  UITestViewController1.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/9.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "UITestViewController1.h"
#import "MJCPrefixHeader.pch"

@interface UITestViewController1 ()<UITableViewDelegate,UITableViewDataSource>


/** tableView */
@property (nonatomic,strong) UITableView *tableView1;


@end

@implementation UITestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView1 = [[UITableView alloc]init];
    UIImageView *imamgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"月光"]];
    self.tableView1.backgroundView =imamgview;
    self.tableView1.frame = CGRectMake(0,0, MJCScreenWidth, MJCScreenHeight - 64 - 50);
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    [self.view addSubview:self.tableView1];

    if (_style == 4) {
        self.tableView1.frame = CGRectMake(0,0,MJCScreenWidth,MJCScreenHeight-64);
    }
    
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
    
    cell.textLabel.text = @"MJC啦啦啦";
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate
//在TableView上选中某个Cell会触发点击方法,被选中时调用的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
