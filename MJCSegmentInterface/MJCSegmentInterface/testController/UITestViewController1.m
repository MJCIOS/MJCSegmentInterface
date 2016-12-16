//
//  UITestViewController1.m
//  MJCSlideSwitch
//
//  Created by mjc on 16/10/9.
//  Copyright © 2016年 MJC. All rights reserved.
//

#import "UITestViewController1.h"

@interface UITestViewController1 ()<UITableViewDelegate,UITableViewDataSource>


/** tableView */
@property (nonatomic,strong) UITableView *tableView1;


@end

@implementation UITestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    
    
    /**
     * 根据样式修改子控件大小位置,还有一些内边距
     *
     */
    self.tableView1 = [[UITableView alloc]init];
    self.tableView1.contentInset = UIEdgeInsetsMake(50,0,64,0);
    self.tableView1.backgroundColor = [UIColor redColor];
    self.tableView1.frame = self.view.bounds;
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;

    
    if (_style ==3) {
        self.tableView1.contentInset = UIEdgeInsetsMake(50,0,64,0);
    }else{
       self.tableView1.contentInset = UIEdgeInsetsMake(0,0,114,0);
    }
    
    
    [self.view addSubview:self.tableView1];
    


}


#pragma mark - UITableviewdatasource
//多少组cell
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 40;
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
    cell.backgroundColor = [UIColor blueColor];
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

//在TableView上选中某个Cell会触发点击方法,被选中时调用的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
