//
//  YZJXMLPaserTelNum.m
//  OC-Test-yuzhanjie
//
//  Created by yuzhanjie on 15/12/13.
//  Copyright (c) 2015年 yuzhanjie. All rights reserved.
//

#import "YZJXMLPaserTelNum.h"
#import "NSString+YZJNSStringExtensionMethods.h"

@implementation YZJXMLPaserTelNum
{
    NSMutableString *_url;
    NSMutableString *_att;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _url = [[NSMutableString alloc]initWithString:@"http://api.k780.com:88/?app=phone.get&phone=13800138000&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=xml"];
    }
    return self;
}

-(void)paserTelNum:(NSString *)telNum
{
    if ([telNum isLegalTelNum])
    {
        NSRange rag = [_url rangeOfString:@"phone="];
        [_url replaceCharactersInRange:NSMakeRange(rag.location+rag.length, 11) withString:telNum];
        
        NSXMLParser *paser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:_url]];
        
        paser.delegate = self;
        
        [paser parse];
    }
    else
    {
        self.telAddr(@"手机号码不正确");
    }
}


//通过NSPaser的方式解析XML接口文件,实现协议解析数据的方法
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    //
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"att"]) {
        _att = [[NSMutableString alloc]init];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (_att != nil) {
        [_att appendString:string];
    }
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if (_att != nil) {
        self.telAddr(_att);
        _att = nil;
    }
}


- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    //
}


@end
