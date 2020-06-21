//
//  Myprotocol.m
//  MyProtocol
//
//  Created by ZhouMS on 2020/6/21.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyProtocol.h"

@implementation TestClass:NSObject

@synthesize a,b;
- (void) usb
{
    self.a=3;
    NSLog(@"===usb====\n");
}
- (void) com
{
    self.b=4;
    NSLog(@"===com====\n");
}
-(void)tcp
{
    NSLog(@"===tcp==a=%d=\n",self.a);
}

-(void)udp
{
    NSLog(@"===udp==b=%d=\n",self.b);
}

 - (void) print
{
    NSLog(@"===a=%d,b=%d=\n",self.a,self.b);
}

@end


@implementation TestProto: NSObject

  @synthesize proto;

//下面的函数定义相当于java中定义注册监听
-(void)connTcp: (id<Net>) proto
{
    [proto tcp];
}


@end


@implementation TestMyProto:NSObject
@synthesize a;
- (void) usb
{
    self.a=3;
    NSLog(@"===usb====\n");
}
- (void) com
{
    NSLog(@"===com====\n");
}
-(void) spi
{
    NSLog(@"===spi====\n");
}

-(void) conUsb
{
    if(self->TestClassDelegate)
    {
        NSLog(@"===连接委托中的Usb====\n");
        [self->TestClassDelegate usb];
    }
}

@end



