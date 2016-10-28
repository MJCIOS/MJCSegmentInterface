# MJC
☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆

分段控制器创建(几行代码即可使用)

    MJCSegmentInterface *segmentInterface = [[MJCSegmentInterface alloc]init];
    //添加标题栏
    NSArray *titlesArr = @[@"爱你",@"恨你",@"喜欢你",@"么么",@"哈哈"]; 
    //在添加标题栏之前做其他属性操作(其余属性操作在这上面操作)
    [segmentInterface addTitlesArray:titlesArr];
    [self.view addSubview:segmentInterface];
    
    //添加控制器
    UITestViewController3 *vc3 = [[UITestViewController3 alloc]init];
    //在这之间传数据
    vc3.style = style;
    //
    [segmentInterface setAddChildViewController:vc3];
    
    
    
    




