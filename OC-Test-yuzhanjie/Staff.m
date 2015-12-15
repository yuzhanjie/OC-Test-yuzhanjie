//
//  Staff.m
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import "Staff.h"

@implementation Staff


- (BOOL)sortRule:(Staff*)staff
{
    if ([self.name compare:staff.name] == NSOrderedDescending) {
        return YES;
    }
    else if ([self.name compare:staff.name] == NSOrderedSame && self.age > staff.age)
    {
        return YES;
    }
    
    return  NO;
}


//归档数据
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.tel forKey:@"tel"];
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeObject:self.department forKey:@"department"];
    [aCoder encodeInt:self.age forKey:@"age"];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.tel = [aDecoder decodeObjectForKey:@"tel"];
    self.ID = [aDecoder decodeObjectForKey:@"ID"];
    self.department = [aDecoder decodeObjectForKey:@"department"];
    self.age = [aDecoder decodeIntForKey:@"age"];
    
    return self;
}

@end
