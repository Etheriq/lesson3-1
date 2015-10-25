//
//  ViewController.m
//  Matcho
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) PlayingCardDeck *deck;
@property (weak, nonatomic) IBOutlet UILabel *suiteConter;
@property (weak, nonatomic) IBOutlet UILabel *leftCardsCounter;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (nonatomic) int clubsCounter;
@property (nonatomic) int diamondsCounter;
@property (nonatomic) int heartsCounter;
@property (nonatomic) int spadesCounter;

@end

@implementation ViewController

@synthesize clubsCounter, diamondsCounter, heartsCounter, spadesCounter;

- (instancetype) init {
    self = [super init];
    if (self) {
        clubsCounter = 0;
        diamondsCounter = 0;
        heartsCounter = 0;
        spadesCounter = 0;
    }
    
    return self;
}

- (PlayingCardDeck *)deck {
	if (!_deck) {
		_deck = [[PlayingCardDeck alloc] init];
	}
	return _deck;
}

- (IBAction)resetDeckButtonTaped:(UIButton *)sender {
    self.deck = nil;
    self.deck = [[PlayingCardDeck alloc] init];
    self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
    clubsCounter = 0;
    diamondsCounter = 0;
    heartsCounter = 0;
    spadesCounter = 0;
    self.suiteConter.text = [self getSuiteConterStatistics:clubsCounter andDiamonds:diamondsCounter andHearts:heartsCounter andSpades:spadesCounter];
}

- (void) viewDidLoad {
    self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
    self.suiteConter.text = [self getSuiteConterStatistics:clubsCounter andDiamonds:diamondsCounter andHearts:heartsCounter andSpades:spadesCounter];
}

- (NSString *) getSuiteConterStatistics: (int) clubs andDiamonds: (int) diamonds andHearts: (int) hearts andSpades: (int) spades {
    return [NSString stringWithFormat: @"Clubs ♣: %i, Diamonds ♦: %i, Hearts ♥: %i, Spades ♠: %i", clubsCounter, diamondsCounter, heartsCounter, spadesCounter];
}

//Трефы — clubs ♣
//Бубны — diamonds ♦
//Червы — hearts ♥
//Пики — spades ♠

- (IBAction)cardButtonTapped:(UIButton *)sender {
	if ([sender.currentTitle length]) {
		[sender setTitle:@""
				forState:UIControlStateNormal];
		[sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
						  forState:UIControlStateNormal];
	} else {
        
        PlayingCard *card = [self.deck drawRandomCard];
        
        if (card) {
            self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
            
            if (card.suit == clubs) {
                clubsCounter++;
                [self.cardButton setBackgroundColor:[UIColor grayColor]];
            } else if (card.suit == diamonds) {
                diamondsCounter++;
                [self.cardButton setBackgroundColor:[UIColor redColor]];
            } else if (card.suit == hearts) {
                heartsCounter++;
                [self.cardButton setBackgroundColor:[UIColor redColor]];
            } else {
                spadesCounter++;
                [self.cardButton setBackgroundColor:[UIColor grayColor]];
            }
            
            self.suiteConter.text = [self getSuiteConterStatistics:clubsCounter andDiamonds:diamondsCounter andHearts:heartsCounter andSpades:spadesCounter];
            
            [sender setTitle:card.contents
                    forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
        } else {
            self.leftCardsCounter.text = @"Desk is empty";
        }
		
	}
}

@end
