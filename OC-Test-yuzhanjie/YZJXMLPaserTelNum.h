//
//  YZJXMLPaserTelNum.h
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import <Foundation/Foundation.h>

//第三方库，用来解析手机号码归属地
@interface YZJXMLPaserTelNum : NSObject<NSXMLParserDelegate>


//对外接口, 传入手机号码,通过block返回归属地信息
- (void)paserTelNum:(NSString*)telNum;

//使用block实现解析结果数据的回传
@property (copy) void (^telAddr)(NSString*);


@end
