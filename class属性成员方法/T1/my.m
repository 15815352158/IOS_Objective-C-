//
//  my.m
//  T1
//
//  Created by ZhouMS on 2020/6/11.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "my.h"

@implementation Calc
{
    int c; //这里默认的访问权限为： @private
    
}
@synthesize a,b,c; //合成属性，告诉编译器生存set方法与get方法 ,注意get方法不加get前缀
    //调用set方法： [ self setA:3] ; 调用get方法： [self a];

-(int) sum: (int)aa andTo: (int)bb
{
    return aa+bb;
}
- (int) sub: (int)a : (int)b
{
    return a-b;
}

-(void) print
{
    NSLog(@"a:%d,b:%d,c:%d\n",a,b,c);
    
    // 成员函数内部访问属性，可以用->访问，不论它是否是成员变量
    NSLog(@"a:%d,b:%d,c:%d\n",self->a,self->b,self->c);
    
    self->d=66; //保护成员内部可以使用
}
@end
