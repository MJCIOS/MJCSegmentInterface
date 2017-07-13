# MJC
##☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆
##项目已支持pod导入,pod 'MJCSegmentInterface'
###有啥问题联系我QQ292251588,希望大神们和我多多交流,和大神们一起学习.....
####用在我仿做的很喜欢的项目中,请看以下示例图
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu2.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu2.1.gif)   ![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu3.gif)

### MJCSegmentInterface分段控制器创建(几行代码设置即可使用)
    
        NSArray *titlesArr = @[@"啦啦",@"么么",@"啪啪",@"啪啪",@"啪啪",@"啪啪",@"啪啪"];
        MJCSegmentFaceControl *segmentsface = [[MJCSegmentFaceControl alloc]init];
        segmentsface.frame = CGRectMake(0,64, MJCScreenWidth,MJCScreenHeight);
        [lala intoTitlesArray:titlesArr hostController:self];
        [self.view addSubview:segmentsface];
        MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
        vc1.titlesCount = 1;
        MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
        vc2.titlesCount = 2;
        MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
        vc3.titlesCount = 3;
        MJCTestViewController *vc4 = [[MJCTestViewController alloc]init];
        vc4.titlesCount = 4;
        MJCTestViewController *vc5 = [[MJCTestViewController alloc]init];
        vc5.titlesCount = 5;
        NSArray *vcarrr = @[vc1,vc2,vc3,vc4,vc5];
        [lala intoChildControllerArray:vcarrr];

        
        
---------------------------------------------------------------------------------------------------------------
        希望大家多多支持,如果觉得好用,多多帮忙推荐,谢谢大家,谢谢大神,有啥问题,可以提给我...

## 可自行修改各个属性,具体属性内容可进去查看..
