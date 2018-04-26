//
//  ViewController.m
//  CollectionViewGallery
//
//  Created by Tyler Boudreau on 2018-04-25.
//  Copyright © 2018 Tyler Boudreau. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import "MyHeaderViewCollectionReusableView.h"
#import "Images.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (readonly,nonatomic)NSMutableArray <UIImage *> *imageArray;
@property (readonly,nonatomic)NSMutableArray <NSString *> *headersArr;
@property (strong,nonatomic) UICollectionViewFlowLayout *defaultLayout;
@property (strong,nonatomic) UICollectionViewFlowLayout *switchLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.myCollectionView reloadData];
    
    [self setupSwitchLayout];
    [self setupdefaultLayout];
    
    self.myCollectionView.collectionViewLayout=self.defaultLayout;
    
    _headersArr = [[NSMutableArray alloc] initWithObjects:@"Cats", @"Pepe", @"Will Ferrell",@"Office", nil];
    

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(self.myCollectionView.collectionViewLayout==self.defaultLayout){
        return self.imageArray.count;
        
    }else if (self.myCollectionView.collectionViewLayout==self.switchLayout){
    }
    return 2;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{

    
    
    CollectionViewCell *cell=[self.myCollectionView dequeueReusableCellWithReuseIdentifier:@"cell1"
                                                                              forIndexPath:indexPath];
    UIImage *images = [self.imageArray objectAtIndex: indexPath.row];
    cell.myImagecell1.image=images;

    return cell;

}
-(void)setupdefaultLayout{
    
    self.defaultLayout = [[UICollectionViewFlowLayout alloc]init];
    self.defaultLayout.itemSize = CGSizeMake(100, 150);
    self.defaultLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.defaultLayout.minimumInteritemSpacing=5;
    self.defaultLayout.minimumLineSpacing=10;
    self.defaultLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
    self.defaultLayout.headerReferenceSize = CGSizeMake(200, 0);
    
}


-(void)setupSwitchLayout{
    self.switchLayout = [[UICollectionViewFlowLayout alloc]init];
    self.switchLayout.itemSize = CGSizeMake(100, 75);
    self.switchLayout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    self.switchLayout.minimumLineSpacing=5;
    self.switchLayout.minimumInteritemSpacing=5;
    self.switchLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    
    // IF THERES A CRASH REMOVE THIS
    self.switchLayout.headerReferenceSize = CGSizeMake(160, 100);

    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.myCollectionView.collectionViewLayout == self.defaultLayout){
        return 1;
    }else{
        return 4;
    }
    
    }



- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    
    [kind isEqualToString:UICollectionElementKindSectionHeader];
    MyHeaderViewCollectionReusableView *header = [self.myCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
withReuseIdentifier:@"Myheader"forIndexPath:indexPath];
    
    header.label.text = [self.headersArr objectAtIndex: indexPath.section];
        
    return header;
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray <UIImage *> *)imageArray{


    
    
    
    return @[
             [UIImage imageNamed:@"cat1"],
             [UIImage imageNamed:@"cat2"],
             [UIImage imageNamed:@"cat3"],
             [UIImage imageNamed:@"will1"],
             [UIImage imageNamed:@"will2"],
             [UIImage imageNamed:@"will3"],
             [UIImage imageNamed:@"frog1"],
             [UIImage imageNamed:@"frog2"],
             [UIImage imageNamed:@"frog3"],
             [UIImage imageNamed:@"office1"],
             [UIImage imageNamed:@"office2"],
             [UIImage imageNamed:@"office3"],

             
             
             ];
}



- (IBAction)segmentedAction:(id)sender {


    UICollectionViewLayout *nextLayout;
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            nextLayout=self.defaultLayout;
            break;
            
        case 1:
            nextLayout=self.switchLayout;
            
            break;
            
        default:
            break;
    }
    
    [self.myCollectionView setCollectionViewLayout:nextLayout animated:YES];
    
    [_myCollectionView reloadData];
    
    
}



@end
