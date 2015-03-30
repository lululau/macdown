//
//  MPTreeNode.h
//  OCTest
//
//  Created by 刘 向 on 15/3/26.
//  Copyright (c) 2015年 刘 向. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MPTreeNode : NSObject {
    id content;
    NSMutableArray *children;
    NSInteger level;
    __weak MPTreeNode *parent;
}

- (id)initWithContent:(id)content andParent:(MPTreeNode *)parent;
- (MPTreeNode *)ancestor:(NSInteger)depth;
- (NSString *)description;
@property id content;
@property NSMutableArray *children;
@property NSInteger level;
@property (weak) MPTreeNode *parent;
@end
