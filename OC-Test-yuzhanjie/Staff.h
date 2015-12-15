//
//  Staff.h
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import <Foundation/Foundation.h>

//员工类
@interface Staff : NSObject<NSCoding>

@property NSString *name;          //姓名
@property int age;                 //年龄
@property NSString *tel;           //电话号码
@property NSString *ID;            //身份证号
@property NSString *department;    //部门

//先按姓名排序，再按年龄排序
- (BOOL)sortRule:(Staff*)staff;


@end
