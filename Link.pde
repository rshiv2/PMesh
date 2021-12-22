// Link class

class Link {
   private PVector dim;
   private PVector pos;
   
   Link() {}
   
   Link(PVector pos, PVector dim) {
     this.pos = pos;
     this.dim = dim;
   }
   
   void render() {
     //shapeMode(CENTER);    // <-- TAKE NOTE OF THE SHAPEMODE!
     
     rectMode(CENTER);    // <-- TAKE NOTE OF THE RECTMODE!
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
