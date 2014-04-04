//
//  TMContatosNoMapaViewController.h
//  Contatos
//
//  Created by ios4311 on 01/04/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TMContatosNoMapaViewController : UIViewController <MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (weak , atomic) NSMutableArray *contatos;

@end
