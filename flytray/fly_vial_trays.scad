include <fly_tray_modules.scad>

// tray-related parameters
rows = 8;   // vial rows 
cols = 8;   // vial cols

// Generate vial tray
a = tray_dims(tr_h, v_dia, rows, cols);

union(){
    vial_tray(a, v_dia, v_red=0.55);
    base_tray(a, sd_th, m_th, m_d);    
}
