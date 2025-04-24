// special variables
$fa = 1;
$fs = 0.4;

// Key parameters (dictates LED focus onto the object plane)
lens_distance = 110; // Distance of the lens/ring from the object (focus) plane
lens_dia = 30; // Diameter of the lens
led_count = 4; // N

// Other ring parameters
ring_thickness = 10; // based on led dia
ring_width= 6; 
ring_tol = 0.5;

// LED parameters
led_tol = 0.15;
led_d = 5;
led_h = 6;  // actual height is 7.7 mm
led_base_d = 5.8;
led_base_h = ring_width-led_h; // actual height is 1 mm
led_h_tol = 0.5*ring_width;

// compute LED angle
ang = atan(lens_distance / (lens_dia/2 + ring_thickness));
echo("LED angle set at ", ang, " deg");



difference(){
    r = lens_dia/2+ring_thickness*0.6;
    a = (90-ang);
    makeRing(); 
    for(i=[0:360/led_count:360]){
        x=r*cos(i);
        y=r*sin(i);
        translate([x,y,0])
            makeLed(a, v=cross([x,y,0],[0,0,1]));
    }
}


// make the ring
module makeRing(){
    // static declarations
    d=lens_dia+ring_tol; 
    w=ring_width; 
    th=ring_thickness;
    tol = w*0.01; // for clean difference
    
    translate([0,0,w/2])
        difference(){
            cylinder(h = w, d = d+2*th, center = true);
            cylinder(h = w+tol, d = d, center = true);
        }
}

module makeLed(a, v){
    // static declarations
    d = led_d;
    h = led_h;
    b_d = led_base_d;
    b_h = led_base_h;
    tol = led_tol;
    h_tol = led_h_tol;
    
    // operations
    rotate(a=a,v=v){
    union(){
        translate([0,0,b_h/2]) 
            cylinder(h=b_h+h_tol, d=b_d+tol, center=true);
        translate([0,0,b_h+h/2]) 
            cylinder(h=h+h_tol, d=d+tol, center=true);
    }
}
}