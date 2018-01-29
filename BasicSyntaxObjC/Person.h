//
//  Person.h
//  BasicSyntaxObjC
//
//  Created by Артур Азаров on 29.01.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
@public NSString * name;
}
@property (nonnull) NSString * thirdName;
- (void)printGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time;
+ (instancetype)personWithName:(NSString*)name;
- (instancetype)initWithName:(NSString*) name;
@end
