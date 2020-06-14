//
//  Animal.h
//  T2
//
//  Created by ZhouMS on 2020/6/12.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#ifndef Animal_h
#define Animal_h
@interface Animal :NSObject

/*
 1、strong修饰的对象引用计数器+1。
 2、copy我们都知道，
 [不可变对象 copy]-->浅拷贝，得出不可变对象
 [可变对象 copy]-->深拷贝，得出不可变对象
 所以使用copy属性时，不管你给我传的是可变对象还是不可变对象，我本身持有的都是不可变副本。引用计数器+1
 3、assign主要用于修饰基础数据类型（例如NSInteger）和C数据类型（int,float,double,char等)，也可以修饰对象。但当修饰对象时，对象释放后会出现野指针。引用计数器不+1。
 4、weak只能修饰对象，主要用于避免循环引用。引用计数器不+1。和assign不同的是对象释放后会自动将指针置为nil。

 链接：https://www.jianshu.com/p/1e3606e35e2c
 */
@property (nonatomic,assign) int age;
@property (nonatomic,assign) int weight;
@property (nonatomic,copy)  NSString * name;

@property (nonatomic,assign) SEL method; //选择器： 相当于定义函数指针
-(void) print;  //显示方法
-(void) roar ;  //吼方法
@end


@interface  Cat : Animal

-(id) initWith:(NSString *)name age:(int)age weight:(int) weight;
-(void) roar;
-(void) skill;
-(void) print : (NSString *)friendName;

-(void) testMetho:(NSString *)funName; //测试选择器
-(NSInteger) sumSkill:(NSInteger) a andTo:(NSInteger)b andTo:(int)c; //假设这个猫学会了加法运算

-(void) setName:(NSString*) name andAge:(NSInteger)age;

//定义一个能执行传入两个以上参数的选择器
- ( void *)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
@end
#endif /* Animal_h */
