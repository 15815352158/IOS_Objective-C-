//
//  my.h
//  T1
//
//  Created by ZhouMS on 2020/6/11.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#ifndef my_h
#define my_h
@interface Calc:NSObject
{
    int d;//这里默认的访问权限为：@protected
@public
    int age;
    int a;
@package //同一个目录下的文件可以访问它
    NSString* name;

}

@property(nonatomic) int a,b,c; //定义属性
@property NSString * message;  //定义message属性，类的实现里面并没有@synthesize
                               // 所以会自动生成一个带下划线的成员 _message;

-(int) sum: (int)aa andTo: (int)bb;
-(int) sub: (int)aa : (int)bb;
-(void) print;

// 这个函数是上面message属性的get函数， 所以返回值必须与上面属性定义一致，在其中想要设置message属性，必须只能操作带下划线的成员_message;
-(NSString *)message;
@end
#endif /* my_h */
