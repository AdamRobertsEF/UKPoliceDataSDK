//
//  NSArray+Poly.m
//  UKPoliceDataSDK
//
//  Created by Adam Roberts on 13/08/2015.
//  Copyright (c) 2015 Enigmatic Flare Ltd. All rights reserved.
//

#import "NSArray+Poly.h"

@implementation NSArray (Poly)

+(NSString*)polyFromCoordinateArray:(NSArray*)array{
    return [array componentsJoinedByString:@":"];
}

-(NSString*)polyFromCoordinateArray{
    return [NSArray polyFromCoordinateArray:self];
}

@end
