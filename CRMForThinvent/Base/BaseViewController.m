//
//  BaseViewController.m
//  MyClassOver
//
//  Created by Jason on 16/4/27.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"

#define Wat_Default @"努力加载中..."
#define KNormalNavBarBgColor ( [UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1.0] )
@interface BaseViewController ()<MBProgressHUDDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) MBProgressHUD *hudView;
@property (strong,nonatomic) UIImageView *showImageViewbg;

@property (strong,nonatomic) UIImageView *showImageView;
@property (strong,nonatomic)UILabel *lbshowTip;

@end

@implementation BaseViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;//防止表偏移问题///
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.navigationController.viewControllers.count > 1) {
        self.leftbarItem = [[UIButton alloc] init];
        self.leftbarItem.frame  =CGRectMake(0, 44/2-15, 30, 30);
        [self.leftbarItem setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [self.leftbarItem addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftbarItem];
    }

    
}
- (void)backClick
{
    
    if (self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}
//创建转菊花视图
- (MBProgressHUD *)creatHUDViewWithView:(UIView *)view text:(NSString *)text
{
    MBProgressHUD *ph = [[MBProgressHUD alloc] initWithView:view];
    ph.delegate = self;
    return ph;
}

//显示菊花
- (void)showProgress
{
    [self showProgressTitle:Wat_Default];
}

//显示菊花 title
- (void)showProgressTitle:(NSString *)title
{
    if (self.hudView) {
        [_hudView setLabelText:title];
    }
    else
    {
        _hudView = [self creatHUDViewWithView:self.view text:title];
        [self.view addSubview:_hudView];
    }
    [self.view bringSubviewToFront:_hudView];
    [_hudView show:YES];
}

//隐藏菊花
- (void)hideProgress
{
    if (self.hudView) {
        [self.view bringSubviewToFront:_hudView];
        [_hudView hide:NO];
    }
}

- (void)hudWasHidden:(MBProgressHUD *)hud
{
    //    [hud removeFromSuperview];
    //    hud.hidden = YES;
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
////    [self.view endEditing:YES];
//}
//切换导航颜色
-(void)changeNavBg
{
    self.navigationController.navigationBar.barTintColor = KNormalNavBarBgColor;
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = ColorRGB(0, 0, 0);
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    //textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    self.navigationController.navigationBar.titleTextAttributes = textAttrs;
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs1= [NSMutableDictionary dictionary];
    textAttrs1[NSForegroundColorAttributeName] = ColorRGB(0,0,0);
    textAttrs1[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    //textAttrs1[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs1 forState:UIControlStateNormal];
    [self.leftbarItem setImage:[UIImage imageNamed:@"back-arrow"] forState:UIControlStateNormal];

    
}
//还原导航颜色
-(void)restoreNavBg
{
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = ColorRGB(255, 255, 255);
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    //textAttrs[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    self.navigationController.navigationBar.titleTextAttributes = textAttrs;
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs1= [NSMutableDictionary dictionary];
    textAttrs1[NSForegroundColorAttributeName] = ColorRGB(255,255,255);
    textAttrs1[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    //textAttrs1[NSShadowAttributeName] = [NSValue valueWithUIOffset:UIOffsetZero];
    [appearance setTitleTextAttributes:textAttrs1 forState:UIControlStateNormal];
    [self.leftbarItem setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

}

@end
