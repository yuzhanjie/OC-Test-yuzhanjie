//
//  StaffTelNumQuery.m
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/14.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import "StaffTelNumQuery.h"

@implementation StaffTelNumQuery


-(void)menu
{
    NSLog(@"*********员工通讯录手机号码归属地查询系统***********");
    NSLog(@"            1、查看员工通讯录名单                 ");
    NSLog(@"            2、根据员工手机号码查看归属地          ");
    NSLog(@"            3、退出系统                         ");
    NSLog(@"***********************************************");
    
    NSLog(@"输入选项(回车):");
    int i;
A:  scanf("%d",&i);
    
    if (1 == i) {
        StaffManage *sm = [StaffManage defaultStaffManage];
        [sm showALlStaffInfo];
        
        
        
        [self isContinue];
    }
    else if (2 == i)
    {
        NSLog(@"请输入要查询的员工手机号码:");
        char tel[20];
        scanf("%s",tel);
        NSString *telNum = [NSString stringWithFormat:@"%s",tel];
        
        //使用第三方库解析手机号码归属地
        YZJXMLPaserTelNum *p = [[YZJXMLPaserTelNum alloc]init];
        p.telAddr = ^(NSString* addr)
        {
            StaffManage *sm = [StaffManage defaultStaffManage];
            [sm showStaffInfoByTelNum:telNum];
            NSLog(@"telNum:%@--addr:%@",telNum,addr);
        };
        
        [p paserTelNum:telNum];
        
        
        
        [self isContinue];
    }
    else if (3 == i)
    {
        NSLog(@"谢谢使用!");
    }
    else
    {
        NSLog(@"输入错误,请重新输入:");
        goto A;
    }
}

- (void)isContinue
{
    char isGoon;
    
    NSLog(@"是否继续?(Y/N):");
    getchar();
    scanf("%c",&isGoon);
    
    if ('Y' == isGoon || 'y' == isGoon)
    {
        [self menu];
    }
    else
    {
        NSLog(@"谢谢使用!");
    }
}

//类方法提供测试接口
+ (void)test
{
    StaffTelNumQuery *s = [[StaffTelNumQuery alloc]init];
    
    [s menu];
}
@end
