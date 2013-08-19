//
//  XMLPaster.m
//  ENPodcastReader
//
//  Created by 吴述军 on 13-8-11.
//  Copyright (c) 2013年 *** 吴述军  ***. All rights reserved.
//

#import "XMLPaster.h"
#import "GDataXMLNode.h"

@implementation XMLPaster


- (void)parserUser {
    //获取工程目录的xml文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //使用NSData对象初始化
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData  options:0 error:nil];
    
    //获取根节点（Users）
    GDataXMLElement *rootElement = [doc rootElement];
    
    //获取根节点下的节点（User）
    NSArray *users = [rootElement elementsForName:@"User"];
    
    for (GDataXMLElement *user in users) {
        //User节点的id属性
        NSString *userId = [[user attributeForName:@"id"] stringValue];
        NSLog(@"User id is:%@",userId);
        
        //获取name节点的值
        GDataXMLElement *nameElement = [[user elementsForName:@"name"] objectAtIndex:0];
        NSString *name = [nameElement stringValue];
        NSLog(@"User name is:%@",name);
        
        //获取age节点的值
        GDataXMLElement *ageElement = [[user elementsForName:@"age"] objectAtIndex:0];
        NSString *age = [ageElement stringValue];
        NSLog(@"User age is:%@",age);
        NSLog(@"-------------------");
    }
}


- (NSMutableArray *)parserPast {
    //获取工程目录的xml文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"past" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //使用NSData对象初始化
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData  options:0 error:nil];
    
    //获取根节点（Users）
    GDataXMLElement *rootElement = [doc rootElement];
    
    //获取根节点下的节点（User）
    NSArray *items = [((GDataXMLElement *) [[rootElement elementsForName:@"channel"] objectAtIndex:0]) elementsForName:@"item"];
    
    NSMutableArray *data = [[NSMutableArray alloc] initWithCapacity:0];
    for (GDataXMLElement *item in items) {
//        NSLog(@"=========%@", item);
        ESLItem *eslItem = [[ESLItem alloc] init];
        eslItem.title = [[[item elementsForName:@"title"] objectAtIndex:0] stringValue];
        eslItem.description = [[[item elementsForName:@"description"] objectAtIndex:0] stringValue];
        eslItem.pubDate = [[[item elementsForName:@"pubDate"] objectAtIndex:0] stringValue];
        eslItem.mp3Url = [[item attributeForName:@"url"] stringValue];
        eslItem.length = [[[item attributeForName:@"length"] stringValue] floatValue];
//        NSLog(@"title: [%@]", eslItem.title);
        [data addObject:eslItem];
        [eslItem release];
    }
    
    NSLog(@"count : %d", [data count]);
    return [data autorelease];

}

@end
