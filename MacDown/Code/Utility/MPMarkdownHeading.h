//
//  MPMarkdownHeading.h
//  OCTest
//
//  Created by 刘 向 on 15/3/27.
//  Copyright (c) 2015年 刘 向. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPMarkdownHeading : NSObject {
    NSString *originalContent;
    NSString *content;
    NSInteger level;
}

@property NSString *originalContent;
@property NSString *content;
@property NSInteger level;

- (id) initWithOriginalContent: (NSString *)oc content:(NSString *)c level: (NSInteger) level;
- (NSString *)description;

@end
