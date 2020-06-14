//
//  NSString+Url.m
//  Categroy
//
//  Created by ZhouMS on 2020/6/14.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#import <Foundation/Foundation.h>

@implementation NSString(Url)

-(BOOL) isUrl
{
    if([self hasPrefix:@"http://"])
    {
        return YES;
    }
    return NO;
}

- (unichar)characterAtIndex:(NSUInteger)index
{
    NSLog(@"重写characterAtIndex函数");
    return 'a';
}

@end

@implementation NSString(Email)

-(BOOL) isEmail
{
    NSRange range=[self rangeOfString:@"@"];
    if(range.location>0 && range.location<[self length]-1)
    {
        return YES;
    }
  
    return NO;
}

@end

