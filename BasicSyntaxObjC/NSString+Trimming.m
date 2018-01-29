//
//  NSString+Trimming.m
//  BasicSyntaxObjC
//
//  Created by Артур Азаров on 29.01.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

#import "NSString+Trimming.h"

@implementation NSString (Trimming)
- (NSString *)aa_stringByTrimming {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
@end
