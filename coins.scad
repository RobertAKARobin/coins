module rounded(w, h, r, fn){
  d = r * 2;
  module c(){
    circle(r = r, $fn = fn);
  }
  hull()translate([r, r, 0]){
    translate([0, 0, 0])c();
    translate([w-d, 0, 0])c();
    translate([w-d, h-d, 0])c();
    translate([0, h-d, 0])c();
  };
}

rounded(85, 65, 10, 30);
