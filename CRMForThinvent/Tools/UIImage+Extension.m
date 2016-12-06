//
//  UIImage+Extension.m
//  MasterplateDemo
//
//  Created by diudiu on 15/7/23.
//  Copyright (c) 2015年 diudiu. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
