
ArrayList<Chain> chains;
int CHAIN_WIDTH = 400;
int CHAIN_HEIGHT = 15;
int CHAIN_GAP = 5;

void setup() {
  size(640, 400);
  frameRate(30);
  
  PVector dim = new PVector(CHAIN_WIDTH, CHAIN_HEIGHT);
  int numLinks = 10;
  
  int numChains = 10;
  chains = new ArrayList<Chain>();
  float y = height / 2 - (numChains * CHAIN_HEIGHT + (numChains - 1) * CHAIN_GAP) / 2;
  
  for (int i = 0; i < numChains; i++) {
    chains.add(new Chain(y, dim, numLinks));
    y += CHAIN_HEIGHT + CHAIN_GAP;
  }
}

void draw() {
  background(0);
  int currMouseX = mouseX;  // all chains should render according to same mouse position
  int currMouseY = mouseY;  // all chains should render according to same mouse position
  for (Chain c : chains) {
    c.update(new PVector(currMouseX, currMouseY));
    c.render();
  }
}
