//
//  BasicControls.m
//  MasterplateDemo
//
//  Created by Jason on 16/4/27.
//  Copyright © 2016年 com.JaosnQJl. All rights reserved.
//

#import "BasicControls.h"



@implementation BasicControls

+(UITextField  *)createTextFieldWithframe:(CGRect)rect
                                addTarget:(id)target
                                    image:(UIImage *)backGroudImage
{
    UITextField  *textFiled = [[UITextField  alloc]initWithFrame:rect];
    textFiled.backgroundColor = [UIColor  clearColor];
    //解决placeholder在IOS6.0和IOS6.0以上显示兼容问题
    textFiled.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textFiled setBackground:backGroudImage];
    textFiled.delegate = target;
    return textFiled;
}

+ (void)setLeftImageViewToTextField:(UITextField *)field
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,0, field.frame.size.height)];
    [view setBackgroundColor:[UIColor clearColor]];
    [field setLeftView:view];
    [field setLeftViewMode:UITextFieldViewModeAlways];
}

+(UIImage *)getImageWithName:(NSString *)imageName type:(NSString *)imageType
{
    //    NSString *imagePath =[[NSBundle mainBundle] pathForResource:imageName ofType:imageType];
    UIImage *image =[UIImage imageNamed:imageName];
    
    return image;
}

+(UILabel  *)createLabelWithframe:(CGRect)rect
                            image:(UIImage *)backGroudImage
{
    UILabel  *label = [[UILabel alloc] initWithFrame:rect];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentLeft;
    //    [label setBackgroundColor:[UIColor colorWithPatternImage:backGroudImage]];
    return label;
    
}
+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:15];
    return label;
}

+(void)showAlertWithMsg:(NSString *)msg
              addTarget:(id)target
{
    UIAlertView  *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:msg delegate:target cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

+(UIImageView  *)createImageViewWithframe:(CGRect )rect
                                    image:(UIImage *)backGroudImage
{
    UIImageView  *imageView  = [[UIImageView  alloc]initWithFrame:rect];
    imageView.backgroundColor = [UIColor  clearColor];
    [imageView setImage:backGroudImage];
    return imageView;
    
}

+ (UIImageView *)creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)name{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image  = [UIImage imageNamed:name];
    return imageView;
    
}

+(UIButton  *)createButtonWithTitle:(NSString *)title
                              frame:(CGRect )rect
                              image:(UIImage *)backGroudImage
{
    UIButton  *button = [UIButton  buttonWithType:UIButtonTypeCustom];
    [button setFrame:rect];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:backGroudImage forState:UIControlStateNormal];
    return button;
    
}
+ (UIButton *)creatButtonWithFrame:(CGRect)frame target:(id)target sel:(SEL)sel tag:(NSInteger)tag image:(NSString *)name title:(NSString *)title{
    UIButton *button = nil;
    if (name) {
        //创建图片按钮
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor=[UIColor whiteColor];
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        if (title) {//图片标题按钮
            [button setTitle:title forState:UIControlStateNormal];
        }
        
    }else if (title) {
        //创建标题按钮
        button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    button.frame = frame;
    button.tag = tag;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (BOOL)isNewVersion
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *lastVersion = [defaults objectForKey:SYSTEMVERSION];
    
    //获取当前版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[SYSTEMVERSION];
    
    if (![currentVersion isEqualToString:lastVersion])
    {
        [defaults setObject:currentVersion forKey:SYSTEMVERSION];
        return YES;
    }else
    {
        return NO;
    }
}
/** 设置圆形图片(放到分类中使用) */
//+ (UIImage *)cutCircleImage {
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
//    // 获取上下文
//    CGContextRef ctr = UIGraphicsGetCurrentContext();
//    // 设置圆形
//    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
//    CGContextAddEllipseInRect(ctr, rect);
//    // 裁剪
//    CGContextClip(ctr);
//    // 将图片画上去
//    [self drawInRect:rect];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//}
@end
