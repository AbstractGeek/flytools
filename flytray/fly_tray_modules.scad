// Contains all the necessary functions and parameters to make trays

// tray-related parameters
tr_h = 20; // mm; (should be approx food height)
sd_th = 1; // mm; 
m_th = 2; // mm; 
m_d = 10; // mm;

// vial-related parameters
v_dia = 25; // mm; vial diameter (add necessary buffer)

// bottle-related parameters
b_t_a = 55; // mm; bottle size (height same as others)
b_a = 57; // mm; effective bottle holder taking into account gaps

// base tray parameters
bs_th = 1.5; //mm; (base thickness)
bs_h = bs_th + 10; //mm; (height of base tray)

// functions
function tray_dims (h, i_a, rows, cols) = [rows*i_a, cols*i_a, h];
function tray_size (a,sd_th=sd_th) = a + [2*sd_th, 2*sd_th, 0];

// modules
module base_tray(a, sd_th, m_th, m_d){
    
    a_t = a + [2*sd_th, 2*sd_th, 0];
    
    // make side tray
    union() {
        difference(){
            cube(a_t, center=true);
            cube(a + [0,0,0.1], center=true);
        }
        
        translate([0,0,-a[2]/2+m_th/2]) mesh_sheet(a_t, m_th, m_d);
    }
    
}

module mesh_sheet(a, th, d){
    // makes mesh sheets
    
    // input wrangling
    l = is_list(a) ?  a[0] : a;
    w = is_list(a) ?  a[1] : a;
    
    // find how many meshes will fit inside this sheet
    n_l = floor(l / (d+th));
    n_w = floor(w / (d+th));
    

    // make mesh
    difference(){
        // base cube
        cube([l, w, th], center=true);
        
        trans = th+d;
        x_pos = [-(n_l/2)+0.5:1:(n_l/2)-0.5];
        y_pos = [-(n_w/2)+0.5:1:(n_w/2)-0.5];

        // subtract cubes to create mesh
        for (i=x_pos, j=y_pos)
            translate([i*trans, j*trans, 0]) cube([d,d,th+0.1], center=true);        
    }
}

module vial_tray(a, v_dia, v_red=0.5){
    // input wrangling
    rows = a[0]/v_dia;
    cols = a[1]/v_dia;
    
    trans = v_dia;
    x_pos = [-(rows/2)+0.5:1:(rows/2)-0.5];
    y_pos = [-(cols/2)+0.5:1:(cols/2)-0.5];
    
    // make holed cube
    difference(){
        cube(a, center=true);
        
        // subtract cylinders to create vial holes
        for (i=x_pos, j=y_pos)
            translate([i*trans, j*trans, 0]) cylinder(h=a[2]+0.1, d=v_dia, center=true); 
        
        // reduce material
        for (i=x_pos)
            translate([i*trans,0,0]) cube([v_red*v_dia,a[1]-v_dia, a[2]+0.1], center=true);
        
        for (j=y_pos)
            translate([0,j*trans,0]) cube([a[0]-v_dia, v_red*v_dia, a[2]+0.1], center=true);
        
    }    
}


module bottle_tray(a, b_a, b_t_a, v_red=0.8){
    // input wrangling
    rows = a[0]/b_a;
    cols = a[1]/b_a;
    
    trans = b_a;
    x_pos = [-(rows/2)+0.5:1:(rows/2)-0.5];
    y_pos = [-(cols/2)+0.5:1:(cols/2)-0.5];
    
    // make holed cube
    difference(){
        cube(a, center=true);
        
        // subtract cubes to create bottle holes
        for (i=x_pos, j=y_pos)
            translate([i*trans, j*trans, 0]) cube([b_t_a, b_t_a, a[2]+0.1],center=true);
        
        // reduce material
        for (i=x_pos)
            translate([i*trans,0,0]) cube([v_red*b_a,a[1]-b_a, a[2]+0.1], center=true);
        
        for (j=y_pos)
            translate([0,j*trans,0]) cube([a[0]-b_a, v_red*b_a, a[2]+0.1], center=true);
        
    }    
    
}

module tray_sides(a, th){
    
    // make side tray
    difference(){
        cube(a + [2*th, 2*th, 0], center=true);
        cube(a + [0,0,0.1], center=true);
        }
    
}