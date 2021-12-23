// Chain class

// A Chain is composed of several rectangles or Links.
// Chains are oriented horizontally and are always
// centered about the vertical axis, regardless of the
// dimensions of its links or the number thereof.
class Chain {
  
  private ArrayList<Link> links;       // set of links comprising this chain
  private PVector dim;                 // width and length of chain, including gaps between links
  
  private float INIT_LINK_WIDTH;        // useful for computing length and color
  private float FINAL_LINK_WIDTH;        // useful for computing length and color
  
  private float gapWidth;              // width of gaps between links
  private float gapWidthRatio = 0.2;   // width of gaps vs width of links
  
  private color col;
  
  Chain(float y, PVector dim, int numLinks, color c ) {
    
    int numGaps = numLinks - 1;
    
    // Set link dimensions
    float linkHeight = dim.y;
    float linkWidth =  dim.x / (numLinks + gapWidthRatio * numGaps);
    INIT_LINK_WIDTH = linkWidth;
    FINAL_LINK_WIDTH = linkWidth / 4;    // double length is arbitrary, can change whenever
    
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
      links.get(l).setCenter(new PVector(linkMidpX, linkMidpY));
      links.get(l).setDim(new PVector(linkWidth, linkHeight));
  
      linkMidpX += linkWidth + gapWidth;
    }
    
    // Set chain color
    this.col = c;
  }
  
  void render() {
    for (Link l : links) {
      l.render(); 
    }
  }
  
  void update(PVector mousePos) {
    
    // Given current mouse position, update the length of each Link in Chain
    updateLinkWidths(mousePos);
    
    // Given new Link widths, update Chain dimensions
    updateSelf();
    
    // Given new Chain dimensions, determine where each Link should go to preserve gaps
    updateLinkPos();
  }
  
  // Helper function to update width of this Chain's Links given
  // current mouse position.
  void updateLinkWidths(PVector mousePos) {
    for (Link l : this.links) {
      PVector linkPos = l.getCenter();
      float lerpFactor = linearFunc(linkPos, mousePos); // how much to dilate link
      float newWidth = lerp(this.INIT_LINK_WIDTH, this.FINAL_LINK_WIDTH, lerpFactor);
      l.setWidth(newWidth);
      
      color gray = color(100, 100, 100, 50);
      color newColor = lerpColor(gray, this.col, lerpFactor);
      l.setColor(newColor);
    }
  }
  
  // Helper function for determining how much to dilate
  // a link and what to color it given the current mouse
  // position. Realizes the function:
  // f(x) = max( - slope * x + 1, 0 )
  float linearFunc(PVector linkPos, PVector mousePos) {
    float dist = PVector.dist(linkPos, mousePos);
    float slope = -1.0/200;
    return max((slope * dist) + 1, 0);
  }
  
  // Updates Chain's dimensions to match the lengths of its
  // constituent links. Chain's width must accomodate both the
  // link widths and the gaps between those links.
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
 
 // Updates position of Links within Chain
 void updateLinkPos() {
   float linkMidPt = width / 2 - this.dim.x / 2;
   
   for (Link l : this.links) {
     linkMidPt += l.getWidth() / 2;
     
     l.setCenterX(linkMidPt);
     
     linkMidPt += l.getWidth() / 2 + this.gapWidth;
     
   }
 }
 
 // Setters
 // ----------------------
 void setColor(color c) {
   this.col = c;  
 }
  
}
