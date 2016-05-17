//
//  main.m
//  liuliu
//
//  Created by kenny on 16/5/10.
//  Copyright © 2016年 honeywell. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Direction) {
    DirectionRight = 1,
    DirectionUp,
    DirectionLeft,
    DirectionDown
};
Direction d;
int posX;// = 4;
int posY;// = 2;

void printArray(char m[8][8]) {
    for(int i=0; i<8; i++) {
        for(int j=0; j<8; j++) {
            printf("%c",m[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void move1(char m[8][8]) {
    switch (d) {
        case 1: {
            if (posY == 7)
                return;
                
            for (int j = 7; j > posY; j--) {
                m[posX][j] = m[posX][j-1];
            }
            m[posX][posY] = '.';
            posY++;
        }
            break;
        case 2: {
            if (posX == 0)
                return;
            
            for (int i = 0; i < posX; i++) {
                m[i][posY] = m[i+1][posY];
            }
            m[posX][posY] = '.';
            posX--;
        }
            break;
        case 3: {
            if (posY == 0)
                return;
            
            for (int j = 0; j < posY; j++) {
                m[posX][j] = m[posX][j+1];
            }
            m[posX][posY] = '.';
            posY--;
        }
            break;
        case 4: {
            if (posX == 7)
                return;
            
            for (int i = 7; i > posX; i--) {
                m[i][posY] = m[i-1][posY];
            }
            m[posX][posY] = '.';
            posX++;
        }
            break;
        default:
            break;
    }
   
    
    printArray(m);
}

void moveN(char m[8][8], int n) {
    int i = 0;
    while (i < n && posX >=0 && posX < 8 && posY >=0 && posY < 8) {
        move1(m);
        i++;
    }
    printf("-------------------------\n");
    printArray(m);
}

void turnLeft() {
    if (d == 4) {
        d = 1;
    } else {
        d++;
    }
    
}

void turnRight() {
    if (d == 1) {
        d = 4;
    } else {
        d--;
    }
}

void turnBack() {
    if (d == 1) {
        d = 3;
    } else if (d == 2) {
        d = 4;
    } else if (d == 3) {
        d = 1;
    } else {
        d = 2;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        d = 1;
        posX = 2;//2
        posY = 3;//3
        char m[8][8];
        memset(m,'.',sizeof(m));
        m[0][5] = 'C';
        m[1][1] = 'P';
        m[1][4] = 'A';
        m[1][7] = 't';
        m[2][0] = 'D';
        m[2][3] = '>';
        m[2][4] = 'T';
        m[2][6] = 'P';
        m[2][7] = 'r';
        m[3][4] = 'a';
        m[3][5] = 'P';
        m[3][7] = 'P';
        m[4][0] = 'p';
        m[4][2] = 'd';
        m[4][4] = 'c';
        m[5][5] = 'p';
        m[5][7] = 'R';
        
        //printArray(m);
        
        move1(m);
        turnRight();
        moveN(m, 2);
        turnLeft();
        moveN(m, 2);
        moveN(m, 3);
        moveN(m, 3);
        turnLeft();
        move1(m);
        moveN(m, 2);
        turnBack();
        move1(m);
        turnLeft();
        move1(m);
        turnLeft();
        move1(m);
        move1(m);
        turnBack();
        turnRight();
        moveN(m, 3);
        turnLeft();
        moveN(m, 4);
        turnLeft();
        moveN(m, 5);
        turnRight();
        moveN(m, 2);
        turnRight();
        moveN(m, 9);
        turnRight();
        turnRight();
        moveN(m, 2);
        turnBack();
        move1(m);
        turnRight();
        moveN(m, 3);
        turnRight();
        move1(m);
        turnRight();
        move1(m);
        turnRight();
        move1(m);
        turnLeft();
        move1(m);
        turnLeft();
        moveN(m, 4);

        printf("--------------END----------------\n");
        printArray(m);
        
    }
    return 0;
}
