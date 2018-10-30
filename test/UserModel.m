//
//  UserModel.m
//  test
//
//  Created by niuy on 16/12/6.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import "UserModel.h"
#import <JSONModel/JSONModel.h>

@implementation ThreeModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}

@end
@implementation scoreModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES; //
}

 
@end

@implementation UserModel
/*
+ (BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
*/
+ (JSONKeyMapper*)keyMapper{
    // 映射路径 : 属性名
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                      // @"ios-shouyelunbo": @"shouyelunbo",
                                                       @"ios-recommendation.link_object": @"object"
                                                       //@"ios-shouyelunbo.link_object.nick": @"nick"
                                                       }];
}
@end

/*
+ (JSONKeyMapper*)keyMapper{
        // 映射路径 : 属性名
        return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                           @"result.sk": @"eng_score"
                                                           }];
    }

}
*/

