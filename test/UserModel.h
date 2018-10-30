//
//  UserModel.h
//  test
//
//  Created by niuy on 16/12/6.
//  Copyright © 2016年 niuy. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol scoreModel    //协议
@end
@protocol ThreeModel
@end


//次次model
@interface ThreeModel : JSONModel
@property (nonatomic,strong) NSString *city_name;
@end

// 次model
@interface scoreModel : JSONModel
//@property (nonatomic, strong) ThreeModel *sk;

//@property (nonatomic, strong) NSString *province;
//@property (nonatomic, strong) NSArray<ThreeModel> *citys;

//@property (nonatomic, strong) NSString *nick;
@property (nonatomic, strong) NSString *nick;



@end

// 主model
@interface UserModel : JSONModel
//@property (nonatomic, strong) NSString *resultcode;       // 一般
//@property (nonatomic, strong) NSArray<scoreModel> *result;  // model 嵌套数组

//@property (nonatomic, strong) NSArray *shouyelunbo;
@property (nonatomic, strong) NSArray<scoreModel> *object;
//@property (nonatomic, strong) NSString *nick;


@end
