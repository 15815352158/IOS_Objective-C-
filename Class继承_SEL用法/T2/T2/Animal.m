//
//  Animalities.m
//  T2
//
//  Created by ZhouMS on 2020/6/12.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@implementation Animal
@synthesize  method;
- (void) print
{
    NSLog(@"I'm is %@,age:%d,weight:%d kg\n",self.name,self.age,self.weight);
    
   
}

- (void) roar
{
    NSLog(@"我是一个动物，我会叫唤！\n");
}



@end


@implementation Cat
-(id) initWith:(NSString *)name age:(int)age weight:(int) weight
{
    self=[super init];
    if(self)
    {
        self.name=name;
        self.age=age;
        self.weight=weight;
    }
    
    return self;
}
-(void) roar  //重写父类的函数
{
   
    NSLog(@"咪咪叫\n");
}

-(void) skill //新增加一个技能函数
{
    NSLog(@"我会捉老鼠\n");
}
-(void) print : (NSString *)friendName //重载print函数
{
    [super print];
    NSLog(@"我的好朋友是%@\n",friendName);
}

-(void) testMetho:(NSString *)funName
{
    self.method=NSSelectorFromString(funName);//通过方法名称获取方法的选择器
    if(self.method)
    {
        @try {  //这里的@try @catch @finall与Java类似
            NSString*  methodName=NSStringFromSelector(self.method); //通过选择器反过来获取方法名称
                   
                   NSLog(@"MethodName:%@ is exists\n",methodName);
                   
                   
                   [self performSelector:self.method withObject:@"黑猫"];
        } @catch (NSException *exception) {
            NSLog(@"Exceprion:%@:%@:%@\n",[exception name],[exception reason],[exception userInfo]);
        } @finally {
            NSLog(@"=====finally===\n");
        }
       
         
        
    }
    else
    {
        NSLog(@"MethodName:%@ is't exists\n",funName);
    }
}

-(NSInteger) sumSkill:(NSInteger) a andTo:(NSInteger)b andTo:(NSInteger)c
{
    NSLog(@"a:%d,b:%d,c:%d\n",a,b,c);
    return a+b+c;
}

-(void) setName:(NSString*) name andAge:(NSInteger)age
{
    self.name=name;
    self.age=(int)age;
    NSLog(@"=改名为：%@，age：%d\n",self.name,self.age);
}
-( void *)performSelector:(SEL)aSelector withObjects:(NSArray *)objects
 {
     //通过选择器获取方法的签名
   NSMethodSignature *methodSignature = [[self class] instanceMethodSignatureForSelector:aSelector];
  if(methodSignature == nil)
    {
      @throw [NSException exceptionWithName:@"抛异常错误" reason:@"没有这个方法，或者方法名字错误" userInfo:nil];
      return nil;
    }
    else
    {
      NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
      [invocation setTarget:self];
      [invocation setSelector:aSelector];
      //签名中方法参数的个数，内部包含了self和_cmd，所以参数从第3个开始
      NSInteger  signatureParamCount = methodSignature.numberOfArguments - 2;
      NSInteger requireParamCount = objects.count;
      NSInteger resultParamCount = MIN(signatureParamCount, requireParamCount);
     for (NSInteger i = 0; i < resultParamCount; i++) {
         id item=objects[i];
         
         if([item isKindOfClass:[NSNumber class]])
         {
             NSNumber*  obj = objects[i];
             NSInteger obj1=[obj intValue];
             
             NSLog(@"obj:%d\n",obj1);
             [invocation setArgument:&obj1 atIndex:i+2];
         }
         else if([item isKindOfClass:[NSString class]])
         {
             NSString*  str = objects[i];
             [invocation setArgument:&str atIndex:i+2];
         }
         else
         {
             @throw [NSException exceptionWithName:@"performSelector" reason:@"未实现的类型，请添加此类型判断！" userInfo:@"zhoums@gaosd.com"];
         }        
        
       //设置参数
     }
        
    [invocation invoke];// 执行函数指针调用
   //返回值处理
   void * callBackObject ;
   if(methodSignature.methodReturnLength)//有返回值
   {
       [invocation getReturnValue:&callBackObject]; //获取返回值
   }
   return callBackObject;
  }
}

@end
