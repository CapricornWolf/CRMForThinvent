//
//  BaseNaviController.m
//  ThinventBusinessCircle
//
//  Created by Jason on 16/4/27.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import "BaseNaviController.h"
#define KNormalNavBarBgColor ( [UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0] )
@interface BaseNaviController ()

@end

@implementation BaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBarButtonItemTheme];
    [self setupNavigationBarTheme];
}
- (void)setupNavigationBarTheme{
    
    self.navigationBar.barTintColor = ColorRGB(242, 88, 56);
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = ColorRGB(255, 255, 255);
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    self.navigationBar.titleTextAttributes = textAttrs;
    
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}
//设置UIBarButtonItem的主题
- (void)setupBarButtonItemTheme
{
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = ColorRGB(255,255,255);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态(disable)的文字属性
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)goBack
{
    [self popViewControllerAnimated:YES];
}

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [super popViewControllerAnimated:animated];
    return [self.viewControllers lastObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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