module card(w, l, t, h, r, fn){
  module rounded(w, l, r, fn){
    d = r * 2;
    module c(){
      circle(r = r, $fn = fn);
    }
    hull()translate([r, r, 0]){
      translate([0, 0, 0])c();
      translate([w-d, 0, 0])c();
      translate([w-d, l-d, 0])c();
      translate([0, l-d, 0])c();
    };
  }
  module component(f, z){
    translate([.5, l-.5, 0])linear_extrude(z)import(str(f, ".dxf"));
  }
  module card(){
    difference(){
      linear_extrude(h + t)rounded(w, l, r, fn);
      translate([0,0,t])color("red")component("blob", h);
      color("lime")component("holes", h);
    }
    color("aqua")component("edges", h + t);
  }
  module lid(){
    difference(){
      color("red")component("blob", t);
      color("aqua")component("edges", h);
    //  color("lime")component("holes", h);
    }
  }
  //card();
  lid();
}
card(86, 54, 1, 3, 3, 4);
