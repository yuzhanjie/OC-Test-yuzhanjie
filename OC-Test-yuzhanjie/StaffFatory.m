//
//  StaffFatory.m
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import "StaffFatory.h"

@implementation StaffFatory

+ (Staff*)createStaffCategory:(NSString*)category
{
    Class cls = NSClassFromString(category);
    
    Staff *staff = [[cls alloc]init];
    
    return staff;
}


@end
