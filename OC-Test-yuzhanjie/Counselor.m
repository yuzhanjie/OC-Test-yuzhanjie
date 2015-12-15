//
//  Counselor.m
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import "Counselor.h"

@implementation Counselor


- (NSString *)description
{
     return [NSString stringWithFormat:@"【Counselor】name:%@,age:%d,tel:%@,ID:%@,department:%@", self.name,self.age,self.tel,self.ID,self.department];
}
@end
