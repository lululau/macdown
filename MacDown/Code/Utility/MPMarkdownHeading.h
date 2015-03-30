//
//  MPMarkdownHeading.h
//  OCTest
//
//  Created by 刘 向 on 15/3/27.
//  Copyright (c) 2015年 刘 向. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPMarkdownHeading : NSObject {
    NSString *content;
    NSInteger level;
}

@property NSString *content;
@property NSInteger level;

- (id) initWithContent: (NSString *)content level: (NSInteger) level;
- (NSString *)description;

@end
