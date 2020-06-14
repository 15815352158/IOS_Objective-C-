//
//  NSString+Url.h
//  Categroy
//
//  Created by ZhouMS on 2020/6/14.
//  Copyright © 2020 ZhouMS. All rights reserved.
//

#ifndef NSString_Url_h
#define NSString_Url_h

/*定义类别（分类）， 和定义类差不多，但是不能写继承父类， 这是在原有的NSString类上的扩展，圆括号内代表分类名称，不是尖括号
  只能添加方法，不能添加成员和属性
  添加的方法可以是全新的方法名称，也可以重写（执行的时候不确定执行原有的还是分类的，所以最好不要重写）和重载，但是对于NSString的子类无效
  可以添加多个分类
 */
@interface NSString(Url) //NSString的Url分类

-(BOOL) isUrl;
- (unichar)characterAtIndex:(NSUInteger)index;//重写函数
@end

@interface NSString(Email)//NSString的Email分类
-(BOOL) isEmail;
@end
#endif /* NSString_Url_h */
