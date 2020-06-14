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

-(int) sum: (int)aa andTo: (int)bb;
-(int) sub: (int)aa : (int)bb;
-(void) print;
@end
#endif /* my_h */
