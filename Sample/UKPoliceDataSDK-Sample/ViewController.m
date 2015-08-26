//
//  ViewController.m
//  UKPoliceDataSDK-Sample
//
//  Created by Adam Roberts on 13/08/2015.
//  Copyright (c) 2015 Enigmatic Flare. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[UKPoliceDataAPIManager sharedManager] requestForces:^(AFHTTPRequestOperation *operation, NSURLRequest *request, id JSON) {
        NSLog(@"JSON:%@",JSON);
    } failure:^(AFHTTPRequestOperation *operation, id JSON) {
        
    }];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
