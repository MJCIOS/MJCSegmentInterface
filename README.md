## ☆☆☆ “MJCSegmentInterface分段控制器” ☆☆☆
* 大家觉得还可以的话,麻烦耽误大家一点时间,点个赞点个星吧.谢谢大家,点赞的都是大好人...
* 一款简单的类似百思不得姐主页导航栏下方的那个分段界面的控件,类似王者荣耀助手的聊天模块的导航栏下方的分段界面控件等等,简单的说,这是一款分段界面选择器

## ☆☆ 如何导入使用框架方法 ☆☆
* 1.打开https://github.com/MJCIOS/MJCSegmentInterface 将项目下载下来
* 2.将MJCSlideInterface文件夹放入自己的项目中

### * 项目已支持CocoaPods

        platform :ios, '8.0'
        target '<Your Target Name>' do
            pod 'MJCSegmentInterface'
        end
        
* 1.打开Podfile文件 添加pod 'MJCSegmentInterface'	
* 2.再执行下pod update 或pod install (如果没法导入,可以先 pod repo update 更新整个.cocoapods下的所有库...)
* 3.如果没更新到最新版本,请先pod repo update 更新整个.cocoapods下的所有库... ,然后再pod update
* 4.import <MJCSegmentInterface/MJCSegmentInterface.h>

## ☆☆ 1.9.0版本更新简介 ☆☆

* 1.首先先和大家说声抱歉,这次代码改的太多了,用法都变了,导致好多人代码报错....
* 2.全新代码的修改,增添了样式属性类,使用链式属性...让代码更简洁,更方便..
* 3.如果不想用最新的,限制版本: 'MJCSegmentInterface', '~> 1.8.7'

        platform :ios, '8.0'
        target '<Your Target Name>' do
            pod 'MJCSegmentInterface', '~> 1.8.7'
        end

---------------------------------------------------------------------------------------------------------------
* 我只想把框架弄的更好..让大家更方便的用,有问题和bug,还有需要啥新的功能随时提给我,谢谢.
* 有啥问题联系我QQ292251588,希望大神们和我多多交流,和大神们一起学习.....
* 技术交流群612845323,希望和大神们一起学习多多交流,互相学习些技术.....
* 希望大家多多支持,如果觉得好用,多多帮忙推荐,谢谢大家,谢谢大神,有啥问题,可以提给我...


---------------------------------------------------------------------------------------------------------------

### ☆☆ 使用者用在项目中的展示图(已经过使用者同意) ☆☆

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demos0.png)

### ☆☆ 使用说明(几行代码设置即可使用,就是那么简单) ☆☆

        //  实例化您需要显示的控制器对象
        MJCTestViewController *vc1 = [[MJCTestViewController alloc]init];
        MJCTestTableViewController *vc2 = [[MJCTestTableViewController alloc]init];
        MJCTestViewController1 *vc3 = [[MJCTestViewController1 alloc]init];
        MJCTestCollectVC *vc4 = [[MJCTestCollectVC alloc]init];
        NSArray *vcarrr = @[vc1,vc2,vc3,vc4];// 用数组将控制器装起来
        //  实例化一个标题数组对象,相对应的控制器界面,是与控制器数组中的控制器顺序相对应,比如说(荣耀对应着vc1的控制器界面)
        NSArray *titlesArr = @[@"荣耀",@"联盟",@"DNF",@"CF",@"飞车",@"炫舞",@"天涯明月刀"];
        // 分段样式属性工具
        MJCSegmentStylesTools *tools = [MJCSegmentStylesTools jc_initWithjc_toolsBlock:^(MJCSegmentStylesTools *jc_tools) {
        jc_tools.jc_titleBarStyles(MJCTitlesScrollStyle).
        jc_titlesViewFrame(CGRectMake(0, 0, self.view.jc_width,50));
        }];
        MJCSegmentInterface *interFace = [MJCSegmentInterface initWithFrame:CGRectMake(0,64,self.view.jc_width, self.view.jc_height-64) interFaceStyleTools:tools];
        [self.view addSubview:interFace];
        [interFace intoTitlesArray:titlesArr intoChildControllerArray:vcarrr hostController:self];

---------------------------------------------------------------------------------------------------------------

## ☆☆ 使用说明及示例图展示 ☆☆

*初始默认状态:(默认的是MJCTitlesClassicStyle)

        jc_titleBarStyles(MJCTitlesClassicStyle);

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo6.gif)

*滚动模式状态:(MJCTitlesScrollStyle)

        jc_titleBarStyles(MJCTitlesScrollStyle);

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo0.gif)

*默认选中哪一页:(selectedSegmentIndex)(从第0页开始数,第0页,第1页,第2页,第3页)

        segmentsface.selectedSegmentIndex = 3;//默认选中的是第3页(从0开始数,第0页,第1页,第2页,第3页)

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo1.gif)

*颜色渐变,指示器跟随滑动:(jc_itemTextGradientEnabled,jc_indicatorFollowEnabled)

        jc_itemTextGradientEnabled(YES)
        jc_indicatorFollowEnabled(YES)

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo2.gif)

