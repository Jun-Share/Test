//
//  NSArray+Common.m
//  ZMClient
//
//  Created by stevenlfg on 16/4/20.
//  Copyright © 2016年 Perch Communications. All rights reserved.
//

#import "NSArray+Common.h"

@implementation NSArray (Common)
- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}
@end
