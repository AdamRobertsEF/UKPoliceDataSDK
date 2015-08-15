//
//  UKPoliceDataAPIManager.m
//  UKPoliceDataAPI-SDK

#import "UKPoliceDataAPIManager.h"
#import "Categories/NSArray+Poly.h"

static NSString * kAPIBaseURI = @"https://data.police.uk/api/";
static NSString * kAPIEndpointForces = @"forces"; // No params
static NSString * kAPIEndpointStreetLevelCrime = @"crimes-street/all-crime";
static NSString * kAPIEndpointStreetCrimeDates = @"crimes-street-dates"; // No params
static NSString * kAPIEndpointStreetLevelOutcomes = @"outcomes-at-location";
static NSString * kAPIEndpointCrimeAtLocation = @"crimes-at-location";
static NSString * kAPIEndpointCrimeAtNoLocation = @"crimes-no-location";
static NSString * kAPIEndpointCrimeCategories = @"crime-categories";
static NSString * kAPIEndpointCrimeLastUpdated = @"crime-last-updated";
static NSString * kAPIEndpointOutcomeForSpecificCrime = @"outcomes-for-crime";
static NSString * kAPIEndpointLocateNeighbourhood = @"locate-neighbourhood";
static NSString * kAPIEndpointStopAndSearchStreet = @"stops-street";
static NSString * kAPIEndpointStopAndSearchLocation = @"stops-at-location";
static NSString * kAPIEndpointStopAndSearchNoLocation = @"stops-no-location";
static NSString * kAPIEndpointStopAndSearchByForce = @"stops-force";

static NSString * kAPIForcesMethodNeighbourhoods = @"neighbourhoods";
static NSString * kAPIForcesMethodPeople = @"people";
static NSString * kAPIForcesMethodEvents = @"events";
static NSString * kAPIForcesMethodBoundary = @"boundary";

static NSString *kHTTPMethodGet = @"GET";
static NSString *kHTTPMethodPost = @"POST";
static NSString *kHTTPMethodDelete = @"DEL";

@implementation UKPoliceDataAPIManager

+(instancetype)sharedManager{
    static dispatch_once_t pred;
    static UKPoliceDataAPIManager *sharedManager = nil;
    
    dispatch_once(&pred, ^{
        sharedManager = [[UKPoliceDataAPIManager alloc] init];
    });
    return sharedManager;
}

#pragma mark forces related

-(void)requestForces:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",kAPIBaseURI,kAPIEndpointForces]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)requestSpecificForce:(NSString*)force completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",kAPIBaseURI,kAPIEndpointForces,force]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)requestSeniorOfficersForSpecificForce:(NSString*)force completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@/people",kAPIBaseURI,kAPIEndpointForces,force]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

#pragma mark crime related

-(void)streetLevelCrimeSearchByPolyArray:(NSArray *)poly completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSString *polyString = [poly polyFromCLLocationArray];
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?poly=%@",kAPIBaseURI,kAPIEndpointStreetLevelCrime,polyString]];
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet  completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)streetLevelCrimeSearchByPoly:(NSString*)poly completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?poly=%@",kAPIBaseURI,kAPIEndpointStreetLevelCrime,poly]];
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet  completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)streetLevelCrimeSearchByLocation:(CLLocationCoordinate2D)location year:(NSString*)year completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?lat=%f&lng=%f&date=%@",kAPIBaseURI,kAPIEndpointStreetLevelCrime,location.latitude,location.longitude,year]];
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)streetLevelCrimeSearchByLocation:(CLLocationCoordinate2D)location date:(NSDate*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?lat=%f&lng=%f&date=%li-%li",kAPIBaseURI,kAPIEndpointStreetLevelCrime,location.latitude,location.longitude,(long)components.year,(long)components.month]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)crimeSearchByLocation:(CLLocationCoordinate2D)location date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?lat=%f&lng=%f&date=%@",kAPIBaseURI,kAPIEndpointCrimeAtLocation,location.latitude,location.longitude,date]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)crimeSearchByPoly:(NSString *)poly date:(NSString *)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?poly=%@&date=%@",kAPIBaseURI,kAPIEndpointCrimeAtLocation,poly,date]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)crimeSearchByPolyArray:(NSArray *)poly date:(NSString *)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSString *polyString = [poly polyFromCLLocationArray];
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?poly=%@&date=%@",kAPIBaseURI,kAPIEndpointCrimeAtLocation,polyString,date]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)crimeCategoriesByDate:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
   
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?date=%@",kAPIBaseURI,kAPIEndpointCrimeCategories,date]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)crimeLastUpdated:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",kAPIBaseURI,kAPIEndpointCrimeLastUpdated]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)crimeOutcomes:(NSString*)CrimeID completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",kAPIBaseURI,kAPIEndpointOutcomeForSpecificCrime,CrimeID]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

#pragma mark neighbourhoods related

-(void)neighbourhoodsByForce:(NSString*)force completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",kAPIBaseURI,force,kAPIForcesMethodNeighbourhoods]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)specificNeighbourhoodByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",kAPIBaseURI,force,neighbourhood]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)specificNeighbourhoodBoundryByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",kAPIBaseURI,force,neighbourhood]];
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)specificNeighbourhoodTeamByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@/%@",kAPIBaseURI,force,neighbourhood,kAPIForcesMethodPeople]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)specificNeighbourhoodEventsByForce:(NSString*)force neighbourhood:(NSString*)neighbourhood completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@/%@",kAPIBaseURI,force,neighbourhood,kAPIForcesMethodEvents]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}
-(void)locationNeighbourhoodByLocation:(CLLocationCoordinate2D)location completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?q=%f,%f",kAPIBaseURI,kAPIEndpointLocateNeighbourhood,location.latitude,location.longitude]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)stopAndSearchByLocation:(CLLocationCoordinate2D)location date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?lat=%f&lng=%f&date=%@",kAPIBaseURI,kAPIEndpointStopAndSearchStreet,location.latitude,location.longitude,date]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)stopAndSearchByLocationID:(NSString*)locationID date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?location_id=%@&date=%@",kAPIBaseURI,kAPIEndpointStopAndSearchLocation,locationID,date]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)stopAndSearchByNoLocationUsingForce:(NSString*)force date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?force=%@&date=%@",kAPIBaseURI,kAPIEndpointStopAndSearchNoLocation,force,date]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)stopAndSearchByForce:(NSString*)force date:(NSString*)date completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@?force=%@&date=%@",kAPIBaseURI,kAPIEndpointStopAndSearchByForce,force,date]];
    
    [self APIRequestWithURL:URL HTTPMethod:kHTTPMethodGet completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

-(void)nextPagination:(NSURL*)paginationURL completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    [self APIRequestWithURL:paginationURL HTTPMethod:kHTTPMethodGet  completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler];
}

#pragma mark Networking

-(void)APIRequestWithURL:(NSURL*)url HTTPMethod:(NSString*)httpMethod completion:(APIRequestCompletionBlock)requestCompletedHandler failure:(APIRequestFailureBlock)requestFailureHandler{
    
    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:url];
    
    [mutableRequest setHTTPMethod:httpMethod];
  
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]
                                         initWithRequest:request];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);

        requestCompletedHandler(operation,request,responseObject);

    } failure:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        
        requestFailureHandler(operation,responseObject);

    }];
    
    [operation start];

}


@end
