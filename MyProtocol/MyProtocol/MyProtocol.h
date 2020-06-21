//
//  MyProtocol.h
//  MyProtocol
//
//  Created by ZhouMS on 2020/6/21.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#ifndef Header_h
#define Header_h
/**
 1. 演示协议的定义
 2. 协议继承
 3. 类实现协议
 4. 委托的定义与调用
 5. 定义注册监听函数
 */

/**
 定义一个通信
 */
@protocol   Communication
@property int a; //协议中可以定义属性，但是不能定义字段成员，这里定义的
    //属性与java接口不一样，它并非静态只读变量，它和普通类定义属性完全一样

@required   //必须实现， 但是实际测试继承它的子类，也可以不用实现，只要不调用它就OK、但是会有警告
    - (void) usb;
    - (void) com;
@optional //可以不用实现， 如果没有实现不能调用
    - (void) print;

@end

//定义网络协议
@protocol Net
@property int b;
@required
-(void)tcp;
-(void)udp;

@optional
-(void) broadcast;
@end


//下面的TestClass继承NSObject类，并且遵循Communication,Net这两个协议
@interface TestClass:NSObject <Communication,Net>



@end

//定义协议MyProto，继承Communication
@protocol MyProto <Communication>

@required
 -(void) spi;
@end


@interface TestProto: NSObject

 // @property  MyProto* proto1; //不能按java的方式定义，不能用协议直接定义对象，或者对象指针
  @property  id<MyProto> proto;
//下面的函数定义相当于java中定义注册监听
-(void)connTcp: (id<Net>) proto ;


@end


@interface TestMyProto : NSObject <MyProto>
{
    
@public
    //下面定义TestClass的委托（代理）
    TestClass *TestClassDelegate;
}
-(void) conUsb;
@end




#endif /* Header_h */
