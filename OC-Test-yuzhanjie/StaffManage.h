//
//  StaffManage.h
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StaffFatory.h"

//员工管理类
@interface StaffManage : NSObject

//查看所有员工
- (void)showALlStaffInfo;

//根据手机号查看指定员工信息
- (void)showStaffInfoByTelNum:(NSString*)telNum;

//创建单例员工管理对象
+ (instancetype)defaultStaffManage;

@end
