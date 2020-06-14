//
//  main.m
//  T1
//
//  Created by ZhouMS on 2020/6/11.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "my.h"
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        
        Calc *calc=[Calc new];
        calc.a=1;
        calc.b=2;
       
        // calc->b=23;  //它是属性不是成员，所以在外部按成员访问出错
        
        calc->age=25;
        
      //  calc->c=53; //@private 访问出错
      //  calc->d=12; // @protected 访问出错
        calc->name=@"ZhouMS";// @package : 同一个目录下的文件可以访问它
        
          calc.c=3;  //点运算符按属性访问，已经声明为属性，所以没有问题
        
        [calc print];       
        
        
        NSLog(@"a+b=%d\n",[calc sum : calc.a andTo : calc.b]);
        NSLog(@"age:%d\n",calc->age);
        
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
