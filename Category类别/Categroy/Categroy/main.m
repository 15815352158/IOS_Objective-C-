//
//  main.m
//  Categroy
//
//  Created by ZhouMS on 2020/6/14.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NSString+Url.h"
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        NSString *str=@"http://www.gaosd.com";
        if([str isUrl])//调用Url分类中的函数
        {
            NSLog(@"It is URL!\n");
        }
        if(![str isEmail])//调用Email分类中的函数
        {
            NSLog(@"It is't Eamil !\n");
        }
        
        NSLog(@"==>%c", [str characterAtIndex:1]);//这里执行的不一定是分类的函数，所以最好不要用重写方法，因为执行不确定
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
