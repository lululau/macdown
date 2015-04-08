//
//  MPSplitViewController.m
//  MacDown
//
//  Created by 刘 向 on 15/4/8.
//  Copyright (c) 2015年 Tzu-ping Chung . All rights reserved.
//

#import "MPSplitViewController.h"

@implementation MPSplitViewController

-(void)splitView:(NSSplitView *)sender resizeSubviewsWithOldSize:
(NSSize)oldSize
{
    CGFloat dividerThickness = [sender dividerThickness];
    NSRect leftRect  = [[[sender subviews] objectAtIndex:0] frame];
    NSRect rightRect = [[[sender subviews] objectAtIndex:1] frame];
    NSRect newFrame  = [sender frame];
    
    leftRect.size.height = newFrame.size.height;
    leftRect.origin = NSMakePoint(0, 0);
    NSView *sidebar = [[sender subviews] objectAtIndex:0];
    if(sidebar.hidden) {
        rightRect.size.width = newFrame.size.width - dividerThickness;
    } else {
        rightRect.size.width = newFrame.size.width - leftRect.size.width
    - dividerThickness;
        rightRect.origin.x = leftRect.size.width + dividerThickness;

    }
    rightRect.size.height = newFrame.size.height;
    
    [[[sender subviews] objectAtIndex:0] setFrame:leftRect];
    [[[sender subviews] objectAtIndex:1] setFrame:rightRect];
}

@end
