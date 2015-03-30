//
//  MPMarkdownOutlineParser.h
//  OCTest
//
//  Created by 刘 向 on 15/3/27.
//  Copyright (c) 2015年 刘 向. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MPMarkdownHeading.h"
#import "MPTreeNode.h"

@interface MPMarkdownOutlineParser : NSObject
- (MPTreeNode *)parse:(NSString *)md;
- (NSArray *)extractHeadings:(NSString *)md;
@end