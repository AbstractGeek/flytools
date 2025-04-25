include <fly_tray_modules.scad>

// tray-related parameters
rows = 4;   // vial rows 
cols = 4;   // vial cols

// Generate bottle tray
a = tray_dims(tr_h, b_a, rows, cols);

union(){
    bottle_tray(a, b_a, b_t_a, v_red=0.55);
    base_tray(a, sd_th, m_th, m_d);    
}
