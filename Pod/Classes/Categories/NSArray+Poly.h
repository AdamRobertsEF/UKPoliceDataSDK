//
//  NSArray+Poly.h
//  UKPoliceDataSDK
//
//  Created by Adam Roberts on 13/08/2015.
//  Copyright (c) 2015 Enigmatic Flare Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Poly)

+(NSString*)polyFromCoordinateArray:(NSArray*)array;
-(NSString*)polyFromCoordinateArray;
+(NSString*)polyFromCLLocationArray:(NSArray*)array;
-(NSString*)polyFromCLLocationArray;

@end