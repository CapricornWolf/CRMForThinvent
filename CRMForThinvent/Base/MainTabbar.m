//
//  MainTabbar.m
//  ThinventBusinessCircle
//
//  Created by Jason on 16/5/4.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import "MainTabbar.h"
#import "HomeViewController.h"

#import "BaseNaviController.h"
@interface MainTabbar ()

@end

@implementation MainTabbar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    //添加所有的子控制器
    [self addAllChildVcs];
    
    //创建tabbar
    [self addCustomTabBar];
}
- (void)addAllChildVcs
{
    //首页
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self addOneChildVc:homeVC title:@"首页" selectedImageName:@"home" unSelectedImageName:@"home1"];
    
}
- (void)addCustomTabBar
{
    // 创建tabbar
    UITabBar *customTabBar = [[UITabBar alloc] init];
    // 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChildVc:(UIViewController *)childVC title:(NSString *)title selectedImageName:(NSString *)selectedImageName unSelectedImageName:(NSString *)unSelectedImageName
{
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (iOS7) {
        //如果是iOS7以上的系统 就取消自动渲染功能
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    UITabBarItem *barItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:unSelectedImageName] selectedImage:selectedImage];
    [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName: ColorRGB(206, 37, 38)} forState:UIControlStateHighlighted];
    [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    
    childVC.view.backgroundColor = [UIColor whiteColor];
    childVC.tabBarItem = barItem;
    
    // 添加为tabbar控制器的子控制器
    BaseNaviController *nav = [[BaseNaviController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
