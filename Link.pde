// Link class

class Link {
   private PVector dim;
   private PVector pos;
   private color col;
   
   Link() {}
   
   Link(PVector pos, PVector dim, color col) {
     this.pos = pos;
     this.dim = dim;
     this.col = col;
   }
   
   void render() {
     
     rectMode(CENTER);    // <-- TAKE NOTE OF THE RECTMODE!
     fill(0);
     stroke(this.col);
     rect(this.pos.x, this.pos.y, this.dim.x, this.dim.y);
   }
   
   // Setters
   // ----------------
   void setDim(PVector dim) {
     this.dim = dim;
   }
   
   void setWidth(float len) {
     this.dim.x = len; 
   }
   
   void setPos(PVector pos) {
     this.pos = pos;
   }
   
   void setXPos(float x) {
     this.pos.x = x; 
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
   
   PVector getPos() {
     return this.pos;  
   }
   
   float getXPos() {
     return this.pos.x;
   }
   
   
}
