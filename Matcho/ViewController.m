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
@property (nonatomic, strong) PlayingCard *card;
@property (weak, nonatomic) IBOutlet UILabel *suiteCounter;
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
        
        PlayingCard *customCard1 = [[PlayingCard alloc] initWithSuit:@"♣" andRank:8];
        [_deck addCard:customCard1];
        
        PlayingCard *customCard2 = [[PlayingCard alloc] initWithSuit:@"X" andRank:777];
        [_deck addCard:customCard2];
        
	}
	return _deck;
}

- (IBAction)resetDeckButtonTaped:(UIButton *)sender {
    self.deck = nil;
    self.card = nil;
    self.deck = [[PlayingCardDeck alloc] init];
    self.card = [self.deck drawRandomCard];
    
    [self setCardTitleColorAndCounter];
    [self.cardButton setTitle:self.card.contents forState:UIControlStateNormal];
    [self.cardButton setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
    
    self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
    clubsCounter = 0;
    diamondsCounter = 0;
    heartsCounter = 0;
    spadesCounter = 0;
    self.suiteCounter.text = [self getSuiteConterStatistics:clubsCounter andDiamonds:diamondsCounter andHearts:heartsCounter andSpades:spadesCounter];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
    self.suiteCounter.text = [self getSuiteConterStatistics:clubsCounter andDiamonds:diamondsCounter andHearts:heartsCounter andSpades:spadesCounter];
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
        
        self.card = [self.deck drawRandomCard];
        
        if (self.card) {
            [self setCardTitleColorAndCounter];
            self.leftCardsCounter.text = [NSString stringWithFormat:@"left cards: %li", [self.deck getCountCards]];
            self.suiteCounter.text = [self getSuiteConterStatistics:clubsCounter andDiamonds:diamondsCounter andHearts:heartsCounter andSpades:spadesCounter];
            
            [sender setTitle:self.card.contents forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        } else {
            self.leftCardsCounter.text = @"Desk is empty";
        }
		
	}
}

- (void) setCardTitleColorAndCounter {
    if (self.card.suit == clubs) {
        clubsCounter++;
        [self.cardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else if (self.card.suit == diamonds) {
        diamondsCounter++;
        [self.cardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
    } else if (self.card.suit == hearts) {
        heartsCounter++;
        [self.cardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    } else if (self.card.suit == spades) {
        spadesCounter++;
        [self.cardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    } else {
        [self.cardButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
}

@end
