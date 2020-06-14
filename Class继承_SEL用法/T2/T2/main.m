//
//  main.m
//  T2
//
//  Created by ZhouMS on 2020/6/12.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Animal.h"

/**
 1.本工程主要演示定义类，类的继承，重写，与重载函数
 2. 选择器类型（相当于函数指针） 用法， 和怎么通过它调用函数
 3. 自定义支持调用多个参数的performSelector
 */
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        
        Animal *anima=[Animal new];
        
        anima.age=2;
        anima.name=@"动物";
        anima.weight=8;
        
        [anima roar];
        [anima print];
        
        anima.method=@selector(print);
        
        [anima performSelector:anima.method];
        
        
        
        
        Cat * cat=[[Cat alloc] initWith:@"猫三" age:3 weight:4];
         
        [cat roar];
        [cat print];
        [cat skill];
        [cat print:@"花猫"];
        
        //下面都是通过选择器调用函数
        [cat performSelector:@selector(print) withObject:@"蓝猫"];
        
        [cat performSelector:@selector(print:) withObject:@"蓝猫"]; //注意：这里多了一个冒号，表明后面带有一个参数
        
        [cat testMetho:@"skill"];
        [cat testMetho:@"skill:"];
        [cat testMetho:@"print"];
        [cat testMetho:@"print:"];
        
        NSArray *arr=[NSArray arrayWithObjects:@1,@2,@3,nil];
        NSInteger ret=(NSInteger)[cat performSelector:@selector(sumSkill:andTo:andTo:) withObjects:arr];
    
        arr=[NSArray arrayWithObjects:@"猫咪",@3,nil];
        [cat performSelector:@selector(setName:andAge:) withObjects:arr];
        NSLog(@"ret:%ld\n",ret);
        
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
