//
//  NSArray+Poly.m
//  UKPoliceDataSDK
//
//  Created by Adam Roberts on 13/08/2015.
//  Copyright (c) 2015 Enigmatic Flare Ltd. All rights reserved.
//

#import "NSArray+Poly.h"
#import "NSArray+CLLocation.h"

@implementation NSArray (Poly)


+(NSString*)polyFromCLLocationArray:(NSArray*)array{
     return [[array coordinateArrayFromCLLocationArray] polyFromCoordinateArray];
}

-(NSString *)polyFromCLLocationArray{
    return [NSArray polyFromCLLocationArray:self];
}

+(NSString*)polyFromCoordinateArray:(NSArray*)array{
    return [array componentsJoinedByString:@":"];
}

-(NSString*)polyFromCoordinateArray{
    return [NSArray polyFromCoordinateArray:self];
}

@end