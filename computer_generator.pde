
// Let's generate computers!

// Global variables!
PImage layer_1;
PImage layer_2;
PImage layer_3;
PImage layer_4;

int d;
String alphabet;
String[] names;

float m;
float n;

void setup() {

    colorMode(HSB, 100, 100, 100);
    size(625, 750);
    background(0, 0, 100, 0);
    
    d = 0;
    alphabet = "abcdefghijklmnopqrstuvwxyz";
    names = loadStrings("Names.txt");

    layer_1 = loadImage("layer_1.png");
    layer_2 = loadImage("layer_2.png");
    layer_3 = loadImage("layer_3.png");
    layer_4 = loadImage("layer_4.png");

    layer_1.resize(625, 750);
    layer_2.resize(625, 750);
    layer_3.resize(625, 750);
    layer_4.resize(625, 750);
    
    // Generate computers from names.
    for (int d = 0; d < names.length; d++) {
        for (int i = 0; i < alphabet.length(); i+=1) {
            if (names[d].toLowerCase().charAt(0) == alphabet.charAt(i)) {
                m = 100 / 27 * i;
            }
            if (names[d].length() >= 2) {
                if (names[d].toLowerCase().charAt(1) == alphabet.charAt(i)) {
                    n = 100 / 27 * i;
                }
            }
        }
        
        tint(0);
        image(layer_1, 0, 0);
        tint(int(n), 90, 60);
        image(layer_2, 0, 0);
        tint(int(m), 60, 90);
        image(layer_3, 0, 0);
        tint(0, 0, 99);
        image(layer_4, 0, 0);
        saveFrame("output/computer-" + names[d] + ".png");
    }
}
