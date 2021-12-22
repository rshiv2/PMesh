// Chain class


class Chain {
  
  private ArrayList<Link> links;       // set of links comprising this chain
  private PVector dim;                 // width and length of chain, including gaps between links
  
  private float MIN_LINK_WIDTH;
  private float MAX_LINK_WIDTH;
  
  private float gapWidthRatio = 0.2;   // width of gaps vs width of links
  private float gapWidth;              // width of gaps
  
  Chain(float y, PVector dim, int numLinks ) {
    
    int numGaps = numLinks - 1;
    
    // Set link dimensions
    float linkHeight = dim.y;
    float linkWidth =  dim.x / (numLinks + gapWidthRatio * numGaps);
    MIN_LINK_WIDTH = linkWidth;
    MAX_LINK_WIDTH = linkWidth * 2;
    
    // Set chain dimensions
    float dimX = numLinks * linkWidth + numGaps * gapWidth;
    this.dim = new PVector(dimX, dim.y);
    gapWidth = linkWidth * gapWidthRatio;
    
    // Set position of midpoint of first link in chain
    float linkMidpX = width / 2 - dim.x / 2 + linkWidth / 2;
    float linkMidpY = y;

    // Add links to list
    links = new ArrayList<Link>();
    for (int l = 0; l < numLinks; l++) {
      links.add(new Link());
      links.get(l).setPos(new PVector(linkMidpX, linkMidpY));
      links.get(l).setDim(new PVector(linkWidth, linkHeight));
  
      linkMidpX += linkWidth + gapWidth;
    }
  }
  
  void render() {
    for (Link l : links) {
      l.render(); 
    }
  }
  
  void update(PVector mousePos) {
    updateLinkWidths(mousePos);
    updateSelf();
    updateLinkPos();
  }
  
  void updateLinkWidths(PVector mousePos) {
    for (Link l : this.links) {
      PVector linkPos = l.getPos();
      float lerpFactor = linearFunc(linkPos, mousePos); // how much to dilate link
      float newWidth = lerp(this.MIN_LINK_WIDTH, this.MAX_LINK_WIDTH, lerpFactor);
      l.setWidth(newWidth);
      
      color gray = color(100, 100, 100);
      color pink = color(240, 0, 255);
      color newColor = lerpColor(gray, pink, lerpFactor);
      l.setColor(newColor);
    }
  }
  
  float linearFunc(PVector linkPos, PVector mousePos) {
    float dist = PVector.dist(linkPos, mousePos);
    float slope = -200.0;
    return max((dist / slope) + 1, 0);
  }
  
  float rationalFunc(PVector linkPos, PVector mousePos) {
    
    float epsilon = 1;
    float a = 0.001;
    PVector diff = PVector.sub(linkPos, mousePos);
    return 1.0 / ( a * diff.magSq() + epsilon);
  }
  
  void updateSelf() {
    
    // compute new width of chain
    float totalWidth = 0.0;
    int numGaps = links.size() - 1;
    totalWidth += numGaps + this.gapWidth;
    
    for (Link l : this.links) {
      totalWidth += l.getWidth(); 
    }
    
    // use new width to update width of chain
    this.dim.x = totalWidth;
  }
 
 void updateLinkPos() {
   float linkMidPt = width / 2 - this.dim.x / 2;
   
   for (Link l : this.links) {
     linkMidPt += l.getWidth() / 2;
     l.setXPos(linkMidPt);
     
     linkMidPt += l.getWidth() / 2 + this.gapWidth;
     
   }
 }
  
}
