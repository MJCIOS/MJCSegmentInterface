## ☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆
* 一款简单的类似百思不得姐主页导航栏下方的那个分段界面的控件,类似王者荣耀助手的聊天模块的导航栏下方的分段界面控件等等,简单的说,这是一款分段界面选择器

## ☆☆ 如何导入使用框架方法 ☆☆
* 可以打开https://github.com/MJCIOS/MJCSegmentInterface 将项目下载下来,将MJCSlideInterface文件夹放入自己的项目中
* 项目已支持pod导入,pod 'MJCSegmentInterface',如果没法导入,可以先[pod repo update]更新整个.cocoapods下的所有库...

## ☆☆ 版本更新简介 ☆☆
* 修改了按钮分类导致崩溃的bug

---------------------------------------------------------------------------------------------------------------
* 有啥问题联系我QQ292251588,希望大神们和我多多交流,和大神们一起学习.....
* 技术交流群612845323,希望和大神们一起学习多多交流,互相学习些技术.....
* 希望大家多多支持,如果觉得好用,多多帮忙推荐,谢谢大家,谢谢大神,有啥问题,可以提给我...

---------------------------------------------------------------------------------------------------------------

## ☆☆ 用在我仿做的项目中请看以下示例图 ☆☆

*最普通的初始demo

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo1.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo2.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo3.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo4.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo5.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo6.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo7.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo8.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo9.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo10.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo11.gif)

* (真的很喜欢玩他们的游戏,感觉他们的项目很不错,所以忍不住仿做了他们的项目)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/xiangmu2.gif)

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
        
## 可自行修改各个属性,具体属性接口可进入项目查看..

    /** 添加控制器的方法(添加控制器按照控制器添加的先后顺序与按钮对应的 */
    -(void)intoChildControllerArray:(NSArray *)childControllerArray;
    /** 添加标题栏的方法 */
    -(void)intoTitlesArray:(NSArray *)titlesArray hostController:(UIViewController *)hostController;

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
