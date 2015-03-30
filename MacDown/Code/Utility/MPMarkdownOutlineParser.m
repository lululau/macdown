//
//  MPMarkdownOutlineParser.m
//  OCTest
//
//  Created by 刘 向 on 15/3/27.
//  Copyright (c) 2015年 刘 向. All rights reserved.
//

#import "MPMarkdownOutlineParser.h"

@implementation MPMarkdownOutlineParser

- (MPTreeNode *)parse:(NSString *)md
{
    MPTreeNode *root = [[MPTreeNode alloc] initWithContent:@"" andParent:nil];
    root.level = 0;
    MPTreeNode *prev = root;
    NSArray *headings = [self extractHeadings:md];
    for (MPMarkdownHeading *heading in headings) {
        NSInteger depth = prev.level - heading.level;
        if (depth < -1 && root != prev) {
            continue;
        }
        MPTreeNode *parent = [prev ancestor:depth];
        MPTreeNode *thisNode = [[MPTreeNode alloc] initWithContent:heading andParent:parent];
        thisNode.level = heading.level;
        [parent.children addObject:thisNode];
        prev = thisNode;
    }
    return root;
}

- (NSArray *)extractHeadings:(NSString *)md
{
    NSMutableArray *result = [NSMutableArray arrayWithObjects: nil];
    md = [[NSRegularExpression regularExpressionWithPattern:@"^```.*?\n```\n"
                                                    options:(NSRegularExpressionAnchorsMatchLines | NSRegularExpressionDotMatchesLineSeparators) error:NULL]
          stringByReplacingMatchesInString:md options:0 range:NSMakeRange(0, md.length) withTemplate:@""];
    NSRegularExpression * regexp = [NSRegularExpression regularExpressionWithPattern:@"^(#+)(.*)" options:NSRegularExpressionAnchorsMatchLines error:NULL];
    for (NSTextCheckingResult *m in [regexp matchesInString:md options:0 range:NSMakeRange(0, md.length)]) {
        NSString *l = [md substringWithRange:[m rangeAtIndex:1]];
        NSInteger lev = l.length;
        NSString *c = [md substringWithRange:[m rangeAtIndex:2]];
        [result addObject:[[MPMarkdownHeading alloc] initWithContent:c level:lev]];
    }
    return result;
}

@end