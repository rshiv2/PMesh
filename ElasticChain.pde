
ArrayList<Chain> chains;

void setup() {
  size(640, 400);
  frameRate(30);
  
  // THESE VARIABLES ARE CUSTOMIZABLE!!
  // ----------------------------------
  int numLinks = 10;                      // number of links per chain
  int numChains = 10;                     // number of chains
  int chainWidth = 400;                   // width of each chain
  int chainHeight = 15;                   // height of each chain
  int gapWidth = 5;                       // width of gaps between chains
  color chainColor = color(240, 0, 255);  // color of chains
  // ----------------------------------
  
  PVector dim = new PVector(chainWidth, chainHeight);
  chains = new ArrayList<Chain>();
  float y = height / 2 - (numChains * chainHeight + (numChains - 1) * gapWidth) / 2;

  for (int i = 0; i < numChains; i++) {
    chains.add(new Chain(y, dim, numLinks, chainColor));
    y += chainHeight + gapWidth;
  }
}

void draw() {
  background(0);
  int currMouseX = mouseX;  // all chains should see the same mouse position
  int currMouseY = mouseY;  // all chains should see the same mouse position
  for (Chain c : chains) {
    c.update(new PVector(currMouseX, currMouseY));
    c.render();
  }
}
