//
//  main.m
//  MyProtocol
//
//  Created by ZhouMS on 2020/6/21.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        TestClass *testClass=[TestClass new];
        [testClass usb];
        [testClass com];
        
        [testClass tcp];
        [testClass udp];
        [testClass print];
        
       // [testClass broadcast];  //@optional定义的函数，可以不用实现，如果没有实现，不能调用
        
        
        TestMyProto *testMyProto=[ TestMyProto new];
        testMyProto->TestClassDelegate=testClass; //设置委托
        [testMyProto conUsb];
        
        TestProto  *testProto=[TestProto new];
        
        testProto.proto=testMyProto;
        
        [ testProto.proto spi];
        [ testProto.proto usb];
        [ testProto.proto com];
        
        [testProto connTcp:testClass];
        
    }
    return 0;
}
