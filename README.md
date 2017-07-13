## ☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆
* 一款简单的类似百思不得姐主页导航栏下方的那个分段界面的控件,类似王者荣耀助手的聊天模块的导航栏下方的分段界面控件等等,简单的说,这是一款分段界面选择器

## ☆☆ 如何导入使用框架方法 ☆☆
* 可以打开https://github.com/MJCIOS/MJCSegmentInterface 下载下来,将MJCSlideInterface文件夹放入自己的项目
* 项目已支持pod导入,pod 'MJCSegmentInterface',也可使用pod

---------------------------------------------------------------------------------------------------------------
* 有啥问题联系我QQ292251588,希望大神们和我多多交流,和大神们一起学习.....
* 希望大家多多支持,如果觉得好用,多多帮忙推荐,谢谢大家,谢谢大神,有啥问题,可以提给我...

---------------------------------------------------------------------------------------------------------------

## ☆☆ 用在我仿做的项目中(真的很喜欢玩这个游戏,所以忍不住仿做了他们的项目),请看以下示例图 ☆☆

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu2.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu2.1.gif)   
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/xiangmu3.gif)

### ☆☆ MJCSegmentInterface分段控制器创建(几行代码设置即可使用) ☆☆
    
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
        
## 可自行修改各个属性,具体属性内容可进去查看..
