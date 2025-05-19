// special variables
$fa = 1;
$fs = 0.4;

// Key parameters (dictates LED focus onto the object plane)
lens_distance = 50; // Distance of the lens/ring from the object (focus) plane
lens_dia = 36; // Diameter of the lens;
led_count = 4; // N

// Ring parameters
ring_thickness = 10;
ring_height = 6;

// LED parameters
led_d = 5;
led_h = 8;  // actual height is 7.7 mm
led_base_d = 5.8;
led_base_h = 2; // actual height is 1 mm

// Adjustment screw
s_dia = 3.3;  // M4 or 8-32 screws
s_count = 0; // automatically decide

// Other parameters
tol = 0.15;  // general tolerance
led_line = 0.6; // decides if LED center is at outer dia (led_line=1) or innner dia (lend_line=0) or somewhere in between (led_line=0.5 -> at center between outside and inside cylinder). 

// computed parameters
ring_dia = lens_dia + 2*ring_thickness;
led_r = lens_dia/2+ring_thickness*led_line;
screws = get_screws(s_count, led_count);
// LED angle
ang = atan(lens_distance / (lens_dia/2 + ring_thickness));
echo("LED angle set at ", ang, " deg");

// Make camera ring

difference(){
    // get LED location, angle
    r = led_r;
    a = (90-ang);
    led_a = 360/led_count;
    
    // make ring
    makeRing(ring_dia, lens_dia, ring_height); 
    
    // make leds
    for(i=[0:led_a:360]){
        x=r*cos(i);
        y=r*sin(i);
        translate([x,y,0])
            rotate(a=a,v=cross([x,y,0],[0,0,1]))
                makeLed(led_d, led_h, led_base_d, led_base_h, ring_thickness);
    }
    
    
    // get screw location, angle
    screw_a = 360/screws;
    
    // make adjustment screwholes
    for(i=[led_a/2:screw_a:360]){
        x=r*cos(i);
        y=r*sin(i);
        translate([x,y,ring_height/2])
            rotate(a=90,v=cross([x,y,0],[0,0,1]))
                cylinder(h=1.5*ring_thickness, d=s_dia+tol, center=true);

    }

}


// make the ring
module makeRing(d1, d2, h){
    translate([0,0,h/2])
        difference(){
            cylinder(h = h, d = d1, center = true);
            cylinder(h = h+tol, d = d2, center = true);
        }
}

//module makeLed(a, v){
module makeLed(d, h, b_d, b_h, th){
    union(){
        //add LED base
        translate([0,0,b_h/2]) 
            cylinder(h=b_h+tol, d=b_d+tol, center=true);
        //add LED
        translate([0,0,b_h+h/2]) 
            cylinder(h=h+tol, d=d+tol, center=true);
        //add extra cylinders on top and bottom of LED
        translate([0,0,-th/2]) 
            cylinder(h=th+tol, d=b_d+tol, center=true);
        translate([0,0,b_h+h+th/2]) 
            cylinder(h=th+tol, d=d+tol, center=true);        
    }
}

function get_screws(screws, leds) = 
    (screws!=0) 
    ? screws 
    : (leds % 4 == 0)
      ? 4
      : 3;