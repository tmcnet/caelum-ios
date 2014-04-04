//
//  TMContatosNoMapaViewController.m
//  Contatos
//
//  Created by ios4311 on 01/04/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import "TMContatosNoMapaViewController.h"
#import "TMContato.h"

@interface TMContatosNoMapaViewController ()

@end

@implementation TMContatosNoMapaViewController


- (id)init
{
    self = [super init];
    if (self) {
        UIImage * img = [UIImage imageNamed:@"Mapa-Contatos"];
        UITabBarItem * tabBar = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:img tag:2];
        self.tabBarItem = tabBar;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapa.delegate = self;
    self.navigationItem.title = @"Mapa";
    MKUserTrackingBarButtonItem *btnTracking = [[MKUserTrackingBarButtonItem  alloc] initWithMapView:self.mapa];
    self.navigationItem.leftBarButtonItem = btnTracking;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.mapa addAnnotations:self.contatos];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.mapa removeAnnotations:self.contatos];
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *pool = @"pool";
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pool];
    
    if(!pin) {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pool];
    } else {
        pin.annotation = annotation;
    }
    pin.pinColor = MKPinAnnotationColorGreen;
    pin.canShowCallout = YES;
    
    TMContato *contato = (TMContato *) annotation;
    
    if(contato.imagem) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
        imageView.image = contato.imagem;
        pin.leftCalloutAccessoryView = imageView;
    }
    
    return pin;
}

@end
