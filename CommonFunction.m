//
//  CommonFunction.m
//  ENPodcastReader
//
//  Created by wusj on 13-8-20.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "CommonFunction.h"

@implementation CommonFunction

/*
 * 获取指定宽度字符的高度
 *
 */
+ (float)heightForString:(NSString *)string withFontSize:(float)fontSize andWidth:(float)width {
    CGSize sizeToFit = [string sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    return sizeToFit.height;
}

@end
