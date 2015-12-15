//
//  StaffFatory.h
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"
#import "Counselor.h"

//员工工厂类
@interface StaffFatory : NSObject

//传入员工类型字符串，采用工厂模式创建不同的员工
+ (Staff*)createStaffCategory:(NSString*)category;

@end
