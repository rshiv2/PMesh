// Link class

// A Link is just a single unit of a chain. The only
// parameters that can be customized are the Link's 
// dimensions, center, and color. These parameters
// are generally set by the Chain object that owns
// this particular link.
class Link {
  
   private PVector dim;       // dimension
   private PVector center;    // center
   private color col;         // color
   
   // Constructors
   // ------------
   Link() {}
   
   Link(PVector pos, PVector dim, color col) {
     this.center = pos;
     this.dim = dim;
     this.col = col;
   }
   
   // Renders the link given its current parameters
   void render() {
     rectMode(CENTER);    // <-- TAKE NOTE OF THE RECTMODE!
     fill(0);
     stroke(this.col);
     rect(this.center.x, this.center.y, this.dim.x, this.dim.y);
   }
   
   // Setters
   // ----------------
   void setDim(PVector dim) {
     this.dim = dim;
   }
   
   void setWidth(float len) {
     this.dim.x = len; 
   }
   
   void setCenter(PVector pos) {
     this.center = pos;
   }
   
   void setCenterX(float x) {
     this.center.x = x; 
   }
   
   void setColor(color c) {
     this.col = c;  
   }
   
   // Getters
   // ----------------
   PVector getDim() {
     return this.dim; 
   }
   
   float getWidth() {
     return this.dim.x;  
   }
   
   PVector getCenter() {
     return this.center;  
   }
   
   float getCenterX() {
     return this.center.x;
   }
   
   
}
