//
//  MPMarkdownHeading.m
//  OCTest
//
//  Created by 刘 向 on 15/3/27.
//  Copyright (c) 2015年 刘 向. All rights reserved.
//

#import "MPMarkdownHeading.h"

@implementation MPMarkdownHeading
@synthesize content;
@synthesize level;

- (id)initWithContent:(NSString *)c level:(NSInteger)l
{
    if (self = [super init]) {
        content = c;
        level = l;
    }
    return self;
}

- (NSString *)description
{
    return content;
}

@end