*字体放大:(jc_tabItemTextZoomBigEnabled)

        jc_tabItemTextZoomBigEnabled(YES, 18).

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo3.gif)

*上下滑动的穿透效果:(jc_titlesViewPenetrationEnabled)

      jc_titlesViewPenetrationEnabled(YES)
      
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo7.gif)

*实时刷新最新数据的做法:(代理方法的使用(MJCSegmentDelegate))
        
        //每当点击的时候会调用的代理方法
        - (void)mjc_ClickEvent:(UIButton *)tabItem childViewController:(UIViewController *)childViewController segmentInterface:(MJCSegmentInterface *)segmentInterface;
        {
                if ([childViewController isKindOfClass:[MJCTestTableViewController class]]) {
                    [_testTableViewVC beginLoadNewData];//控制器提供一个刷新数据的方法,给这里刷新数据使用,
                }else{
                    NSLog(@"%@",childViewController);
                }   
        }

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo5.gif)

## ☆☆ 示例图展示(功能太多了,就不一一说明了) ☆☆

![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo4.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo8.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo9.gif)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo10.gif)

* 用到我仿做的项目中(真的很喜欢玩他们的游戏,感觉他们的项目很不错,所以忍不住仿做了他们的项目)
![image](https://github.com/MJCIOS/MJCSegmentInterface/raw/master/MJCSegmentInterface/MJCSegmentInterface/Others/demo11.gif)

---------------------------------------------------------------------------------------------------------------
## 可自行修改各个属性,具体属性接口可进入项目查看..

        /** (子视图)滚动是否有动画 */
        jc_childScollAnimalEnabled
        /** (子视图)是否开启手拽滑动 */
        jc_childScollEnabled
        /** (子视图)主容器的背景色 */
        jc_childsContainerBackColor
        /** (标题栏)启用穿透效果 */
        jc_titlesViewPenetrationEnabled
        /** 标题栏样式 */
        jc_titleBarStyles
        /** 标题栏frame */
        jc_titlesViewFrame
        /** 标题栏背景图片 */
        jc_titlesViewBackImage
        /** 指示器的颜色是否与文字颜色一样 */
        jc_indicatorColorEqualTextColorEnabled
        /** (指示器)启用动画效果 */
        jc_indicatorsAnimalsEnabled
        /** 底部指示器是否跟随滚动 */
        jc_indicatorFollowEnabled
        /** 底部指示器大小样式 */
        jc_indicatorStyles
        /** 可设置指示器的Y值和高度,其余不允许自己设置 */
        jc_indicatorFrame
        /** 底部指示器背景色 */
        jc_indicatorColor
        /** 底部指示器图片(设置了图片的话,此控件是根据图片本身的大小自适应的) */
        jc_indicatorImage
        /** 底部指示器是否隐藏 */
        jc_indicatorHidden
        /** (item)启用滑动颜色渐变 */
        jc_itemTextGradientEnabled
        /** 是否显示标题文字 */
        jc_itemTextHidden
        /** 默认选中的item */
        jc_itemSelectedSegmentIndex
        /** 默认显示多少个item (初始显示4个) */
        jc_ItemDefaultShowCount
        /** item文字的内边距 */
        jc_itemTextsEdgeInsets
        /** item图片的内边距 */
        jc_itemImagesEdgeInsets
        /** item最大内边距和两个item之间的间距(如果是item高度自适应,设置top和bottom无效) */
        jc_itemEdgeinsets
        /** item图片效果样式 */
        jc_itemImageEffectStyles
        /** item背景颜色 */
        jc_itemBackColor
        /** item普通状态下文字颜色 */
        jc_itemTextNormalColor
        /** item高亮状态下文字颜色 */
        jc_itemTextSelectedColor
        /** item文字大小 */
        jc_itemTextFontSize
        /** item普通状态下的图片 */
        jc_itemImageNormal
        /** item点击状态下的图片 */
        jc_itemImageSelected
        /** item普通状态下图片数组 */
        jc_itemImageArrayNormal
        /** item点击状态下图片数组 */
        jc_itemImageArraySelected
        /** item普通状态下背景图片 */
        jc_itemBackImageNormal
        /** item点击状态下背景图片 */
        jc_itemBackImageSelected
        /** item普通状态下背景图片数组 */
        jc_itemBackImageArrayNormal
        /** item点击状态下背景图片数组 */
        jc_itemBackImageArraySelected
        /** item的图片大小(不能设置背景图片) */
        jc_itemImageSize
        /** item普通状态下文字颜色数组(可以让文字显示不同的颜色)(不支持颜色渐变) */
        jc_itemTextColorArrayNormal
        /** item点击状态下文字颜色数组(可以让文字显示不同的颜色)(不支持颜色渐变) */
        jc_itemTextColorArraySelected
        /** tabitem内容自适应:(高度自适应或宽度自适应)(如果是item高度自适应,设置内边距top和bottom无效)*/
        jc_tabItemSizeToFitIsEnabled
        /** 用于缩放功能的修改字体的属性 */
        jc_tabItemTextZoomBigEnabled

---------------------------------------------------------------------------------------------------------------
