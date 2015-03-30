//
//  MPTreeNode.m
//  OCTest
//
//  Created by 刘 向 on 15/3/26.
//  Copyright (c) 2015年 刘 向. All rights reserved.
//

#import "MPTreeNode.h"

@implementation MPTreeNode
@synthesize content;
@synthesize children;
@synthesize level;

- (id) initWithContent:(id) c andParent:(MPTreeNode *)p
{
    if (self = [super init]) {
        content = c;
        children = [NSMutableArray arrayWithObjects:nil];
        self.parent = p;
    }
    return self;
}

- (MPTreeNode *)ancestor:(NSInteger)depth
{
    MPTreeNode *ances = self;
    for (int i = 0; i <= depth ; i++) {
        ances = ances.parent;
        if (ances.level == 0) {
            break;
        }
    }
    return ances;
}

- (void)setParent:(MPTreeNode *)p
{
    parent = p;
    if (! p) {
        level = 0;
    }
}

- (MPTreeNode *)parent
{
    return parent;
}


- (NSString *)description
{
    NSMutableString *result = [NSMutableString stringWithString:@""];
    [result appendString: [self indent]];
    [result appendString: [[self content] description]];
    [result appendString: @"\n"];
    for (MPTreeNode *child in self.children) {
        [result appendString:[child description]];
    }
    return result;
}

- (NSString *)indent
{
    NSMutableString *result = [NSMutableString stringWithString:@""];
    for (int i = 0; i < level; i++) {
        [result appendString:@"    "];
    }
    return result;
}

@end
