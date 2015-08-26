//
//  CLLocation+String.m
//  UKPoliceDataSDK
//

#import "CLLocation+String.h"

@implementation CLLocation (String)

-(NSString*)coordinateString{
    return CLLocationCoordinate2DMakeString(self.coordinate.latitude, self.coordinate.longitude);
}

NSString* CLLocationCoordinate2DMakeString(CLLocationDegrees latitude, CLLocationDegrees longitude){
    return [NSString stringWithFormat:@"%f,%f",latitude,longitude];
}
@end
