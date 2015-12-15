//
//  NSString+YZJNSStringExtensionMethods.m
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import "NSString+YZJNSStringExtensionMethods.h"

@implementation NSString (YZJNSStringExtensionMethods)

-(BOOL)isLegalTelNum
{
    if (self.length != 11 || [self characterAtIndex:0] != '1') {
        return NO;
    }
    
    for (int i = 1; i < self.length; i++) {
        if (isnumber([self characterAtIndex:i]) == 0) {
            return NO;
        }
    }
    
    return YES;
}
@end
