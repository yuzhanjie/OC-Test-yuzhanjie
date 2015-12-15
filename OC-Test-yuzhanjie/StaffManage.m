//
//  StaffManage.m
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import "StaffManage.h"

@implementation StaffManage
{
    //数据源--保存员工信息
    NSMutableDictionary *_dataSource;
    
    //沙盒路径
    NSString *_home;
    
    //文件管理单例对象
    NSFileManager *_fm;
}

//创建单例对象
+(instancetype)defaultStaffManage
{
    static StaffManage *sm = nil;
    if (sm == nil) {
        sm = [[StaffManage alloc]init];
    }
    
    return sm;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataSource = [[NSMutableDictionary alloc]init];
        
        _home = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/staffData.txt"];

        _fm = [NSFileManager defaultManager];

        
        [self addStaffToFile];
    }
    return self;
}

//写入一组员工数据到文件
- (void)addStaffToFile
{
    if ([_fm fileExistsAtPath:_home] == NO)
    {
        [_fm createFileAtPath:_home contents:nil attributes:nil];
    
        //随机生成一组员工信息
        NSArray *arr = @[@"Teacher",@"Counselor"];
        int i = 0;
        while (i++ < 20) {
            int rand = arc4random() % 2;
            //通过工厂创建不同的员工
            Staff *staff = [StaffFatory createStaffCategory:arr[rand]];
            
            staff.name = [NSString stringWithFormat:@"qfxiao%c%c%c%c",arc4random()%25+'a',arc4random()%25+'a',arc4random()%25+'a',arc4random()%25+'a'];
            staff.age = arc4random() % 10 + 20;
            
            staff.ID = [NSString stringWithFormat:@"110120%d%.2d%.2d%.4d",arc4random()%10+1980,arc4random()%12+1,arc4random()%29+1,arc4random()%9999+1];
            
            staff.tel = [NSString stringWithFormat:@"138%.8d",arc4random()%99999999+1];

            NSString *dep = rand == 1 ? @"院校合作部" : @"教学部";
            staff.department = [NSString stringWithFormat:@"%@",dep];
            
            [self addStaff:staff];
        }
        
        //归档
        [self encodeStaffInfo];
    }
    
}

//添加员工
- (void)addStaff:(Staff*)staff
{
    [_dataSource setObject:staff forKey:staff.tel];
}


//查看所有员工
- (void)showALlStaffInfo
{
    //解归档
    [self decodeStaffInfo];
    
    
    NSMutableArray *staffInfo = [[NSMutableArray alloc]init];
    for (NSString *tel in _dataSource) {
        [staffInfo addObject:[_dataSource objectForKey:tel]];
    }
    //使用选择器将员工信息排序后输出
    [staffInfo sortUsingSelector:@selector(sortRule:)];
    
    
    //分类打印
    for (Staff *staff in staffInfo) {
        if ([staff isKindOfClass:[Teacher class]]) {
            NSLog(@"%@",staff);
        }
    }
    
    //分类打印
    for (Staff *staff in staffInfo) {
        if ([staff isKindOfClass:[Counselor class]]) {
            NSLog(@"%@",staff);
        }
    }
}

//根据手机号查看指定员工信息
- (void)showStaffInfoByTelNum:(NSString *)telNum
{
    [self decodeStaffInfo];
    
    NSLog(@"%@",[_dataSource objectForKey:telNum]);
}

//归档
- (void)encodeStaffInfo
{
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *aCoder = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [aCoder encodeObject:_dataSource forKey:@"dataSource"];
    [aCoder finishEncoding];
    [data writeToFile:_home atomically:YES];

}

//解归档
- (void)decodeStaffInfo
{
    NSData *data = [NSData dataWithContentsOfFile:_home];
    NSKeyedUnarchiver *aDecoder = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    _dataSource = [aDecoder decodeObjectForKey:@"dataSource"];
    [aDecoder finishDecoding];
}

@end
